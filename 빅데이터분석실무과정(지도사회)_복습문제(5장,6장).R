# 빅데이터분석실무과정
# 2022-08-27 제6장, 제7장 복습문제


# 복습문제 --------------------------------------------------------------------


# 05 데이터 분석 기초! -----------------------------------------------------------


# Q1. 작업공간을 확인하세요.


# Q2. 'csv_exam.csv' 파일을 불러와서 exam으로 저장하세요


# Q3. exam 데이터를 파악해 보세요.


# Q4. 수학점수의 평균은?


# Q5. 수학점수가 가장 낮은 사람의 점수는?


# Q6. 수학점수가 가장 높은 사람의 점수는?


# Q7. 수학점수의 중간 50%의 범위는?


# Q8. 히스토그램으로 확인해보세요.


# Q9. ggplot2 패키지를 로드하세요.


# Q10. ggplot2 패키지의 mpg 데이터를 불러와서 mpg로 저장하세요.


# Q11. mpg 데이터를 파악해 보세요.


# Q12. 모든 자동차의 도시연비 평균은?


# Q13. 도시연비가 가장 낮은 자동차의 연비는?


# Q14. 도시연비가 가장 높은 자동차의 연비는?


# Q15. 도시연비의 중앙값은?


# Q16. 중앙값을 기준으로 50%의 범위는?


# Q17. 히스토그램으로 확인해보세요.


# Q18. mpg 데이터를 불러와서 cty와 hwy의 평균인 total 파생변수를 생성하세요.


# Q19. 통합연비변수 total의 평균을 구하세요.


# Q20. 통합연비변수 total의 히스토그램을 그리세요.


# Q21.통합연비변수 total의 박스플롯을 그리세요.


# Q22. 통합연비변수 total의 평균과 중앙값은 얼마인가요?


# Q23. 통합연비변수 total 20을 기준으로 'pass', 'fail' 파생변수 test를 생성하세요.


# Q24. 빈도표로 합격 판정 자동차 수를 확인하세요.


# Q25. 막대그래프로 빈도를 표현하세요.


# Q26. 통합연비변수 total을 기준으로 A(30이상), B(20이상), C(20미만)의 등급을 부여하세요.


# Q27. 등급별 빈도표를 생성하세요.


# Q28. 빈도 막대그래프를 그리세요.



# 06 자유자재로 데이터 가공하기 -------------------------------------------------------

# Q1. tidyverse 패키지를 로드하세요.


# Q2. dplyr 패키지를 로드하세요.


# Q3. 'csv_exam.csv' 파일을 불러와서 exam으로 저장하고, exam 데이터를 확인하세요.


# Q4. class별 빈도를 확인하세요.


# Q5. 1반 학생들의 데이터만 추출하세요.
# %>% (Pipe Operator, 파이프 연산자)를 이용하세요 : 단축키 'Ctrl + Shift + M' 


# Q6. 2반 학생들의 데이터만 추출하세요.


# Q7. 1반이 아닌 학생들의 데이터만 추출하세요.


# Q8. 3반이 아닌 학생들의 데이터만 추출하세요.


# Q9. 수학 점수가 50점을 초과한 데이터만 추출하세요.


# Q10. 영어 점수가 80점 이상인 데이터만 추출하세요.


# Q11. 1반이면서 수학 점수가 50점 이상인 데이터만 추출하세요.


# Q12. 2반이면서 수학 점수가 80점 이상인 데이터만 추출하세요.


# Q13. 수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 데이터만 추출하세요.


# Q14. 1반, 3반, 5반에 해당하는 데이터만 추출하세요.


# Q15. 위 14번 문제를 매치연산자(%in%)를 사용해서 추출하세요.


# Q16. 1반 학생의 데이터만 추출해서, class1으로 저장하고, 수학 점수의 평균을 구하세요.


# Q17. ggplot2 패키지의 mpg 데이터를 불러와서 mpg로 저장하세요.


# Q18. 배기량(displ)이 4이하인 자동차(mpg_a)와 5이상인 자동차(mpg_b)를 추출해서 변수에 저장하세요.


# Q19. 두 변수의 평균을 구해서 어느 자동차 그룹이 더 높은지 비교하세요.


# Q20. 'audi'와 'toyota' 중 어느 회사 자동차의 도시연비(cty)가 높은지 평균을 비교하세요.
# 'audi' 자동차를 추출해서 mpg_audi로 저장하고, 'toyota' 자동차를 추출해서 mpg_toyota로 저장하고 cty의 평균을 구해서 비교하세요. 


# Q21. 'chevrolet', 'ford','honda' 3개 제조사 자동차를 추출해서 변수에 저장(mpg_new)하고, 3개 자동차 회사 전체의 고속도로 연비(hwy) 평균을 구하세요. (매치연산자(%in%)를 사용)


# Q22. 'csv_exam.csv' 파일을 불러와서 exam으로 저장하고, exam 데이터를 확인하세요.


# Q23. exam 데이터에서 수학 점수만 추출하세요.


# Q24. exam 데이터에서 클래스(반), 수학점수, 영어점수를 추출하세요.


# Q25. exam 데이터에서 수학점수만 제외하고 추출하세요.


# Q26. exam 데이터에서 수학점수와 영어점수를 제외하고 추출하세요.


# Q27. 1반의 데이터에서 영어점수만 추출하세요.


# Q28. 3반의 데이터에서 id와 과학점수를 추출하세요.


# Q29. ggplot2 패키지의 mpg 데이터를 불러와서 mpg로 저장하세요.


# Q30. mpg 데이터에서 class(자동차 종류), cty(도시연비) 변수를 추출해 새로운 데이터(df)를 만드세요.


# Q31. class(자동차 종류)가 "suv"인 자동차(df_suv)와 "compact"인 자동차(df_compact) 중 어떤 자동차의 cty(도시연비)가 더 높은지 알아보세요.


# Q32. exam 데이터를 수학 점수를 기준으로 오름차순으로 정렬하세요.


# Q33. exam 데이터를 수학 점수를 기준으로 내림차순으로 정렬하세요.


# Q34. exam 데이터를 class와 수학 점수를 기준으로 오름차순으로 정렬하세요.


# Q34. mpg 데이터에서 "audi"가 생산한 자동차 중 hwy(고속도로 연비)가 높은 순서대로 1~5위를 정렬하세요.


# Q35. exam 데이터에서 math, english, science 세 과목의 점수를 합한 총합 변수 total을 만드세요.


# Q36. exam 데이터를 확인하고, mutate()가 비파괴적 함수임을 확인하세요.


# Q37. 총합 변수 total과 평균 변수 mean을 만드세요.


# Q38.mutate() 함수로 추가한 파생변수 total을 생성과 동시에 mean 함수에 적용해 보세요.


# Q39. mutate() 함수로 추가한 파생변수 total을 생성과 동시에 arrange()로 정렬해 보세요.


# Q40. science가 60점 이상이면 "pass", 미만이면 "fail"을 할당하는 파생변수 test를 만드세요.


# Q41. mpg 데이터 복사본(mpg_new)을 만들고, cty와 hwy를 더한 '합산 연비 변수(total)'를 추가하세요.


# Q42. 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수(mean)'를 추가하세요.


# Q43. '평균 연비 변수(mean)'가 가장 높은 자동차 3종의 데이터를 출력하세요.


# Q44. 41~43번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어 실행해 보세요. 데이터는 복사본 대신 mpg 원본을 이용하세요.


# Q45. mpg 데이터를 확인하고, mutate()가 비파괴적 함수임을 확인하세요.


# Q46. exam 데이터에서 class별로 수학점수의 평균을 구하세요.


# Q47. class별 math 평균, math 합계, math 중앙값, 학생수를 산출하세요.


# Q48. mpg 데이터에서 제조회사 및 구동방식별로 분리해서, cty 평균을 산출하고 앞부분 10개를 출력하세요.


# Q49. mpg 데이터에서 회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하세요.


# Q50. mpg 데이터의 class는 "suv", "compact" 등 자동차의 특징에 따라 일곱 종류로 분류한 변수입니다. 어떤 차종의 도시 연비가 높은지 비교해 보려고 합니다. class별 cty 평균을 구해 보세요.


# Q51. 앞 문제의 출력 결과를 cty 평균이 높은 순으로 정렬하세요.

          
# Q52. mpg 데이터에서 어떤 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려고 합니다. 제조사별 hwy 평균(mean_hwy)을 구하고, hwy 평균이 가장 높은 회사 세 곳을 출력하세요.


# Q53. 각 회사별 생산되는 "compact(경차)" 차종 수를 확인하고자 합니다.  회사별 "compact" 차종 수를 내림차순으로 정렬하세요.


# Q54. 중간고사 데이터(test1)와 기말고사 데이터(test2)를 가로로 합치세요.
# dplyr 패키지 로드하기
library(dplyr)

test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(60,80,70,90,85))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70,83,65,95,80))

# Q55. 담임교사 명단 데이트프레임(name)을 만들어, class를 기준으로 exam 데이터에 합치세요.
name <- data.frame(class=c(1,2,3,4,5),
                   teacher=c("kim", "lee", "park", "choi", "jung"))


# Q56. 학생 1~5번(group_a)와 학생 6~10번(group_b)를 세로로 합치세요.
group_a <- data.frame(id=c(1,2,3,4,5),
                      test=c(60,80,70,90,85))
group_b <- data.frame(id=c(6,7,8,9,10),
                      test=c(70,83,65,95,80))


# Q57. 연료와 가격으로 구성된 데이터프레임(fuel)을 이용해 mpg 데이터에 price_fl(연료 가격) 변수를 추가하고, mpg로 저장하세요.
fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl=c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)


# Q58. model, fl, price_fl 변수를 추출해 앞부분 5행을 출력하세요.


# Q59. ggplot2 패키지에 있는 midwest 데이터를 불러오세요.


# Q60. popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타냅니다. '전체 인구 대비 미성년 인구 백분율(ratio_child)' 변수를 추가하세요.


# Q61. 미성년 인구 백분율(ratio_child)이 가장 높은 상위 5개 county(지역)의 미성년 인구 백분율(ratio_child)을 출력하세요.


# Q62. 분류표의 기준에 따라 40% 이상은 'large', 30~40% 미만은 'middle', 30% 미만은 'small'로 구분하여 미성년 비율 등급 변수(grade)를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보세요.


# Q63. popasian은 해당 지역의 아시아인 인구를 나타냅니다. '전체 인구 대비 아시아인 인구 백분율(ratio_asian)' 변수를 추가하고 하위 10개 지역의 state(주), county(지역), 아시아인 인구 백분율을 출력하세요.

