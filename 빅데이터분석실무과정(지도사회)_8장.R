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


# 08 그래프 만들기 --------------------------------------------------------------

# ggplot2의 레이어 구조
# 1단계 : 배경 설정 (축)
# 2단계 : 그래프 추가 (점, 막대, 선)
# 3단계 : 설정 추가 (축 범위, 색, 표식)

# 산점도 만들기

# ggplot2 패키지 로드하기
library(ggplot2)

# 1단계 : 배경 설정
# x축은 displ, y축은 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x=displ,y=hwy))
# aes: aesthetic(미적인, 심미적인)

# 2단계 : 그래프 추가
# 배경에 산점도 추가
ggplot(data = mpg, aes(x=displ,y=hwy)) + geom_point()

# 3단계 : 설정 추가
# x축 범위를 3~6으로 지정
ggplot(data = mpg, aes(x=displ,y=hwy)) + geom_point() + xlim(3,6)

# Warning message:
# Removed 105 rows containing missing values (geom_point). 

# y축 범위를 10~30으로 지정
ggplot(data = mpg, aes(x=displ,y=hwy)) +
  geom_point() +
  xlim(3,6) +
  ylim(10,30)


# 그래프를 이미지 파일로 저장하기
# Plots > Export > Save as Image

# qplot과 ggplot
# qplot()은 기능은 많지 않지만 문법이 간단하기 때문에 주로 전처리 단계에서 데이터를 확인하는데 활용
# ggplot()은 다양한 그래프 기능을 이용해 분석 결과를 보고하는데 활용


# 교재 188쪽, 혼자서 해보기

# Q1, mpg 데이터의 cty(도시 연비)와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 산점도를 만들어 분석하세요.
ggplot(data=mpg,aes(x=cty,y=hwy))+
  geom_point()

# Q2, midwest 데이터를 이용해 x축은 poptotal(전체 인구), y축은 popasian(아시아인 인구)으로 된 산점도를 만들고, 전체인구는 50만명이하, 아시아인 인구는 1만 명 이하인 지역만 산점도에 표시되게 설정하세요.
midwest <- as.data.frame(ggplot2::midwest)
ggplot(data=midwest,aes(x=poptotal,y=popasian))+
  geom_point()+
  xlim(0,500000)+
  ylim(0,10000)


