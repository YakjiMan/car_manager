
def check_plate(result_ans):
    stop_word = ['갸','겨','교','규','그','기',
                 '냐','녀','뇨','뉴','느','니',
                 '댜','뎌','됴','듀','드','디',
                 '랴','려','료','류','르','리',
                 '먀','며','묘','뮤','므','미',
                 '뱌','벼','뵤','뷰','브','비',
                 '샤','셔','쇼','슈','스','시',
                 '야','여','요','유','으','이',
                 '쟈','져','죠','쥬','즈','지',
                 '챠','쳐','쵸','츄','츠','치',
                 '캬','켜','쿄','큐','크','키',
                 '탸','텨','툐','튜','트','티',
                 '퍄','펴','표','퓨','프','피',
                 '햐','혀','효','휴','흐','히',
                 '까','꺄','꺼','껴','꼬','꾜','꾸','뀨','끄','끼',
                 '따','땨','떠','뗘','또','뚀','뚜','뜌','뜨','띠',
                 '싸','쌰','써','쎠','쏘','쑈','쑤','쓔','쓰','씨',
                 '빠','뺘','뻐','뼈','뽀','뾰','뿌','쀼','쁘','삐',
                 '짜','쨔','쩌','쪄','쪼','쬬','쭈','쮸','쯔','찌',
                 " "]
                
    #노이즈로 변환된걸로 추정되는 단어 수정
    for n in range(0,len(result_ans)):
        if(result_ans[n] in stop_word):
            result_ans = result_ans.replace(' ','')
            result_ans = result_ans.replace('갸','가')
            result_ans = result_ans.replace('겨','거')
            result_ans = result_ans.replace('교','고')
            result_ans = result_ans.replace('규','구')
            result_ans = result_ans.replace('그','구')
            result_ans = result_ans.replace('기','가')
            result_ans = result_ans.replace('냐','나')
            result_ans = result_ans.replace('녀','너')
            result_ans = result_ans.replace('뇨','노')
            result_ans = result_ans.replace('뉴','누')
            result_ans = result_ans.replace('느','누')
            result_ans = result_ans.replace('니','나')
            result_ans = result_ans.replace('댜','다')
            result_ans = result_ans.replace('뎌','더')
            result_ans = result_ans.replace('됴','도')
            result_ans = result_ans.replace('듀','두')
            result_ans = result_ans.replace('드','두')
            result_ans = result_ans.replace('디','다')
            result_ans = result_ans.replace('랴','라')
            result_ans = result_ans.replace('려','러')
            result_ans = result_ans.replace('료','로')
            result_ans = result_ans.replace('류','루')
            result_ans = result_ans.replace('르','루')
            result_ans = result_ans.replace('리','라')
            result_ans = result_ans.replace('먀','마')
            result_ans = result_ans.replace('며','머')
            result_ans = result_ans.replace('묘','모')
            result_ans = result_ans.replace('뮤','무')
            result_ans = result_ans.replace('므','무')
            result_ans = result_ans.replace('미','마')
            result_ans = result_ans.replace('뱌','바')
            result_ans = result_ans.replace('벼','버')
            result_ans = result_ans.replace('뵤','보')
            result_ans = result_ans.replace('뷰','부')
            result_ans = result_ans.replace('브','부')
            result_ans = result_ans.replace('비','바')
            result_ans = result_ans.replace('샤','사')
            result_ans = result_ans.replace('셔','서')
            result_ans = result_ans.replace('쇼','소')
            result_ans = result_ans.replace('슈','수')
            result_ans = result_ans.replace('스','수')
            result_ans = result_ans.replace('시','사')
            result_ans = result_ans.replace('야','아')
            result_ans = result_ans.replace('여','어')
            result_ans = result_ans.replace('요','오')
            result_ans = result_ans.replace('유','우')
            result_ans = result_ans.replace('으','우')
            result_ans = result_ans.replace('이','아')
            result_ans = result_ans.replace('쟈','자')
            result_ans = result_ans.replace('져','저')
            result_ans = result_ans.replace('죠','조')
            result_ans = result_ans.replace('쥬','주')
            result_ans = result_ans.replace('즈','주')
            result_ans = result_ans.replace('지','자')
            result_ans = result_ans.replace('챠','차')
            result_ans = result_ans.replace('쳐','처')
            result_ans = result_ans.replace('쵸','초')
            result_ans = result_ans.replace('츄','추')
            result_ans = result_ans.replace('츠','추')
            result_ans = result_ans.replace('치','차')
            result_ans = result_ans.replace('캬','카')
            result_ans = result_ans.replace('켜','커')
            result_ans = result_ans.replace('쿄','코')
            result_ans = result_ans.replace('큐','쿠')
            result_ans = result_ans.replace('크','쿠')
            result_ans = result_ans.replace('키','카')
            result_ans = result_ans.replace('탸','타')
            result_ans = result_ans.replace('텨','터')
            result_ans = result_ans.replace('툐','토')
            result_ans = result_ans.replace('튜','투')
            result_ans = result_ans.replace('트','투')
            result_ans = result_ans.replace('티','타')
            result_ans = result_ans.replace('퍄','파')
            result_ans = result_ans.replace('펴','퍼')
            result_ans = result_ans.replace('표','포')
            result_ans = result_ans.replace('퓨','푸')
            result_ans = result_ans.replace('프','푸')
            result_ans = result_ans.replace('피','파')
            result_ans = result_ans.replace('햐','하')
            result_ans = result_ans.replace('혀','허')
            result_ans = result_ans.replace('효','호')
            result_ans = result_ans.replace('휴','후')
            result_ans = result_ans.replace('흐','후')
            result_ans = result_ans.replace('히','하')
            result_ans = result_ans.replace('까','가')
            result_ans = result_ans.replace('꺄','가')
            result_ans = result_ans.replace('꺼','거')
            result_ans = result_ans.replace('껴','거')
            result_ans = result_ans.replace('꼬','고')
            result_ans = result_ans.replace('꾜','고')
            result_ans = result_ans.replace('꾸','구')
            result_ans = result_ans.replace('뀨','구')
            result_ans = result_ans.replace('끄','구')
            result_ans = result_ans.replace('끼','가')
            result_ans = result_ans.replace('따','다')
            result_ans = result_ans.replace('땨','다')
            result_ans = result_ans.replace('떠','더')
            result_ans = result_ans.replace('뗘','더')
            result_ans = result_ans.replace('또','도')
            result_ans = result_ans.replace('뚀','도')
            result_ans = result_ans.replace('뚜','두')
            result_ans = result_ans.replace('뜌','두')
            result_ans = result_ans.replace('뜨','두')
            result_ans = result_ans.replace('띠','다')
            result_ans = result_ans.replace('빠','바')
            result_ans = result_ans.replace('뺘','바')
            result_ans = result_ans.replace('뻐','버')
            result_ans = result_ans.replace('뼈','버')
            result_ans = result_ans.replace('뽀','보')
            result_ans = result_ans.replace('뾰','보')
            result_ans = result_ans.replace('뿌','부')
            result_ans = result_ans.replace('쀼','부')
            result_ans = result_ans.replace('쁘','부')
            result_ans = result_ans.replace('삐','바')
            result_ans = result_ans.replace('싸','사')
            result_ans = result_ans.replace('쌰','사')
            result_ans = result_ans.replace('써','서')
            result_ans = result_ans.replace('쎠','서')
            result_ans = result_ans.replace('쏘','소')
            result_ans = result_ans.replace('쑈','소')
            result_ans = result_ans.replace('쑤','수')
            result_ans = result_ans.replace('쓔','수')
            result_ans = result_ans.replace('쓰','수')
            result_ans = result_ans.replace('씨','사')
            result_ans = result_ans.replace('짜','자')
            result_ans = result_ans.replace('쨔','자')
            result_ans = result_ans.replace('쩌','저')
            result_ans = result_ans.replace('쪄','저')
            result_ans = result_ans.replace('쪼','조')
            result_ans = result_ans.replace('쬬','조')
            result_ans = result_ans.replace('쭈','주')
            result_ans = result_ans.replace('쮸','주')
            result_ans = result_ans.replace('쯔','주')
            result_ans = result_ans.replace('찌','자')
    
    if(len(result_ans) > 5):
        #자주 발견되는 오류 수정
        if(result_ans[-1].isdigit() == False):
            result_ans = result_ans[:-1]
                
        b = '어'
        if(b != result_ans[-5] and b in result_ans[0:3]):
            result_ans = result_ans.replace('어','01',1)
            print("1번:", result_ans)
        
        if(b != result_ans[-5] and b in result_ans[3:]):
            result_ans = result_ans.replace('어','01',2)
            print("2번:", result_ans)
            
        b = '이'
        if(b != result_ans[-5] and b in result_ans[0:3]):
            result_ans = result_ans.replace('이','01',1)
            print("1번:", result_ans)
        
        if(b != result_ans[-5] and b in result_ans[3:]):
            result_ans = result_ans.replace('이','01',2)
            print("2번:", result_ans)
            
        if(result_ans[0].isdigit() == False):
            result_ans = result_ans[1:]
    
    return result_ans