import cv2
import numpy as np
import matplotlib.pyplot as plt
import os
import pytesseract
import imutils
import easyocr
import shutil
from plate_check import check_plate

def find_plate(img_name):
    plt.style.use('dark_background')
    imgname =  img_name
    filename = 'E:/SHS/third_project/SHS/second_project/car_manager/WebContent/testpicture/num_img/' + imgname + '.jpg'
    
    # img_ori = cv2.imread(filename)
    img_ori = img = cv2.imdecode(np.fromfile(filename, dtype=np.uint8), cv2.IMREAD_COLOR)
    
    height, width, channel = img_ori.shape
    
    # plt.figure(figsize=(12, 10))
    # plt.imshow(img_ori, cmap='gray')
    
    gray = cv2.cvtColor(img_ori, cv2.COLOR_BGR2GRAY)
    
    
    structuringElement = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
    
    imgTopHat = cv2.morphologyEx(gray, cv2.MORPH_TOPHAT, structuringElement)
    imgBlackHat = cv2.morphologyEx(gray, cv2.MORPH_BLACKHAT, structuringElement)
    
    imgGrayscalePlusTopHat = cv2.add(gray, imgTopHat)
    gray = cv2.subtract(imgGrayscalePlusTopHat, imgBlackHat)
    
    ##이미지출력
    # plt.figure(figsize=(12, 10))
    # plt.imshow(gray, cmap='gray')
    
    
    #노이즈 줄이기 위해
    # 이미지 구별하기 쉽게  (0, 255)
    kernel = np.ones((5, 5), np.uint8)
    result = cv2.morphologyEx(img, cv2.MORPH_OPEN, kernel)
    
    ##############################
    
    img_blurred = cv2.morphologyEx(gray, cv2.MORPH_CLOSE, kernel)
    img_blurred = cv2.morphologyEx(gray, cv2.MORPH_OPEN, kernel)
    img_blurred = cv2.GaussianBlur(gray, ksize=(5, 5), sigmaX=0)
    
    ##############################
    
    img_thresh = cv2.adaptiveThreshold(
        img_blurred, 
        maxValue=255.0, 
        adaptiveMethod=cv2.ADAPTIVE_THRESH_GAUSSIAN_C, 
        thresholdType=cv2.THRESH_BINARY_INV, 
        blockSize=19, 
        C=9
    )
    
    #출력
    # plt.figure(figsize=(12, 10))
    # plt.imshow(img_thresh, cmap='gray')
    #################
    #윤곽선
    
    contours, _ = cv2.findContours(
        img_thresh, 
        mode=cv2.RETR_LIST, 
        method=cv2.CHAIN_APPROX_SIMPLE
    )
    
    temp_result = np.zeros((height, width, channel), dtype=np.uint8)
    
    #출력
    # plt.figure(figsize=(12, 10))
    # plt.imshow(temp_result)
    
    cv2.drawContours(temp_result, contours=contours, contourIdx=-1, color=(255, 255, 255))
    
    
    # 컨투어의 사각형 범위 찾기
    
    temp_result = np.zeros((height, width, channel), dtype=np.uint8)
    
    contours_dict = []
    
    for contour in contours:
        x, y, w, h = cv2.boundingRect(contour)
        cv2.rectangle(temp_result, pt1=(x, y), pt2=(x+w, y+h), color=(255, 255, 255), thickness=2)
        
        # insert to dict
        contours_dict.append({
            'contour': contour,
            'x': x,
            'y': y,
            'w': w,
            'h': h,
            'cx': x + (w / 2),
            'cy': y + (h / 2)
        })
    
    # plt.figure(figsize=(12, 10))
    # plt.imshow(temp_result, cmap='gray')
    
    #어떤게 번호판처럼 생겼는지?
    
    MIN_AREA = 100
    MIN_WIDTH, MIN_HEIGHT = 2, 8
    MIN_RATIO, MAX_RATIO = 0.25, 1.0
    
    possible_contours = []
    
    cnt = 0
    for d in contours_dict:
        area = d['w'] * d['h']
        ratio = d['w'] / d['h']
        
        if area > MIN_AREA \
        and d['w'] > MIN_WIDTH and d['h'] > MIN_HEIGHT \
        and MIN_RATIO < ratio < MAX_RATIO:
            d['idx'] = cnt
            cnt += 1
            possible_contours.append(d)
            
    # visualize possible contours
    temp_result = np.zeros((height, width, channel), dtype=np.uint8)
    # plt.show()
    
    for d in possible_contours:
        cv2.drawContours(temp_result, d['contour'], -1, (255, 255, 255))
        cv2.rectangle(temp_result, pt1=(d['x'], d['y']), pt2=(d['x']+d['w'], d['y']+d['h']), color=(255, 255, 255), thickness=2)
        
    # plt.figure(figsize=(12, 10))
    # plt.imshow(temp_result, cmap='gray')
    
    #리얼 번호판 추려내기
    MAX_DIAG_MULTIPLYER = 5 # 5
    MAX_ANGLE_DIFF = 12.0 # 12.0
    MAX_AREA_DIFF = 0.5 # 0.5
    MAX_WIDTH_DIFF = 0.8 #0.8
    MAX_HEIGHT_DIFF = 0.2 #0.2
    MIN_N_MATCHED = 3 # 3
    
    def find_chars(contour_list):
        matched_result_idx = []
        
        for d1 in contour_list:
            matched_contours_idx = []
            for d2 in contour_list:
                if d1['idx'] == d2['idx']:
                    continue
    
                dx = abs(d1['cx'] - d2['cx'])
                dy = abs(d1['cy'] - d2['cy'])
    
                diagonal_length1 = np.sqrt(d1['w'] ** 2 + d1['h'] ** 2)
    
                distance = np.linalg.norm(np.array([d1['cx'], d1['cy']]) - np.array([d2['cx'], d2['cy']]))
                if dx == 0:
                    angle_diff = 90
                else:
                    angle_diff = np.degrees(np.arctan(dy / dx))
                area_diff = abs(d1['w'] * d1['h'] - d2['w'] * d2['h']) / (d1['w'] * d1['h'])
                width_diff = abs(d1['w'] - d2['w']) / d1['w']
                height_diff = abs(d1['h'] - d2['h']) / d1['h']
    
                if distance < diagonal_length1 * MAX_DIAG_MULTIPLYER \
                and angle_diff < MAX_ANGLE_DIFF and area_diff < MAX_AREA_DIFF \
                and width_diff < MAX_WIDTH_DIFF and height_diff < MAX_HEIGHT_DIFF:
                    matched_contours_idx.append(d2['idx'])
    
            # append this contour
            matched_contours_idx.append(d1['idx'])
    
            if len(matched_contours_idx) < MIN_N_MATCHED:
                continue
    
            matched_result_idx.append(matched_contours_idx)
    
            unmatched_contour_idx = []
            for d4 in contour_list:
                if d4['idx'] not in matched_contours_idx:
                    unmatched_contour_idx.append(d4['idx'])
    
            unmatched_contour = np.take(possible_contours, unmatched_contour_idx)
            
            # recursive
            recursive_contour_list = find_chars(unmatched_contour)
            
            for idx in recursive_contour_list:
                matched_result_idx.append(idx)
    
            break
    
        return matched_result_idx
        
    result_idx = find_chars(possible_contours)
    
    matched_result = []
    for idx_list in result_idx:
        matched_result.append(np.take(possible_contours, idx_list))
    
    # visualize possible contours
    temp_result = np.zeros((height, width, channel), dtype=np.uint8)
    
    for r in matched_result:
        for d in r:
    #         cv2.drawContours(temp_result, d['contour'], -1, (255, 255, 255))
            cv2.rectangle(temp_result, pt1=(d['x'], d['y']), pt2=(d['x']+d['w'], d['y']+d['h']), color=(255, 255, 255), thickness=2)
    
    # plt.figure(figsize=(12, 10))
    # plt.imshow(temp_result, cmap='gray')
    
    #똑바로 돌리기
    PLATE_WIDTH_PADDING = 1.3 # 1.3
    PLATE_HEIGHT_PADDING = 1.5 # 1.5
    MIN_PLATE_RATIO = 2
    MAX_PLATE_RATIO = 10
    
    plate_imgs = []
    plate_infos = []
    
    for i, matched_chars in enumerate(matched_result):
        sorted_chars = sorted(matched_chars, key=lambda x: x['cx'])
    
        plate_cx = (sorted_chars[0]['cx'] + sorted_chars[-1]['cx']) / 2
        plate_cy = (sorted_chars[0]['cy'] + sorted_chars[-1]['cy']) / 2
        
        plate_width = (sorted_chars[-1]['x'] + sorted_chars[-1]['w'] - sorted_chars[0]['x']) * PLATE_WIDTH_PADDING
        
        sum_height = 0
        for d in sorted_chars:
            sum_height += d['h']
    
        plate_height = int(sum_height / len(sorted_chars) * PLATE_HEIGHT_PADDING)
        
        triangle_height = sorted_chars[-1]['cy'] - sorted_chars[0]['cy']
        triangle_hypotenus = np.linalg.norm(
            np.array([sorted_chars[0]['cx'], sorted_chars[0]['cy']]) - 
            np.array([sorted_chars[-1]['cx'], sorted_chars[-1]['cy']])
        )
        
        angle = np.degrees(np.arcsin(triangle_height / triangle_hypotenus))
        
        rotation_matrix = cv2.getRotationMatrix2D(center=(plate_cx, plate_cy), angle=angle, scale=1.0)
        
        img_rotated = cv2.warpAffine(img_thresh, M=rotation_matrix, dsize=(width, height))
        
        img_cropped = cv2.getRectSubPix(
            img_rotated, 
            patchSize=(int(plate_width), int(plate_height)), 
            center=(int(plate_cx), int(plate_cy))
        )
        
        if img_cropped.shape[1] / img_cropped.shape[0] < MIN_PLATE_RATIO or img_cropped.shape[1] / img_cropped.shape[0] < MIN_PLATE_RATIO > MAX_PLATE_RATIO:
            continue
        
        plate_imgs.append(img_cropped)
        plate_infos.append({
            'x': int(plate_cx - plate_width / 2),
            'y': int(plate_cy - plate_height / 2),
            'w': int(plate_width),
            'h': int(plate_height)
        })
        # print("pi : ",  plate_infos)
        
        
    #최종확인
    longest_idx, longest_text = -1, 0
    plate_chars = []
    has_digit = False
    for i, plate_img in enumerate(plate_imgs):
        plate_img = cv2.resize(plate_img, dsize=(0, 0), fx=1.6, fy=1.6)
        _, plate_img = cv2.threshold(plate_img, thresh=0.0, maxval=255.0, type=cv2.THRESH_BINARY | cv2.THRESH_OTSU)
        
        # find contours again (same as above)
        contours, _ = cv2.findContours(plate_img, mode=cv2.RETR_LIST, method=cv2.CHAIN_APPROX_SIMPLE)
        
        plate_min_x, plate_min_y = plate_img.shape[1], plate_img.shape[0]
        plate_max_x, plate_max_y = 0, 0
    
        for contour in contours:
            x, y, w, h = cv2.boundingRect(contour)
            
            area = w * h
            ratio = w / h
    
            if area > MIN_AREA \
            and w > MIN_WIDTH and h > MIN_HEIGHT \
            and MIN_RATIO < ratio < MAX_RATIO:
                if x < plate_min_x:
                    plate_min_x = x
                if y < plate_min_y:
                    plate_min_y = y
                if x + w > plate_max_x:
                    plate_max_x = x + w
                if y + h > plate_max_y:
                    plate_max_y = y + h
                    
        img_result = plate_img[plate_min_y:plate_max_y, plate_min_x:plate_max_x]
        
        ##########################################
        # kernel = np.ones((5, 5), np.uint8)
        # img_result = cv2.morphologyEx(gray, cv2.MORPH_OPEN, kernel)
        # img_result = cv2.GaussianBlur(img_result, ksize=(5, 5), sigmaX=0)
        ###########################################
        
        _, img_result = cv2.threshold(img_result, thresh=0.0, maxval=255.0, type=cv2.THRESH_BINARY | cv2.THRESH_OTSU)
        img_result = cv2.copyMakeBorder(img_result, top=10, bottom=10, left=10, right=10, borderType=cv2.BORDER_CONSTANT, value=(0,0,0))
        
        chars = []
        for a in range(6,11):
            chars.append(pytesseract.image_to_string(img_result, lang='kor', config='--psm '+ str(a) +' --oem 0'))
            # print(str(a) + " : " +pytesseract.image_to_string(img_result, lang='kor', config='--psm '+ str(a) +' --oem 0'))
            # print(chars)
        
        # Use Easy OCR to Read Text
        reader = easyocr.Reader(["ko","en"])
        result = reader.readtext(img_result)
        number_reslut = ''
        if (len(result) > 0):
            result1 = result[(0)]
            number_reslut = result1[1]
        # print(result)
        # print(result[(0)])
        # print(number_reslut)
        
        # # Render Result
        # text = result[0][-2]
        # font = cv2.FONT_HERSHEY_SIMPLEX
        # res = cv2.putText(img,text=text, org = (approx[0][0][0], approx[1][0][1] + 60), fontFace = font, fontScale = 1, color = (0,255,0), thickness = 2, lineType = cv2.LINE_AA)
        # res = cv2.rectangle(img, tuple(approx[0][0]), tuple(approx[2][0]), (0,255,0), 3)
        # plt.imshow(cv2.cvtColor(res,cv2.COLOR_BGR2RGB))
        # # plt.show()
        
        number_reslut = check_plate(number_reslut)
        number_reslut = number_reslut.replace(" ","")
        # print('number_reslut :',number_reslut)
        result_chars = ''
        
        for a in range(0,len(chars)):
            result_chars = ''
            for c in chars[a]:
                if ord('가') <= ord(c) <= ord('힣') or c.isdigit():
                    if c.isdigit():
                        has_digit = True
                    result_chars += c
            # print(result_chars)
            plate_chars.append(result_chars)
    
        plate_chars.append(number_reslut)
    
        if has_digit and len(result_chars) > longest_text:
            longest_idx = i
    
        # plt.subplot(len(plate_imgs), 1, i+1)
        # plt.imshow(img_result, cmap='gray')
        # plt.show()
        
    # Result
    result_ans = ''
    if(has_digit != False):
        info = plate_infos[longest_idx]
        chars = plate_chars[longest_idx]
        
        #가장 많이 등장한 글자들 조합
        def most_frequent(data):
            return max(data, key=data.count)
        
        for x in plate_chars:
            if(len(x) > 4):
                for y in range(-4,-1):
                    if (x[y].isdigit() == False):
                        # print("list : ",plate_chars)
                        # print("x:",x)
                        if x in plate_chars:
                            plate_chars.remove(x)
                            
        for x in plate_chars:
            if(len(x) > 4):
                for y in range(0,2):
                    if (x[y].isdigit() == False):
                        # print("list : ",plate_chars)
                        # print("x:",x)
                        if x in plate_chars:
                            plate_chars.remove(x)                    
                    
        a = 0
        list_a = []
        for n in range(0,len(plate_chars) - 1):
            a = len(plate_chars[n])
            list_a.append(len(plate_chars[n]))
            a = most_frequent(list_a)
        
        # print("list_a", list_a)        
        # print("a : ", a)
        
        plate_list = []
        for m in range(0,len(plate_chars) - 1):
            if(len(plate_chars[m]) == a):
                plate_list.append(plate_chars[m])
                
        # print(plate_list)
        
        result_main = []
        for n in range(0,a):
            result_main.append([])
            
        for m in range(0,a):
            for l in range(0,len(plate_list)):
                result_main[m].append(plate_list[l][m])
                
        # print("테스트 : ", result_main)
        for m in range(0,a):
            result_ans += most_frequent(result_main[m])
            # print(most_frequent(result_main[m]))    
        
     
                
        
        #결과물 정제
        plate_kor = [ord('가'),ord('나'),ord('다'),ord('라'),ord('마'),ord('거'),ord('너')
                     ,ord('더'),ord('러'),ord('머'),ord('버'),ord('서'),ord('어'),ord('저')
                     ,ord('고'),ord('노'),ord('도'),ord('로'),ord('모'),ord('보'),ord('소')
                     ,ord('오'),ord('조'),ord('구'),ord('누'),ord('두'),ord('루'),ord('무')
                     ,ord('부'),ord('수'),ord('우'),ord('주'),ord('아'),ord('바'),ord('사')
                     ,ord('자'),ord('배'),ord('하'),ord('허'),ord('호')]
        
        result_ans = check_plate(result_ans)
        
        if(len(number_reslut) > 6):
            if(ord(number_reslut[-5]) in plate_kor):
                result_ans = number_reslut

        # print("리스트 : ", plate_chars)
        # print("정보 : ", info)
        # print("정제전 결과물 : ", chars)
        # print("정제후 결과물 : ", result_ans)
        
        # plt.figure(figsize=(12, 10))
        # plt.imshow(img_out)
        
    if(result_ans == None):
        result_ans = ''
        
    return result_ans
