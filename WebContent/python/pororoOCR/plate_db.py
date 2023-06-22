import numpy as np
import os
import cv2
from plate_main import plate_check
import DBManager as db
from datetime import datetime

##======================================================================
d_file = '../../testpicture/num_img/'
d_file = 'E:/SHS/third_project/SHS/second_project/car_manager/WebContent/testpicture/num_img/'
files = os.listdir(d_file)

for i in range(0,len(files)):
    for j in range(0,len(files)):
        if datetime.fromtimestamp(os.path.getctime(d_file+files[i])) > \
            datetime.fromtimestamp(os.path.getctime(d_file+files[j])):
                (files[i], files[j]) = (files[j], files[i])

img = files[0]
print("Stage 01")
print('1번 ok')

plate,time = plate_check(img)
# print(plate)

print("Stage 02")

photo_time = time
inout = ''

# print("문자열 변환 : ", photo_time)
print("Stage 03")
db = db.DBManager()
db.DBOpen("192.168.0.21", "smartpark", "root", "ezen")

print("Stage 04")
print('2번 ok')
#차번호가 일치하는 유저 서치
sql = "select user_no from user where user_car='" + plate + "' "
db.OpenQuery(sql)
user_check = db.GetTotal()
user_no = ''
print("Stage 05")
if(int(user_check) == 1):
    user_no = str(db.GetValue(0, 'user_no'))
else:
    user_no = '2'
# print(user_no)
# db.CloseQuery()

#차번호가 일치하는 입출입 기록 서치
sql = "select move_inout from move where move_car='" + plate + "' "
db.OpenQuery(sql)
# print(sql)
total = db.GetTotal()
# print(total)
# db.CloseQuery()
# db.DBOpen("192.168.0.21", "smartpark", "root", "ezen")
print('3번 ok')
#입출입 마지막 기록에 따라 insert 구문 실행
if(int(user_check) == 1):
    if ((int(total) % 2) == 0):
        sql  = "insert into move (move_inout,move_car,user_no) "
        sql += "values ('in','" + plate + "','" + user_no + "') "
        # print(sql)
        db.RunSQL(sql)
        inout = 'in'
    else:
        sql = "select move_time from move where move_car='" + plate + "' order by move_no desc limit 1"
        db.OpenQuery(sql)
        time = db.GetValue(0, "move_time")
        print("시간:", time)
        now = datetime.now()
        ptime = now - time
        ptime = round(ptime.seconds / 60)
        if(ptime == 0):
            ptime = 1
        print("계산시간:",ptime)
        
        sql  = "insert into move (move_inout,move_car,user_no) "
        sql += "values ('out','" + plate + "','2','" + str(ptime) + "') "
        # print(sql)
        db.RunSQL(sql)
        inout = 'out'
else:
    if ((int(total) % 2) == 0):
        sql  = "insert into move (move_inout,move_car,user_no) "
        sql += "values ('in','" + plate + "','2') "
        # print(sql)
        db.RunSQL(sql)
        inout = 'in'
    else:
        sql = "select move_time from move where move_car='" + plate + "' order by move_no desc limit 1"
        db.OpenQuery(sql)
        time = db.GetValue(0, "move_time")
        print("시간:" , time)
        now = datetime.now()
        ptime = now - time
        print("시간차이:",ptime)
        print("초환산:",ptime.seconds)
        ptime = round(ptime.seconds / 60)
        if(ptime == 0):
            ptime = 1
        print("계산시간:",ptime)
        
        sql  = "insert into move (move_inout,move_car,user_no,move_ptime) "
        sql += "values ('out','" + plate + "','2','" + str(ptime) + "') "
        # print(sql)
        db.RunSQL(sql)
        inout = 'out'
    
    
#사진 insert
sql = "select move_no from move order by move_no desc limit 1 "
db.OpenQuery(sql)
# print(sql)
move_no = db.GetValue(0, 'move_no')
# print(move_no)

sql  = "insert into photo (photo_fname,photo_pname,move_no) "
sql += "values ('" + photo_time + "-" + plate + ".png',md5('" + plate + ".png'),'" + str(move_no) + "')"
# print(sql)
db.RunSQL(sql)

sql = "select photo_no from photo order by photo_no desc limit 1 "
db.OpenQuery(sql)
photo_no = db.GetValue(0, 'photo_no')

#주차구역 insert
if (inout == 'in'):
    sql = "select move_ptime from move where move_car='" + plate + "'"
    db.OpenQuery(sql)
    total = db.GetTotal()
    suggest_list = []
    suggest_sum  = 0
    suggest_aver = 0
    num_list = []
    for i in range(0,total):
        suggest_list.append(db.GetValue(i, "move_ptime"))
    for k in suggest_list:
        if k is not None:
            num_list.append(k)
    for j in range(0,len(num_list)):
        suggest_sum += int(num_list[j])
        
    if(len(num_list) == 0):
        suggest_aver = 1
    else:
        suggest_aver = round(suggest_sum / len(num_list))
    
    print("평균 주차시간 : ",suggest_aver)
    if(suggest_aver < 30):
        sql = "select * from park where park_exist='empty' and "
        sql += "(park_no like '___1' or park_no like '___2' or park_no like '___3') "
        sql += "ORDER BY park_no asc, RAND() LIMIT 1"
        db.OpenQuery(sql)
        suggest_park = db.GetValue(0, "park_no")
        print(suggest_park)
        
        sql  = "update park set park_exist='full',user_no='" + user_no + "',"
        sql += "move_no='" + str(move_no) + "',photo_no='" + str(photo_no) + "' "
        sql += "where park_no='" + suggest_park + "'"
        db.RunSQL(sql)
    if(30< suggest_aver < 60):
        sql = "select * from park where park_exist='empty' and "
        sql += "(park_no like '___4' or park_no like '___5' or park_no like '___6') "
        sql += "ORDER BY park_no asc, RAND() LIMIT 1"
        db.OpenQuery(sql)
        suggest_park = db.GetValue(0, "park_no")
        print(suggest_park)
        
        sql  = "update park set park_exist='full',user_no='" + user_no + "',"
        sql += "move_no='" + str(move_no) + "',photo_no='" + str(photo_no) + "' "
        sql += "where park_no='" + suggest_park + "'"
        db.RunSQL(sql)
    if(60 < suggest_aver < 90):
        sql = "select * from park where park_exist='empty' and "
        sql += "(park_no like '___7' or park_no like '___8' or park_no like '___9') "
        sql += "ORDER BY park_no asc, RAND() LIMIT 1"
        db.OpenQuery(sql)
        suggest_park = db.GetValue(0, "park_no")
        print(suggest_park)
        
        sql  = "update park set park_exist='full',user_no='" + user_no + "',"
        sql += "move_no='" + str(move_no) + "',photo_no='" + str(photo_no) + "' "
        sql += "where park_no='" + suggest_park + "'"
        db.RunSQL(sql)
    if(suggest_aver > 90):
        sql = "select * from park where park_exist='empty' and "
        sql += "(park_no like '___1%') "
        sql += "ORDER BY park_no asc, RAND() LIMIT 1"
        db.OpenQuery(sql)
        suggest_park = db.GetValue(0, "park_no")
        print(suggest_park)
        
        sql  = "update park set park_exist='full',user_no='" + user_no + "',"
        sql += "move_no='" + str(move_no) + "',photo_no='" + str(photo_no) + "' "
        sql += "where park_no='" + suggest_park + "'"
        db.RunSQL(sql)
elif(inout == 'out'):
    sql = "update park set park_exist='empty' where move_no='" + str(move_no) + "'"
    db.RunSQL(sql);


##======================================================================

db.DBClose()
