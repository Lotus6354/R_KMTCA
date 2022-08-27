# 빅데이터분석실무과정(지도사회)
# 강사 : 홍용기 박사
# 보조강사 : 최용준 
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


# 07 데이터 정제 ---------------------------------------------------------------

# 현장에서 만들어진 실제 데이터는 오류를 포함하고 있기 때문에 분석하기 전에 오류를 수정해야 합니다.
# 데이터 전처리가 분석 결과를 좌우한다
# 쓰레기를 넣으면 쓰레기가 나온다(garbage in, garbage out)

# 결측치 찾기 (NA: Not Applicable)
df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score=c(5,4,3,4,NA))
df

# 문자는 <NA>, 숫자는 NA
# QUIZ, "NA"는 무슨 의미일까요?

# 결측치 확인하기
is.na(df)

# 결측치 빈도 확인하기
table(is.na(df))

# 컬럼별 결측치 빈도 확인하기
table(is.na(df$sex))
table(is.na(df$score))

# 결측치가 포함된 데이터 연산하기
mean(df$score)
sum(df$score)

# 결측치 제거하기

# dplyr 패키지 로드하기
library(dplyr)

# dplyr 패키지의 filter 함수를 이용한 결측치 제거
# score에서 결측치만 출력하기
df %>% filter(is.na(score))

# score에서 결측치가 아닌 데이터만 출력하기
df %>% filter(!is.na(score))

# score에서 결측치가 아닌 데이터(=결측치 제거 데이터)를 새로운 변수에 저장하기
df_nomiss <- df %>% filter(!is.na(score))
df_nomiss

# score 평균 및 합계 연산하기
mean(df_nomiss$score)
sum(df_nomiss$score)

# 여러 변수(score, sex)의 결측치 제거하기
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# 결측치가 하나라도 있으면 제거하기
# 단, na.omit() 함수는 모든 NA를 제거하기 때문에, 분석에 필요한 행까지 손실된다는 단점이 있음
# 따라서 filter() 함수를 이용해 결측치를 제거하는 방식을 권함(교재 166쪽)
df_nomiss2 <- na.omit(df)
df_nomiss2

# 실제 데이터 샘플 소개

# na.rm 파라미터 활용
# na.rm: na.remove
# 파라미터(parameter): 매개변수
df
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

# exam 데이터 불러오기
exam <- read.csv("data/csv_exam.csv")
head(exam)

# math컬럼의 3,8,15행에 결측치 할당
exam[c(3,8,15),"math"] <- NA
exam
# [행, 렬]

is.na(exam$math)
table(is.na(exam$math))

# 수학 평균 계산하기
exam %>% summarise(mean_math=mean(math))
mean(exam$math)

# 결측치를 제외하고 수학 평균 계산하기
exam %>% summarise(mean_math=mean(math, na.rm = T))
mean(exam$math, na.rm=T)

# 결측치를 제외하고 수학 평균, 합계, 중앙값 계산하기
exam %>% summarise(mean_math=mean(math, na.rm = T),
                   sum_math=sum(math, na.rm = T),
                   median_math=median(math, na.rm = T))

# 평균값으로 결측치 대체하기
# 평균값 구하기
mean(exam$math, na.rm=T)

# ifelse 구문을 이용하여 결측치 대체하기
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
exam$math
table(is.na(exam$math))
mean(exam$math)


# 교재 170쪽, 혼자서 해보기
# mpg 데이터를 불러와 아래와 같이 결측치 만들기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

# Q1, drv(구동방식)별 hwy(고속도로 연비) 평균을 알아보려고 한다. 분석을 하기 전에 두 변수에 결측치가 있는지 확인하시오.
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# Q2, filter() 함수를 이용해 hwy 변수의 결측치를 제외하고, 어떤 구동 방식의 hwy 평균이 높은지 하나의 dplyr 구문으로 작성하시오.

# dplyr 패키지 로드하기
library(dplyr)

mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))


# 이상치(outlier)

# 이상치 제거하기 - 존재할 수 없는 값

# sex에 3이라는 이상치 할당
# score에 6이라는 이상치 할당
outlier <- data.frame(sex=c(1,2,1,3,2,1),
                      score=c(5,4,3,4,2,6))
outlier

# 이상치 확인하기
table(outlier$sex)
table(outlier$score)

# 이상치를 결측치로 변환하기
# ifelse() 함수를 이용하여 이상치일 경우 NA를 부여
outlier$sex <- ifelse(outlier$sex==3,NA,outlier$sex)
outlier
outlier$score <- ifelse(outlier$score>5,NA,outlier$score)
outlier

# 결측치를 제외하고 성별 평균점수 구하기
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score=mean(score))

# 이상치 제거하기 - 극단적인 값

# 상자 그림으로 극단치 기준 정하기

# mpg 데이터의 hwy 변수로 상자그림 그리기
# 다섯숫자요약, 이상치 확인하기
boxplot(mpg$hwy)

# 상자그림의 통계치 출력하기 (다섯숫자요약)
boxplot(mpg$hwy)$stats

# 이상치를 결측치로 변환하기
# ifelse() 함수를 이용하여 이상치일 경우 NA를 부여
mpg$hwy <- ifelse(mpg$hwy<12 | mpg$hwy>37,NA,mpg$hwy)
mpg$hwy
table(is.na(mpg$hwy))

# 결측치를 제외하고 drv별 hwy 평균 구하기
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy, na.rm=T))

mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))

# 교재 178쪽, 혼자서 해보기

# mpg 데이터를 불러와 이상치 만들기
mpg <- as.data.frame(ggplot2::mpg)

# drv 변수는 4(사륜구동),f(전륜구동),r(후륜구동)의 세 종류인데, 존재할 수 없는 값 k를 할당
mpg[c(10,14,58,93),"drv"] <- "k"

# cty 변수에 극단적으로 크거나 작은 값을 할당
mpg[c(29,43,129,203),"cty"] <- c(3,4,39,42)

# Q1, drv 변수에 이상치가 있는지 확인하세요.
table(mpg$drv)

# 이상치를 결측처리하세요. 
mpg$drv <- ifelse(mpg$drv %in% c("4","f","r"),mpg$drv,NA)

# 결측처리 후 이상치가 있는지 확인하세요.
table(mpg$drv)

# Q2, 상자그림을 이용하여 cty 변수에 이상치가 있는지 확인하세요.
boxplot(mpg$cty)

# 상자그림의 통계치를 이용하여 cty 변수의 이상치 기준을 확인하세요.
boxplot(mpg$cty)$stats

# 이상치를 결측 처리하세요.
mpg$cty <- ifelse(mpg$cty<9 | mpg$cty>26, NA, mpg$cty)

# 결측 처리 후 상자그림으로 이상치 제거 여부를 확인하세요.
boxplot(mpg$cty)

# Q3, 결측치를 제외한 다음 drv별 cty 평균을 구하세요.
mpg %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty=mean(cty))


# 교재 179쪽, 정리하기

## 1. 결측치 정제하기

# 결측치 확인
table(is.na(df$score))

# 결측치 제거
df_nomiss <- df %>% filter(!is.na(score))

# 여러 변수 동시에 결측치 제거
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))

# 함수의 결측치 제외 기능 이용하기
mean(df$score, na.rm = T)
exam %>% summarise(mean_math=mean(math),na.rm=T)


## 2. 이상치 정제하기

# 이상치 확인
table(outlier$sex)

# 결측 처리
outlier$sex <- ifelse(outlier$sex==3,NA,outlier$sex)

# boxplot으로 극단치 기준 찾기
boxplot(mpg$hwy)$stats

# 극단치 결측 처리
mpg$hwy <- ifelse(mpg$hwy<12 | mpg$hwy>37,NA,mpg$hwy)


