from main import PororoOcr
import numpy as np
import os
import cv2
from plate_check import check_plate
from pyez_mix import find_plate

ocr = PororoOcr()
ocr.get_available_langs()
ocr.get_available_models()

# img_path = 'E:/SHS/third_project/python/test/image/15모4387.jpg'

# # img_path = '../image/'
# # img_path += '01가0865' + '.jpg'

# text = ocr.run_ocr(img_path, debug=True)

# print(text)

root_dir = 'E:/SHS/third_project/python/test/high_photo' # 디렉토리
def plate_check(root_dir):
        
    img_path_list = []
    possible_img_extension = ['.jpg', '.jpeg', '.JPG', '.bmp', '.png'] # 이미지 확장자들
     
    for (root, dirs, files) in os.walk(root_dir):
        if len(files) > 0:
            for file_name in files:
                if os.path.splitext(file_name)[1] in possible_img_extension:
                    img_path = root + '/' + file_name
                    
                    # 경로에서 \를 모두 /로 바꿔줘야함
                    img_path = img_path.replace('\\', '/') # \는 \\로 나타내야함         
                    img_path_list.append(img_path)
    
    
    for n in range(0,len(img_path_list)):
        img_name = ''
        img_name = img_path_list[n].replace(root_dir + "/", '')
        img_name = img_name.replace(".jpg",'')
        result = ocr.run_ocr(img_path_list[n])
        print("result:",result)
        if(" " in result[0]):
            result[0] = result[0].replace(" ", "")
        
        #결과물 정제
        result[0] = check_plate(result[0])
        
        plate_kor = [ord('가'),ord('나'),ord('다'),ord('라'),ord('마'),ord('거'),ord('너')
                     ,ord('더'),ord('러'),ord('머'),ord('버'),ord('서'),ord('어'),ord('저')
                     ,ord('고'),ord('노'),ord('도'),ord('로'),ord('모'),ord('보'),ord('소')
                     ,ord('오'),ord('조'),ord('구'),ord('누'),ord('두'),ord('루'),ord('무')
                     ,ord('부'),ord('수'),ord('우'),ord('주'),ord('아'),ord('바'),ord('사')
                     ,ord('자'),ord('배'),ord('하'),ord('허'),ord('호')]
        
        print("1.결과 : ",result[0])
        if(len(result[0]) > 4):
            if(result[0][-5].isdigit == True):
                result[0] = find_plate(img_name)
                print("2.결과 : ",result[0])
            elif(ord(result[0][-5]) not in plate_kor):
                result[0] = find_plate(img_name)
                print("3.결과 : ",result[0])
            
        print("결과 : ", result[0])
        print("사진 : ", img_name)
        #최종 이미지 저장하기 -> 파일명 = 분석결과
        if(result[0] == img_name):
            save_road = "E:/SHS/third_project/python/test/pororo_save2/ " + result[0] + ".png"
            
            img_ori = img = cv2.imdecode(np.fromfile(img_path_list[n], dtype=np.uint8), cv2.IMREAD_COLOR)
            extension = os.path.splitext(save_road)[1]
            
            result[0], encoded_img = cv2.imencode(extension, img_ori)
             
            if result:
                with open(save_road, mode='w+b') as f:
                    encoded_img.tofile(f)
    
    # print("결과테스트 : ", result)
    
