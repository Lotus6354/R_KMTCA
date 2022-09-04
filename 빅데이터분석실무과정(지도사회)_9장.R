# 작업공간 지정 -----------------------------------------------------------------

# 작업공간 지정하기
setwd("C:/Users/SEC/Documents/빅데이터분석실무과정")
# 마우스 우측버튼 '주소를 텍스트로 복사' <가능하면 '복사하기+붙여넣기'를 해야 오타를 줄임>

# 작업공간 확인하기
getwd()



# 09 데이터 분석 프로젝트 - '한국인의 삶을 파악하라!' ----------------------------------------


## 09-1 데이터 준비하기 --------------------------------------------------------

# 09-1 데이터 준비하기 ("Koweps_hpc10_2015_beta1.sav")

# 패키지 설치하기
install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

# 데이터 불러오기
raw_welfare <- read.spss(file="data/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)

# Warning message:https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=2116volls&logNo=221547073253

# 복사본 만들기
welfare <- raw_welfare

# 데이터 검토하기
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

# 변수명 바꾸기
# 한국복지패널 코딩북 https://www.koweps.re.kr:442/data/book/list.do
welfare <- rename(welfare,
                 sex=h10_g3,
                 birth=h10_g4,
                 marriage=h10_g10,
                 religion=h10_g11,
                 income=p1002_8aq1,
                 code_job=h10_eco9,
                 code_region=h10_reg7
)

# 데이터 분석 절차
# 1단계. 변수 검토 및 전처리
# 2단계. 변수 간 관계 분석


## 09-2 성별에 따른 월급 차이 -----------------------------------------------------

# 성별 변수 타입 확인
class(welfare$sex)

# 범주별 개수 확인
table(welfare$sex)

# 이상치 확인
table(welfare$sex)

# 이상치 결측 처리
welfare$sex <- ifelse(welfare$sex==9, NA, welfare$sex)

# 결측치 확인
table(is.na(welfare$sex))

# 결측치가 있는 경우 제거하기
# welfare$sex %>% filter(!is.na(welfare$sex))

# 성별 항목 이름 부여
welfare$sex <- ifelse(welfare$sex==1,"male","female")
table(welfare$sex)
qplot(welfare$sex)

# 월급 변수 검토 및 전처리

# 월급 변수 확인
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income)+xlim(0,1000)

# 이상치 확인
summary(welfare$income)

# 이상치 결측 처리
# 매치 연산자(Matching Operator) %in%
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)

# 결측치 확인
table(is.na(welfare$income))

# 성별에 따른 월급 차이 분석하기
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income=mean(income))

sex_income

ggplot(data=sex_income, aes(x=sex,y=mean_income))+geom_col()
# ggplot(data=sex_income, aes(x=sex))+geom_bar()
# geom_col()과 geom_bar() 차이 https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=lee-korea&logNo=221762296190
# aesthetic 미적인
# ggplot2의 레이어 구조
# 1단계 : 배경 설정 (축)
# 2단계 : 그래프 추가 (점, 막대, 선)
# 3단계 : 설정 추가 (축 범위, 색, 표식)


## 09-3 나이와 월급의 관계 ------------------------------------------------------

# 변수 검토하기
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

# 전처리
# 이상치 확인
summary(welfare$birth)

# 결측치 확인
table(is.na(welfare$birth))

# 이상치 결측 처리
welfare$birth <- ifelse(welfare$birth==9999, NA, welfare$birth)
table(is.na(welfare$birth))

# 파생변수 만들기 - 나이
welfare$age <- 2015-welfare$birth+1
summary(welfare$age)
qplot(welfare$age)

# 나이와 월급의 관계 분석
# 나이에 따른 월급 평균표 만들기
age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income=mean(income))

head(age_income)

# 그래프 만들기
ggplot(data=age_income, aes(x=age,y=mean_income))+geom_line()
ggplot(data=age_income, aes(x=age,y=mean_income))+geom_col()


## 09-4 연령대에 따른 월급 차이 ---------------------------------------------------

# 파생변수 만들기 - 연령대
welfare <- welfare %>% 
  mutate(ageg=ifelse(age<30,"young",
                     ifelse(age<=59,"middle","old")))
table(welfare$ageg)
# mutate()는 비파괴적 함수

qplot(welfare$ageg)

# 연령대에 따른 월급 차이 분석하기
ageg_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income=mean(income))

ageg_income

# 그래프 만들기
ggplot(data=ageg_income, aes(x=ageg,y=mean_income))+geom_col()

# 나이순으로 정렬
ggplot(data=ageg_income, aes(x=ageg,y=mean_income))+
  geom_col()+
  scale_x_discrete(limits=c("young","middle","old"))


## 09-5 연령 및 성별 월급 차이 ---------------------------------------------------

# 연령대 및 성별 월급 평균표 만들기
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mean_income=mean(income))

sex_income

# 그래프 만들기
ggplot(data=sex_income, aes(x=ageg,y=mean_income,fill=sex))+
  geom_col()+
  scale_x_discrete(limits=c("young","middle","old"))

ggplot(data=sex_income, aes(x=ageg,y=mean_income,fill=sex))+
  geom_col(position="dodge")+
  scale_x_discrete(limits=c("young","middle","old"))
# dodge 피하다, 비키다

# 나이 및 성별 월급 차이 분석하기
# 성별 연령별 월급 평균표 만들기
sex_age <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age,sex) %>% 
  summarise(mean_income=mean(income))

head(sex_age)

# 그래프 만들기
ggplot(data=sex_age, aes(x=age,y=mean_income,col=sex))+
  geom_line()
ggplot(data=sex_age, aes(x=age,y=mean_income,color=sex))+
  geom_line()
ggplot(data=sex_age, aes(x=age,y=mean_income))+
  geom_line()


## 09-6 직업별 월급 차이 -------------------------------------------------------

# 변수 검토하기
class(welfare$code_job)
table(welfare$code_job)

# 파일불러오기
library(readxl)
list_job <- read_excel("data/Koweps_Codebook.xlsx", col_names=T, sheet=2)
head(list_job)
dim(list_job)

# job 변수를 결합하기
welfare <- left_join(welfare,list_job,id="code_job")

welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job,job) %>% 
  head(10)

# 직업별 월급 평균표 만들기
job_income <- welfare %>% 
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income=mean(income))
head(job_income)

# 내림차순 정렬
top10 <- job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)

top10

# 그래프 만들기
ggplot(data=top10, aes(x=reorder(job,mean_income), y=mean_income))+
  geom_col()+
  coord_flip()
# coordl_flip 그래프 회전 https://blog.naver.com/PostView.nhn?blogId=regenesis90&logNo=222199639344

# 하위 10위 추출
bottom10 <- job_income %>% 
  arrange(mean_income) %>% 
  head(10)

bottom10

# 그래프 만들기
ggplot(data=bottom10, aes(x=reorder(job,-mean_income), y=mean_income))+
  geom_col()+
  coord_flip()+
  ylim(0,850)

ggplot(data=bottom10, aes(x=reorder(job,mean_income), y=mean_income))+
  geom_col()+
  coord_flip()+
  ylim(0,850)


## 09-7 성별 직업 빈도 --------------------------------------------------------

# 성별 직업 빈도표 만들기
# 남성 직업 빈도 상위 10개 추출
job_male <- welfare %>% 
  filter(!is.na(job) & sex=="male") %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)

job_male

# 여성 직업 빈도 상위 10개 추출
job_female <- welfare %>% 
  filter(!is.na(job) & sex=="female") %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)

job_female

# 그래프 만들기
# 남성 직업 빈도 상위 10개 직업
ggplot(data=job_male, aes(x=reorder(job,n), y=n))+
  geom_col()+
  coord_flip()

# 여성 직업 빈도 상위 10개 직업
ggplot(data=job_female, aes(x=reorder(job,n), y=n))+
  geom_col()+
  coord_flip()


## 09-8 종교 유무에 따른 이혼률 ---------------------------------------------------

# 종교변수 검토하기
class(welfare$religion)
table(welfare$religion) # 1.있음 2.없음

# 종교 유무 이름 부여
welfare$religion <- ifelse(welfare$religion==1,"yes","no")
table(welfare$religion)

qplot(welfare$religion)

# 혼인 상태 변수 검토하기
class(welfare$marriage)
table(welfare$marriage)

# 이혼 여부 변수 만들기
welfare$group_marriage <- ifelse(welfare$marriage==1,"marriage",
                                 ifelse(welfare$marriage==3,"divorce",NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)

# 종교 유무에 따른 이혼율 표 만들기
religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
religion_marriage

religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(religion, group_marriage) %>% 
  group_by(religion) %>% 
  mutate(pct=round(n/sum(n)*100,1))
religion_marriage

# 이혼 추출
divorce <- religion_marriage %>% 
  filter(group_marriage=="divorce") %>% 
  select(religion,pct)

divorce

# 그래프 만들기
ggplot(data=divorce, aes(x=religion, y=pct))+
  geom_col()

# 연령대 및 종교 유무에 따른 이혼율 분석하기
# 연령대별 이혼율 표 만들기
ageg_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(ageg, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
ageg_marriage

ageg_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(ageg, group_marriage) %>% 
  group_by(ageg) %>% 
  mutate(pct=round(n/sum(n)*100,1))
ageg_marriage


## 09-9 지역별 연령대 비율 ------------------------------------------------------




# 13 통계 분석 기법을 이용한 가설 검정 --------------------------------------------------

mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)

# compact 자동차와 suv 자동차의 도시 연비 t검정
mpg_diff <- mpg %>% 
  select(class,cty) %>% 
  filter(class %in% c("compact","suv"))
head(mpg_diff)
table(mpg_diff$class)

t.test(data=mpg_diff, cty~class, var.equal=T)

# 일반 휘발유와 고급 휘발유의 도시 연비 t검정
mpg_diff2 <- mpg %>% 
  select(fl,cty) %>% 
  filter(fl %in% c("r","p")) # r:regular, p:premium
head(mpg_diff2)
table(mpg_diff2$fl)

t.test(data=mpg_diff2, cty~fl, var.equal=T)


# 상관분석

economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)

# 상관행렬 히트맵 만들기
head(mtcars)
car_cor <- cor(mtcars) # 상관행렬 생성
round(car_cor,2) # 소수점 셋째 자리에서 반올림해 출력

install.packages("corrplot")
library(corrplot)

corrplot(car_cor)

corrplot(car_cor, method="number")

