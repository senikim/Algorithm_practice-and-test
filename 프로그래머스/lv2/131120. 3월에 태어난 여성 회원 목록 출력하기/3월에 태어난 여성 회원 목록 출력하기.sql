-- 코드를 입력하세요

-- [23-03-04 SQL 코딩테스트 / 프로그래머스]

-- [TRIAL & ERROR 1]
-- DATE_OF_BIRTH 의 데이트 포맷이 예시(1993-03-16)와 동일하지 않아서 틀림
-- 아래 코드로는 [1992-03-16 00:00:00] 로, 시간까지 나옴

SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE DATE_OF_BIRTH LIKE "%%-03-%%"
AND TLNO IS NOT NULL
ORDER BY MEMBER_ID ASC


-- [TRIAL & ERROR 2]
-- TE1 해결 : SELECT date_format으로 연도, 날짜, 일까지 출력
-- DATE_OF_BIRTH가 [92-03-16]로, 연도의 앞자리가 짤림

SELECT MEMBER_ID, MEMBER_NAME, GENDER, date_format(DATE_OF_BIRTH, "%y-%m-%d") AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE DATE_OF_BIRTH LIKE "%%-03-%%"
AND TLNO IS NOT NULL
ORDER BY MEMBER_ID ASC


-- [TRIAL & ERROR 3]
-- TE2 해결:  date_format(DATE_OF_BIRTH, "%Y-%m-%d") - %Y 여야지 연도 전체 출력
-- 그래도 오류남 이유를 모르겠음 찾는 중

SELECT MEMBER_ID, MEMBER_NAME, GENDER, date_format(DATE_OF_BIRTH, "%Y-%m-%d") AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE DATE_OF_BIRTH LIKE "%%-03-%%"
AND TLNO IS NOT NULL
ORDER BY MEMBER_ID ASC


-- [TRIAL & ERROR 4]
-- 문제 제대로 안읽음 : "여성 회원"만 추출해야 함!!

SELECT MEMBER_ID, MEMBER_NAME, GENDER, date_format(DATE_OF_BIRTH, "%Y-%m-%d") AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE DATE_OF_BIRTH LIKE "%%-03-%%"
AND GENDER LIKE 'w'
AND TLNO IS NOT NULL
ORDER BY MEMBER_ID ASC
