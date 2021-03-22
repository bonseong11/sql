join 8
erd 다이어그램을 참고하여 countries, regions 테이블을 이용하여 
지역별 소속 국가를 다음과 같은 결과가 나오도록 쿼리를 쿼리를 작성

SELECT *
FROM countries;

SELECT *
FROM regions;

SELECT regions.region_id, region_name, country_name 
FROM countries, regions
WHERE countries.region_id = regions.region_id;