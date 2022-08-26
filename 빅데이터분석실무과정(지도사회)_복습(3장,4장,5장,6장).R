# 빅데이터분석실무과정(지도사회)
# 강사 : 홍용기 박사
# 2022-08-13 ~ 2022-09-03 

# 깃헙(Github) 파일 다운르도
https://github.com/Lotus6354/R_KMTCA
# code를 클릭하고, Download ZIP 파일을 다운로드 받으신 후, RStudio로 파일을 여세요.


# 작업공간 지정 -----------------------------------------------------------------

# 작업공간 지정하기
setwd("C:/Users/SEC/Documents/빅데이터분석실무과정")
# 마우스 우측버튼 '주소를 텍스트로 복사' <가능하면 '복사하기+붙여넣기'를 해야 오타를 줄임>

# 작업공간 확인하기
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
Ctrl + Shift + R	# 섹션 추가 (Insert Section) # 마지막 4칸에 '#' 또는 '-' 입력
Ctrl + Shift + O	# 섹션 찾아가기 (Show Document Outline)
Alt + -					  # <- 입력
Ctrl + Shift + M	# %>% 입력 (Pipe Operator, 파이프 연산자)
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

var1
var2
var3
var4
var5

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

y <- c(1:100)
head(y)
tail(y)
mean(y)

# 문자열 합치기
str5
?paste
# paste(str5)
# paste(str5, sep = ",")
# paste(str5, sep = " ")
paste(str5, collapse = ",")
paste(str5, collapse = " ")
# paste0(str5)

# 새 변수 만들기
x
x_mean <- mean(x);x_mean 
x_sum <- sum(x);x_sum

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
df_exam <- read_excel("data/excel_exam.xlsx") 
df_exam

# 분석하기
mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

# $를 사용하지 않고, 데이터셋을 부착하는 방법
attach(df_exam)
mean(english)
mean(science)

# 컬럼명이 없는 엑셀파일 불러오기
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar

# 엑셀 시트 지정해서 불러오기
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

# csv 파일 불러오기 (comma separated value)
df_csv_exam <- read.csv("data/csv_exam.csv")
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
write.csv(df_midterm, file = "data/df_midterm.csv") # 상대경로

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
getwd()
exam <- read.csv("data/csv_exam.csv")
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
hist(exam$math) # histogram

# mpg 데이터 파악하기

# 패키지 로드
library(ggplot2)
?mpg

# ggolot2 패키지의 mpg 데이터 불러오기
mpg <- as.data.frame(ggplot2::mpg) # '::' 는 ggplot2 패키지에 들어 있는 mpg 데이터셋을 지정하는 코드 

# (참고사항) ggplot2 패키지, mpg 데이터셋, hwy 컬럼의 비교
# mpg <- as.data.frame(ggplot2$mpg) # error
# mpg_hwy <- as.data.frame(mpg$hwy)
# head(mpg_hwy)

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



# 빅데이터 분석기사 작업형 제1유형 예시문 --------------------------------------------------

# min-max scale

data(mtcars)

head(mtcars)
dim(mtcars) # dimensions
str(mtcars) # structure

x <- mtcars$qsec
x

x_min <- min(x);x_min
x_max <- max(x);x_max

scale <-(x-x_min)/(x_max-x_min)
scale

length(which(scale>0.5))

# scale() 함수 이용 방법
df_n <- data.frame(mtcars)
df_n
df_min <- min(df_n$qsec)
df_min
df_max <- max(df_n$qsec)
df_max
df_n$new_qsec <- scale(df_n$qsec)
# df_n$new_qsec <- scale(df_n$qsec, center=df_min, scale=df_max-df_min)
df_n$new_qsec
df_n$grade <- ifelse(df_n$new_qsec>0.5,"A","B")
df_n$grade
table(df_n$grade)

?scale

# 사용자 함수 이용 방법
x <- mtcars$qsec
normalize <- function(x) {
  return((x-min(x))/(max(x)-min(x)))
}
normalize(x)
length(which(normalize(x)>0.5))


# 06 자유자재로 데이터 가공하기 -------------------------------------------------------

# tidyverse 패키지 설치하기
# install.packages("tidyverse")

# tidyverse 패키지 로드하기
library(tidyverse)


# dplyr 패키지 설치하기
# install.packages("dplyr")

# dplyr 패키지 로드하기
library(dplyr)
?dplyr

# 데이터 불러오기
# 데이터를 불러올 때 본인 PC의 '경로'를 꼭 확인하세요.
exam <- read.csv("data/csv_exam.csv")
head(exam)
dim(exam)

# class별 빈도 파악하기
table(exam$class)

# %>% 파이프 연산자(pipe operator) 사용
# 단축키 Ctrl + Shift + M

# exam에서 class가 1인 경우만 추출해 출력하기
exam %>% filter(class==1)

# exam에서 class가 2인 경우만 추출해 출력하기
exam %>% filter(class==2)

# exam에서 class가 1이 아닌 경우만 추출해 출력하기
exam %>% filter(class!=1)

# exam에서 class가 3이 아닌 경우만 추출해 출력하기
exam %>% filter(class!=3)

# 수학 점수가 50점을 초과한 경우
exam %>% filter(math>50)

# 수학 점수가 50점 미만인 경우
exam %>% filter(math<50)

# 영어 점수가 80점 이상인 경우
exam %>% filter(english>=80)

# 영어 점수가 80점 이하인 경우
exam %>% filter(english<=80)

# 1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class==1 & math>=50)

# 2반이면서 영어 점수가 80점 이상인 경우
exam %>% filter(class==2 & english>=80)

# 수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>% filter(math>=90 | english>=90)

# 영어 점수가 90점 미만이거나 과학 점수가 50점 미만인 경우
exam %>% filter(english<90 | science<50)

# 1, 3, 5반에 해당하면 추출
exam %>% filter(class==1 | class==3 | class==5)

# 매치 연산자(Matching Operator) %in%
exam %>% filter(class %in% c(1,3,5))

# class가 1인 행을 추출하여, class1에 할당
class1 <- exam %>% filter(class==1)
class1

# class가 2인 행을 추출하여, class2에 할당
class2 <- exam %>% filter(class==2)
class2

# 1반 수학 점수 평균 구하기
mean(class1$math)

# 2반 수학 점수 평균 구하기
mean(class2$math)

# 교재 133쪽, 혼자서 해보기
# Q1, 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다.
# displ(배기량)dl 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg_a <- mpg %>% filter(displ<=4)
mpg_b <- mpg %>% filter(displ>=5)
mean(mpg_a$hwy)
mean(mpg_b$hwy)

# Q2, 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다.
# "audi"와 "toyota" 중 어느 manufacturer(자동차 제조 회사)의 cty(도시 연비)가 평균적으로 더 높은지 알아보세요.
mpg_audi <- mpg %>% filter(manufacturer=="audi")
mpg_toyota <- mpg %>% filter(manufacturer=="toyota")
mean(mpg_audi$cty)
mean(mpg_toyota$cty)

#Q3, "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다.
# 이 회사들의 데이터를 추출한 후 hwy 전체 평균을 구해 보세요.
mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_new$hwy)

# 필요한 변수만 추출하기
# math 추출
exam %>% select(math)

# english 추출
exam %>% select(english)

# class, math, english 추출
exam %>% select(class, math, english)

# math 제외
exam %>% select(-math)

# math, english 제외
exam %>% select(-math, -english)

# 컬럼 순서로 4열에서 5열 추출하기
exam %>% select(4:5)

# 컬럼 순서로 4열 제외하기
exam %>% select(-4)

# filter()와 select() 조합하기
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class==1) %>% select(english)

# 가독성 있게 줄 바꾸기 (%>% 다음에 엔터키)
exam %>%
  filter(class==1) %>%
  select(english)

# id와 math만 추출하고 앞부분만 출력하기
exam %>% 
  select(id,math) %>% 
  head

# id와 math만 추출하고 앞부분 10행만 출력하기
exam %>% 
  select(id,math) %>% 
  head(10)

# 교재 138쪽, 혼자서 해보기
# Q1, MPG 데이터는 11개 변수로 구성되어 있습니다. 이 중 일부만 추출해 분석에 활용하려고 합니다.
# mpg 데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만드세요.
# 새로운 데이터의 일부를 출력해 두 변수로만 구성되어 있는지 확인하세요.
mpg <- as.data.frame(ggplot2::mpg)
df <- mpg %>% select(class,cty)
head(df)

# Q2, 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 
# 앞에서 추출한 데이터를 이용해 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)가 더 높은지 알아보세요.
df_suv <- df %>% filter(class=="suv")
df_compact <- df %>% filter(class=="compact")
mean(df_suv$cty)
mean(df_compact$cty)

# math 오름차순 정렬
exam %>% arrange(math)

# math 내림차순 정렬
exam %>% arrange(desc(math))

# class 및 math 오름차순 정렬
exam %>% arrange(class, math)

# 교재 141쪽, 혼자서 해보기
# Q1, "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 합니다.
# "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출려갛세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% 
  filter(manufacturer=="audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)

# mutate()를 이용한 파생변수 추가하기
# mutate()는 데이터 원본(exam)이 바뀌지 않음 (비파괴적 함수)
# math, english, science 세 과목의 점수를 합한 총합 변수 total 만들기
exam %>% 
  mutate(total=math+english+science) %>% 
  head

# 총평균 변수 mean 추가하기
exam %>% 
  mutate(total=math+english+science,
         mean=(math+english+science)/3) %>% 
  head

# mutate() 함수로 추가한 파생변수 total을 생성과 동시에 mean 함수에 적용하기
exam %>% 
  mutate(total=math+english+science,
         mean=total/3) %>% 
  head

# mutate()에 ifelse() 적용하기
# science가 60점 이상이면 "pass", 미만이면 "fail"을 할당하는 파생변수 test 만들기
exam %>% 
  mutate(test=ifelse(science>=60, "pass", "fail")) %>% 
  head

# mutate() 함수로 추가한 파생변수 total을 생성과 동시에 arrange()로 정렬하기
exam %>% 
  mutate(total=math+english+science) %>% 
  arrange(total) %>% 
  head

# 교재 144쪽, 혼자서 해보기
# Q1, mpg 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가하세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new <- mpg_new %>% mutate(total=cty+hwy)
head(mpg_new)

# Q2, 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가하세요.
mpg_new <- mpg_new %>% mutate(mean=total/2)
head(mpg_new)

# Q3, '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력하세요.
mpg_new %>% 
  arrange(desc(mean)) %>% 
  head(3)

# Q4, 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어 실행해 보세요. 데이터는 복사본 대신 mpg 원본을 이용하세요.
mpg %>% 
  mutate(total=cty+hwy,
         mean=total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)

# mpg를 다시 출력해 보면, 원본 그대로임을 알 수 있습니다. (mutate 함수는 비파괴적 함수)
head(mpg)

# group_by()와 summarise() 
# summarise() 함수를 이용하여 math 평균 산출
exam %>% 
  summarise(mean_math=mean(math))
?summarise

# class별 math 평균 산출
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))
?group_by

# 변수명(mean_math)을 지정하지 않으면 함수명이 출력됨
exam %>% 
  group_by(class) %>% 
  summarise(mean(math)) 

# class별 math 평균, math 합계, math 중앙값, 학생수 산출
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math),
            sum_math=sum(math),
            median_math=median(math),
            n=n())

# mpg 데이터에서 제조회사 및 구동방식별로 분리해서, cty 평균 산출하고 앞부분 10개 출력
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head(10)

# 회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>%
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

# 교재 150쪽, 혼자서 해보기
# Q1, mpg 데이터의 class는 "suv", "compact" 등 자동차의 특징에 따라 일곱 종류로 분류한 변수입니다.
# 어떤 차종의 도시 연비가 높은지 비교해 보려고 합니다. class별 cty 평균을 구해 보세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty))
  
# Q2, 앞 문제의 출력 결과를 cty 평균이 높은 순으로 정렬하세요.
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))

# Q3, hwy 평균이 가장 높은 회사 세 곳을 출력하세요.
mpg %>%
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# Q4, 각 회사별 "compact" 차종 수를 내림차순으로 정렬하세요.
mpg %>% 
  filter(class=="compact") %>% 
  group_by(manufacturer) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count))

# 가로로 합치기
# 중간고사 데이터 생성
test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(60,80,70,90,85))
test1

# 기말고사 데이터 생성
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70,83,65,95,80))
test2

# dplyr 패키지 로드하기
library(dplyr)

# id를 기준으로 합쳐서 total에 할당
total <- left_join(test1,test2,by="id")
total

# (참고) join 함수 비교
x <- data.frame(id=c(1,2,3,4,5),score=c(60,80,70,90,85));x
y <- data.frame(id=c(1,2,3,6,7),score=c(70,83,65,95,80));y

# left_join(x,y, by=" ")  -> x의 모든 행 포함
left_join(x,y,by="id")

# right_join(x,y, by=" ") -> y의 모든 행 포함
right_join(x,y,by="id")

# inner_join(x,y, by=" ") -> all rows in x and y
inner_join(x,y,by="id")

# full_join(x,y, by=" ")  -> all rows in x or y
full_join(x,y,by="id")

# 담임교사 명단 데이트프레임 만들기
name <- data.frame(class=c(1,2,3,4,5),
                   teacher=c("kim", "lee", "park", "choi", "jung"))
name

# class를 기준으로 exam에 name 데이터프레임 합치기
exam_new <- left_join(exam, name, by="class")
exam_new

# 세로로 합치기
# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id=c(1,2,3,4,5),
                      test=c(60,80,70,90,85))
group_a

# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id=c(6,7,8,9,10),
                      test=c(70,83,65,95,80))
group_b

# bind_rows() 함수 이용 세로로 합치기
group_all <- bind_rows(group_a,group_b)
group_all

group_all2 <- rbind(group_a,group_b)
group_all2

# 교재 157쪽, 혼자서 해보기
# 연료와 가격으로 구성된 데이터 프레임 만들기
fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl=c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel
# 'stringsAsFactors'에 대한 설명은 교재 156쪽 하단 참조

# Q1, fuel 데이터를 이용해 mpg 데이터에 price_fl(연료 가격) 변수를 추가하세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg <- left_join(mpg, fuel, by="fl")

# Q2, model, fl, price_fl 변수를 추출해 앞부분 5행을 출력하세요.
mpg %>%
  select(model, fl, price_fl) %>%
  head(5)

# 교재 158쪽, 정리하기

## 1. 조건에 맞는 데이터만 추출하기
exam %>% filter(english>=80)

# 여러 조건 동시 충족
exam %>% filter(class==1 & math>=50)

# 여러 조건 중 하나 이상 충족
exam %>% filter(math>=90 | english>=90)
exam %>% filter(class %in% c(1,3,5))

## 2. 필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(class, math, english)

## 3. 함수 조합하기, 일부만 출력하기
exam %>% 
  select(id,math) %>% 
  head(10)

## 4. 순서대로 정렬하기
exam %>% arrange(math)        # 오름차순 정렬
exam %>% arrange(desc(math))  # 내림차순 정렬
exam %>% arrange(class, math) # 여러 변수 기준 오름차순 정렬

## 5. 파생변수 추가하기
exam %>% mutate(total=math+english+science)

# 여러 파생변수 한 번에 추가하기
exam %>% 
  mutate(total=math+english+science,
         mean=(math+english+science)/3)

# mutate()에 ifelse() 적용하기
exam %>% mutate(test=ifelse(science>=60, "pass", "fail"))

# 추가한 변수를 dplyr 코드에 바로 활용하기
exam %>% 
  mutate(total=math+english+science) %>% 
  arrange(total)

## 6. 집단별로 요약하기
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))

# 각 집단별로 다시 집단 나누기
mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mean_cty=mean(cty))

## 7. 데이터 합치기
# 가로로 합치기
total <- left_join(test1,test2,by="id")

# 세로로 합치기
group_all <- bind_rows(group_a,group_b)


# 교재 159쪽, 분석 도전!
# midwest 데이터를 사용해 데이터 분석 문제 해결하기
# midwest 데이터는 ggplot2 패키지에 들어 있음

# 데이터 불러오기
midwest <- as.data.frame(ggplot2::midwest)

# 문제1, popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타냅니다. '전체 인구 대비 미성년 인구 백분율' 변수를 추가하세요.

names(midwest) # midwest의 변수명 확인하기
str(midwest)  # 데이터 구조 및 변수명 확인

midwest <- midwest %>% mutate(ratio_child=(poptotal-popadults)/poptotal*100)
head(midwest)

# 문제2, 미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의 미성년 인구 백분율을 출력하세요.
midwest %>% 
  arrange(desc(ratio_child)) %>% 
  select(county, ratio_child) %>% 
  head(5)

# 문제3, 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보세요.
midwest <- midwest %>% 
  mutate(grade=ifelse(ratio_child>=40,"large",
                      ifelse(ratio_child>=30, "middle","small")))
table(midwest$grade)

# 문제4, popasian은 해당 지역의 아시아인 인구를 나타냅니다. '전체 인구 대비 아시아인 인구 백분율' 변수를 추가하고 하위 10개 지역의 state(주), county(지역), 아시아인 인구 백분율을 출력하세요.
midwest %>% 
  mutate(ratio_asian=(popasian/poptotal)*100) %>% 
  arrange(ratio_asian) %>% 
  select(state,county,ratio_asian) %>% 
  head(10)


# 07 데이터 정제 ---------------------------------------------------------------


