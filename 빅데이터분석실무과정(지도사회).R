# 빅데이터분석실무과정(지도사회)
# 강사 : 홍용기 박사
# 2022-08-13 ~ 2022-09-03

setwd("C:/Users/SEC/Documents/빅데이터분석실무과정")
# 마우스 우측버튼 '주소를 텍스트로 복사' <가능하면 '복사하기+붙여넣기'를 해야 오타를 줄임>
getwd()


# 단축키 ---------------------------------------------------------------------

# 가능하면 단축키를 써야 속도가 빨라집니다.
# 가능하면 마우스를 사용하지 않고, 키보드만으로 처리해야 속도가 빨라집니다.

Ctrl + Enter  		# 실행
Shift + 화살표		# 범위지정
Crtl + L					# 콘솔 지우기 (Clear Console)
Crtl + S					# 저장 (Save)
Crtl + F					# 찾기 (Find)
Ctrl + Shift + N	# 새 파일 열기 (New)
Ctrl + O					# 파일 열기 (Open)
Ctrl + Shift + C	# 주석 처리하기 (Comment)
Ctrl + Shift + R	# 섹션 추가 (Insert Section)
Ctrl + Shift + O	# 섹션 찾아가기 (Show Document Outline)
Alt + -					  # <- 입력
Ctrl + Shift + M	# %>% 입력 (Pipe Operator, 파이프 연산자)
Ctrl + -					# 화면 비율 축소
Ctrl + Shift + +	# 화면 비율 확대
Ctrl + -					# 화면 비율 축소
Ctrl + Shift + +	# 화면 비율 확대
Ctrl + X					# 잘라내기 (Cut)
Ctrl + C					# 복사 (Copy)
Ctrl + V					# 붙여넣기 (Paste)
Ctrl + Z					# Undo
Ctrl + Y					# Redo
( )		            # 우측 괄호에 커서 위치, 대응되는 가로에 색깔
( )		            # 전체 범위 선정 상태에서 왼쪽 괄호를 입력하면 자동 양쪽 괄호 입력
" "  		          # 전체 범위 선정 상태에서 따옴표를 입력하면 자동 양쪽 따옴표 입력
  
# 03 데이터 분석을 위한 연장 챙기기----------------------------------------------------

# 변수 만들기
a <- 1;a          # 2개 이상의 명령 실행은 ';(세미콜론)' 사용
b <- 2;b
c <- 3;c
d <- 3.5;d

a+b
a+b+c
4/b
5*b

var1 <- c(1,2,5,7,8);var1 # variable(변수) # concatenate (연결하다)
var2 <- c(1:5);var2
var3 <- 1:5;var3
var4 <- seq(1,10,by=2);var4 # sequence 함수
var5 <- seq(1,10,by=3);var5

var1+2
var1+var2

# 문자로 된 변수 만들기
str1 <- "a";str1 # string(문자열)
str2 <- "text";str2
str3 <- "Hello World!";str3
str4 <- c("a","b","c");str4
str5 <- c("Hello", "World", "is", "good!");str5

# 문자로 된 변수의 연산 (에러)
str1+2

# 함수 이해하기
x <- c(1,2,3);x
mean(x) # 평균
max(x)  # 최댓값
min(x)  # 최솟값

# 문자열 합치기
str5
?paste
# paste(str5)
# paste(str5, sep = ",")
# paste(str5, sep = " ")
paste(str5, collapse = ",")
paste(str5, collapse = " ")

# 새 변수 만들기
x
x_mean <- mean(x);x_mean 

str5
str5_paste <- paste(str5, collapse = " ");str5_paste

# 패키지 설치하기
# install.packages("ggplot2")

# 패키지 로드하기
library(ggplot2) 

# 빈도 막대그래프 그리기
x <- c("a","a","b","c");x
qplot(x)
?qplot

# data(mpg)
# ?mpg

qplot(data = mpg, x = hwy)
qplot(data = mpg, x = cty)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg, x = drv, y = hwy, geom = "line")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)

# 교재 77쪽, 혼자서 해보기
# Q1, 시험 점수 변수 만들고 출력하기
score <- c(80,60,70,50,90);score

# Q2, 전체 평균 구하기
mean(score)

# Q3, 전체 평균 변수 만들고 출력하기
mean_score <- mean(score);mean_score


# 04 데이터 프레임의 세계로! --------------------------------------------------------

# 변수 만들기
english <- c(90,80,60,70)
english
math <- c(50,60,100,20)
math

# 데이프 프레임 만들기
df_midterm <- data.frame(english,math)
df_midterm

# class 추가하기
class <- c(1,1,2,2)
df_midterm <- data.frame(english,math,class)
df_midterm

# 영어평균, 수학평균 구하기
mean(df_midterm$english)
mean(df_midterm$math)

# $를 사용하지 않고, 데이터셋을 부착하는 방법
attach(df_midterm)
mean(english)
mean(math)

# 데이프 프레임 한 번에 만들기
# ,(쉼표)를 이용해 가독성 높이기
df_midterm<-data.frame(english=c(98,80,60,70),
                       math=c(50,60,100,20),
                       class=c(1,1,2,2))
df_midterm

# 변수이름 확인하기
names(df_midterm)

# 행이름 바꾸기
rownames(df_midterm) <- c("김지훈", "이유진", "박동현", "김민지")
df_midterm

# 교재 88쪽, 혼자서 해보기
# Q1, 데이터 프레임 만들어 출력해 보기
df_sales <- data.frame(제품=c("사과","딸기","수박"),
                    가격=c(1800,1500,3000),
                    판매량=c(24,38,13))
df_sales
# Q2, 가격평균, 판매량평균 구하기
mean(df_sales$가격)
mean(df_sales$판매량)

# $를 사용하지 않고, 데이터셋을 부착하는 방법
attach(df_sales)
mean(가격)
mean(판매량)

# 엑셀 파일 불러오기

# 패키지 설치
# install.packages("readxl")

# 패키지 로드
library(readxl)

# 엑셀 파일 불러오기
# 직접경로 (마우스 우측버튼 '주소를 텍스트로 복사' + 파일명 입력, '\'를 '/'로 바꾸기)
df_exam <- read_excel("C:/Users/SEC/Documents/빅데이터분석실무과정/excel_exam.xlsx") 
df_exam

# 간접경로 (현재 작업폴더를 기준으로 경로 지정)
getwd()
df_exam <- read_excel("excel_exam.xlsx") 
df_exam

# 분석하기
mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

# $를 사용하지 않고, 데이터셋을 부착하는 방법
attach(df_exam)
mean(english)
mean(science)

# 컬러명이 없는 엑셀파일 불러오기
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar

# 엑셀 시트 지정해서 불러오기
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

# csv 파일 불러오기 (comma separated value)
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam
mean(df_csv_exam$math)
mean(df_csv_exam$english)
mean(df_csv_exam$science)

# 첫번째 변수명이 없은 csv 파일 불러오기
read.csv("csv_exam.csv",header = F)

# 문자가 들어있는 csv 파일 불러오기 (자동 factor(범주) 지정 방지)
read.csv("csv_exam.csv",stringsAsFactors = F) # 스펠링 주의 (A와 F는 대문자)


# 데이터 프레임을 csv 파일로 저장하기
# 데이터 프레임 만들기
df_midterm <- data.frame(english=c(90, 80, 60, 70),
                         math=c(50, 60, 100, 20),
                         class=c(1,1,2,2))
df_midterm

# csv 파일로 저장하기
write.csv(df_midterm, file = "df_midterm.csv") # 상대경로

# R 데이터 파일로 저장하기 
save(df_midterm, file = "df_midterm.rda")

# 변수를 지우고 .rda 파일 로드 후 변수 확인하기
df_midterm
rm(df_midterm);df_midterm
load("df_midterm.rda") # 파일명이 자동적으로 변수명이 됨
df_midterm


# 엑셀파일 불러와 df_exam에 할당하기
rm(df_midterm)
rm(df_exam)
df_exam
df_exam <- read_excel("excel_exam.xlsx")
df_exam

# csv 파일 불러와 df_csv_exam에 할당하기
rm(df_csv_exam)
df_csv_exam
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

# 교재 98쪽, 정리하기

# 1. 변수 만들기, 데이터 프레임 만들기
english <- c(90,80,60,70);english
math <- c(50,60,100,20);math

df_midterm <- data.frame(english,math);df_midterm

# 2. 외부 데이터 이용하기

# 엑셀 파일
library(readxl)
df_exam <- read_excel("excel_exam.xlsx");df_exam

# csv 파일
df_csv_exam <- read.csv("csv_exam.csv");df_csv_exam
write.csv(df_midterm, file = "df_midterm.csv")

# Rda 파일
load("df_midterm.rda");df_midterm
save(df_midterm, file = "df_midterm.rda")



# 05 데이터 분석 기초! -----------------------------------------------------------

# csv 파일 불러오기
exam <- read.csv("csv_exam.csv")
exam

# 데이터 파악하기
head(exam)
head(exam,10)
tail(exam)
tail(exam,10)
View(exam)      # V는 대문자
dim(exam)       # dimensions
str(exam)       # structure, observation(관측치), variables(변수), integer(정수)
summary(exam)   # 다섯숫자요약 & 평균

# 교재 105쪽, 데이터 내용 확인하기 
# 수학점수의 평균은?
# 수학점수가 가장 낮은 사람의 점수는? 가장 높은 사람의 점수는?
# 수학점수의 중간 50%의 범위는?
# 그래프로 확인하기
hist(exam$math)

# mpg 데이터 파악하기

# 패키지 로드
library(ggplot2)
?mpg

# ggolot2 패키지의 mpg 데이터 불러오기
mpg <- as.data.frame(ggplot2::mpg) # '::' 는 ggplot2 패키지에 들어 있는 mpg 데이터셋을 지정하는 코드 

# (참고사항) ggplot2 패키지, mpg 데이터셋, hwy 컬럼의 비교
mpg <- as.data.frame(ggplot2$mpg) # error
mpg_hwy <- as.data.frame(mpg$hwy)
head(mpg_hwy)

# mpg 데이터 파악하기
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)      # character(문자), numeric(실수), integer(정수)
summary(mpg)
# 교재 109쪽, 데이터 내용 확인하기 
# 모든 자동차의 도시연비 평균은?
# 도시연비가 가장 낮은 자동차의 연비는? 가장 높은 자동차의 연비는?
# 도시연비의 중앙값은? 중앙값을 기준으로 50%의 범위는?
# 그래프로 확인하기
hist(mpg$cty)

# 데이터 프레임 생성하기
df_raw <- data.frame(var1=c(1,2,1),
                     var2=c(2,3,2))
df_raw

# dplyr 패키지 설치하기
# install.packages("dplyr")

# dplyr 패키지 로드하기
library(dplyr) # dplyr = data.frame + plier(뿌라이어, 펜치) + R
?dplyr

# 데이터 프레임 복사본 만들기
df_new <- df_raw
df_new

# 변수명 바꾸기
df_new <- rename(df_new,v2=var2)
df_new

# 교재 112쪽, 혼자서 해보기
# Q1, ggplot2 패키지의 mpg 데이터를 불러온 후 복사본 만들기
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg

# Q2, 복사본을 이용해 cty는 city로, hwy는 highway로 변수명 수정하기
mpg_new <- rename(mpg_new, city=cty, highway=hwy)

# Q3, 데이터 일부를 출력해 변수명이 바뀌었는지 확인하기
head(mpg_new)

# 파생변수 만들기
# 데이터 프레임 생성하기
df <- data.frame(var1=c(4,3,8),
                 var2=c(2,6,1))
df

# 합계 파생변수 만들기
df$var_sum <- df$var1+df$var2
df

# 평균 파생변수 만들기
df$var_mean <- (df$var1+df$var2)/2
df

# mpg 데이터를 이용해 파생변수 만들기
# mpg 데이터 불러오기
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)

# 통합연비변수 만들기
mpg$total <- (mpg$cty+mpg$hwy)/2
head(mpg)

# 통합연비변수 평균 구하기
mean(mpg$total)

# 조건문을 활용해 파생변수 만들기
# '일반적으로 코딩은 '함수', '조건문', '반복문'만 배우면 된다. 이후는 코드를 더 쉽게 공유하는 방법, 코드를 더 깔끔하게 만드는 과정이다.' (윤인성, 파이썬, 자바스크립트, HTML+CSS 전문 개발자 및 강사)

# 기준값 정하기
# 통합연비변수 요약통계량 구하기
summary(mpg$total)

# 통합연비변수 히스토그램 그리기
hist(mpg$total)

# (참고) 박스플롯 그리기
boxplot(mpg$total)

# 탐색적 데이터 분석(EDA) 결과
# 1) total 연비의 평균과 중앙값은 약 20이다.
# 2) total 연비가 20~25 사이에 해당하는 자동차 모델이 가장 많다.
# 3) 대부분 25 이하이고, 25를 넘기는 자동차는 많지 않다.
# 통합연비가 20을 넘기면 '합격', 넘기지 못하면 '불합격' 기준 결정

# 합격 판정 변수 만들기
mpg$test <- ifelse(mpg$total>=20, "pass", "fail")
head(mpg)

# 빈도표로 합격 판정 자동차 수 살펴보기
table(mpg$test)

# 막대그래프로 빈도 표현하기
library(ggplot2)
qplot(mpg$test)


# 중첩 조건문 활용하기
# total을 기준으로 A, B, C 등급 부여하기
mpg$grade <- ifelse(mpg$total>=30,"A",
                    ifelse(mpg$total>=20,"B","C"))
head(mpg)

# 등급 빈도표 생성
table(mpg$grade)

# 빈도 막대그래프 그리기
qplot(mpg$grade)

# 원하는 만큼 범주 만들기
mpg$grade2 <- ifelse(mpg$total>=30,"A",
                     ifelse(mpg$total>=25,"B",
                            ifelse(mpg$total>=20,"C","D")))
head(mpg)
table(mpg$grade2)
qplot(mpg$grade2)

# 교재 122쪽, 정리하기

# 1. 데이터 준비, 패키지 준비
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)
library(ggplot2)

# 2. 데이터 파악
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

# 3. 변수명 수정
mpg <- rename(mpg, company=manufacturer)

# 4. 파생변수 생성
mpg$total <- (mpg$cty+mpg$hwy)/2
mpg$test <- ifelse(mpg$total>=20, "pass", "fail")

# 5. 빈도 확인
table(mpg$test)
qplot(mpg$test)

# 교재 123쪽, 분석 도전!

# 문제1, ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러온 다음 데이터의 특징을 파악하세요.
library(ggplot2)
?midwest

midwest <- as.data.frame(ggplot2::midwest)

head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)
summary(midwest)

# 문제2, poptotal(전체 인구) 변수를 total로, popasian(아시아 인구) 변수를 asian으로 수정하세요
library(dplyr)
midwest <- rename(midwest, total=poptotal, asian=popasian)
head(midwest)

# 문제3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보세요.
midwest$ratio <- midwest$asian/midwest$total*100
head(midwest)
hist(midwest$ratio)

# (참고) 이상치 포함
# 인구비율(아시아인구/전체인구)에서 1이상이 나올 수 없는데, 1이상인 이상치가 존재
boxplot(midwest$ratio)

# 문제4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.
mean_ratio <- mean(midwest$ratio)
mean_ratio

summary(midwest$ratio) # 이상치 때문에 mean 보다는 median이 더 좋은 기준으로 판단됨

midwest$group <- ifelse(midwest$ratio>mean_ratio, "large", "small")
head(midwest)

# 문제5. "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
table(midwest$group)
qplot(midwest$group)


# 06 자유자재로 데이터 가공하기 -------------------------------------------------------

exam <- read.csv("C:\\Users\\SEC\\Documents\\Do It R Data Analysis\\Data\\csv_exam.csv")
head(exam)

?dplyr
library(dplyr)
exam %>% filter(class==1)
exam %>% filter(class==2)
exam %>% filter(class!=1)
exam %>% filter(class!=3)

exam %>% filter(math>50)
exam %>% filter(math<50)
exam %>% filter(english>=80)
exam %>% filter(english<80)

exam %>% filter(class==1 & math>=50)
exam %>% filter(class==2 & english>=80)

exam %>% filter(math>=90 | english>=90)
exam %>% filter(english<90 | science<50)

exam %>% filter(class==1 | class==3 | class==5)
exam %>% filter(class %in% c(1,3,5))

class1 <- exam %>% filter(class==1);class1
class2 <- exam %>% filter(class==2);class2

mean(class1$math)
mean(class2$math)

mpg <- as.data.frame(ggplot2::mpg)
mpg_a <- mpg %>% filter(displ<=4)
mpg_b <- mpg %>% filter(displ>=5)
mean(mpg_a$hwy)
mean(mpg_b$hwy)

mpg_audi <- mpg %>% filter(manufacturer=="audi")
mpg_toyota <- mpg %>% filter(manufacturer=="toyota")
mean(mpg_audi$cty)
mean(mpg_toyota$cty)

mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_new$hwy)

head(exam)
exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select(-math, -english)

exam %>%
  filter(class==1) %>%
  select(english)

exam %>% 
  select(id,math) %>% 
  head

df <- mpg %>% select(class,cty)
head(df)

df_suv <- df %>% filter(class=="suv")
df_compact <- df %>% filter(class=="compact")
mean(df_suv$cty)
mean(df_compact$cty)

exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class, math)

mpg <- as.data.frame(ggplot2::mpg)
mpg %>% 
  filter(manufacturer=="audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)

exam %>% 
  mutate(total=math+english+science) %>% 
  head

exam %>% 
  mutate(total=math+english+science,
         mean=(math+english+science)/3) %>% 
  head

exam %>% 
  mutate(test=ifelse(science>=60, "pass", "fail")) %>% 
  head

exam %>% 
  mutate(total=math+english+science) %>% 
  arrange(total) %>% 
  head

mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new <- mpg_new %>% mutate(total=cty+hwy)
head(mpg_new)

mpg_new <- mpg_new %>% mutate(mean=total/2)
head(mpg_new)

mpg_new %>% 
  arrange(desc(mean)) %>% 
  head(3)

mpg %>% 
  mutate(total=cty+hwy,
         mean=total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)

exam %>% 
  summarise(mean_math=mean(math))
?summarise

exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))
?group_by

exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math),
            sum_math=sum(math),
            median_math=median(math),
            n=n())

mpg <- as.data.frame(ggplot2::mpg)
mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>%
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)
  
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty))
  
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))

mpg %>%
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

mpg %>% 
  filter(class=="compact") %>% 
  group_by(manufacturer) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count))

test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(60,80,70,90,85))
test1
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70,83,65,95,80))
test2

library(dplyr)
total <- left_join(test1,test2,by="id")
total
?left_join

name <- data.frame(class=c(1,2,3,4,5),
                   teacher=c("kim", "lee", "park", "choi", "jung"))
name

head(exam)
exam_new <- left_join(exam, name, by="class")
exam_new

group_a <- data.frame(id=c(1,2,3,4,5),
                      test=c(60,80,70,90,85))
group_a
group_b <- data.frame(id=c(6,7,8,9,10),
                      test=c(70,83,65,95,80))
group_b

group_all <- bind_rows(group_a,group_b)
group_all

group_all2 <- rbind(group_a,group_b)
group_all2






# 07 데이터 정제 ---------------------------------------------------------------

df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score=c(5,4,3,4,NA))
df

is.na(df)
table(is.na(df))

table(is.na(df$sex))
table(is.na(df$score))

mean(df$score)
sum(df$score)

library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
df_nomiss
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2

mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

exam <- read.csv("C:\\Users\\SEC\\Documents\\Do It R Data Analysis\\Data\\csv_exam.csv")
exam[c(3,8,15),"math"] <- NA
exam

exam %>% summarise(mean_math=mean(math))
exam %>% summarise(mean_math=mean(math, na.rm = T))
exam %>% summarise(mean_math=mean(math, na.rm = T),
                   sum_math=sum(math, na.rm = T),
                   median_math=median(math, na.rm = T))

exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
mean(exam$math)







outlier <- data.frame(sex=c(1,2,1,3,2,1),
                      score=c(5,4,3,4,2,6))
outlier

table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex==3,NA,outlier$sex)
outlier
outlier$score <- ifelse(outlier$score>5,NA,outlier$score)
outlier

outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score=mean(score))








