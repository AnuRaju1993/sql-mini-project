use mini_project;
SELECT * FROM mini_project.student;


#### 1.count
select count(student_id) as total_no_of_students from student;
#####2
select avg(exam_score) as average_score 
from student;

####3
select
case
 when study_hours_per_day>=5.5 then 'high'
 when study_hours_per_day>=4.5 then 'medium'
 else 'low '
 end as study_hours ,avg(exam_score) as avg_score
 from student
 group by study_hours
 order by avg_score desc;
  
  
  ######4
  ###14categorizing sleep
select
case
 when sleep_hours>=7.5 then 'good quality'
 when sleep_hours>=5.5 then 'medium quality'
 else 'low quality'
 end as sleep_quality,avg(exam_score) as avg_score
 from student
 group by sleep_quality
 order by avg_score desc;
 ######5
 ### categorizing social media usage
SELECT
  CASE
    WHEN social_media_hours < 1 THEN 'Low'
    WHEN social_media_hours BETWEEN 1 AND 2 THEN 'Medium'
    ELSE 'High'
  END AS usage_level,
  AVG(exam_score) AS avg_score
FROM student
GROUP BY usage_level
order by avg_score;

###6
select
case
 when attendance_percentage>=90 then 'high'
 when attendance_percentage>=80 then 'above average'
  when attendance_percentage>=70 then 'average'
 else 'below average'
 end as attendance,avg(exam_score) as avg_score
 from student
 group by attendance
 order by avg_score desc;
  
#####7CATEGORIZING THE MENTAL HEALTH
SELECT 
CASE
WHEN mental_health_rating>=7 then 'GOOD'
WHEN mental_health_rating>=5 then 'MEDIUM'
WHEN mental_health_rating>=3 then 'LOW'
WHEN mental_health_rating>=1 then 'VERY LOW'
END AS mental_health,avg(exam_score)
from student
group by mental_health
order by avg(exam_score) desc;
###8
 
SELECT 
CASE
WHEN exercise_frequency<=1 then 'LOW'
WHEN exercise_frequency<=3 then 'MEDIEUM'
WHEN exercise_frequency<=6 then 'VERY ACTIVE'

END AS exercise,avg(exam_score)

from student
group by exercise
order by avg(exam_score) desc;


#####9
select diet_quality,avg(exercise_frequency),avg(sleep_hours),avg(mental_health_rating)
from student
group by diet_quality;

######10
select part_time_job,avg(mental_health_rating),avg(study_hours_per_day),avg(sleep_hours),avg(exam_score),avg(exercise_frequency)
from student
group by part_time_job
order by avg(exam_score);

###11the averge exam score by parental education
select parental_education_level,avg(exam_score),count(student_id)
from student
group by parental_education_level
order by avg(exam_score) desc;

######12
select avg(exam_score),extracurricular_participation
from student
group by extracurricular_participation;
####13
select diet_quality

,avg(exam_score)
 from student
 group by diet_quality;
 
 ### 14.average study hours per gender AND EXAM SCORE
select avg(study_hours_per_day) as avg_study_hours,gender,avg(exam_score)
from student
group by gender
order by avg_study_hours desc;


####15. the averge exam score by parental education
select parental_education_level,avg(exam_score),count(student_id)
from student
group by parental_education_level
order by avg(exam_score) desc;
#####16
select internet_quality,avg(exam_score),avg(social_media_hours),avg(study_hours_per_day),avg(netflix_hours)
from student
group by internet_quality
order by avg(exam_score);
###17. top ten students with id and gender
select ROW_NUMBER() OVER () AS index_no,student_id,gender,exam_score
from student
order by exam_score desc
limit 10;







### 18. union of top 5 and bottom 5 student with their average study hours average netflix hours , avg social media hours,avg exercise hours and count of students
(select avg(study_hours_per_day),avg(netflix_hours),avg(social_media_hours
),avg(exercise_frequency),exam_score
from student
group by exam_score
order by exam_score desc
limit 5)
union
(select avg(study_hours_per_day),avg(netflix_hours),avg(social_media_hours
),avg(exercise_frequency),exam_score
from student
group by exam_score
order by exam_score 
limit 5);



#### 19.no student whoe score under 45
select count(student_id)
from student
where exam_score<=45;


###20 diet quality on exam score,excersize, and sleep
select diet_quality,avg(mental_health_rating),avg(study_hours_per_day),avg(sleep_hours),avg(exam_score)
from student
group by diet_quality
order by avg(exam_score);

######21
select  count(student_id),exam_score
from student
group by exam_score
order by exam_score desc
limit 10;

##22
(select  count(student_id),exam_score,avg(netflix_hours),avg(study_hours_per_day
),avg(social_media_hours),avg(exercise_frequency
)


from student
group by exam_score
order by exam_score desc
limit 5)
union
(select  count(student_id),exam_score,avg(netflix_hours),avg(study_hours_per_day
),avg(social_media_hours),avg(exercise_frequency
)


from student
group by exam_score
order by exam_score 
limit 5);

######

######23
select count(student_id),gender
from student
where exam_score>=80
group by gender;
######
select count(student_id),gender
from student

group by gender;
#######24
select
case
when age<=20 then 'below 20'
when age between 20 and 25 then 'b/n 20 and 25'
else 'above or equal to 25'
end as age_group,avg(exam_score)
from student
group by age_group
order by avg(exam_score);
#######25

SELECT student_id, exercise_frequency,avg(exam_score)
FROM student
group by student_id,exercise_frequency
ORDER BY exercise_frequency DESC
LIMIT 5;

####
select count(student_id)
from student
where exam_score>=80 ;

