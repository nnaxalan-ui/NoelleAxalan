--
-- View data from Table `noelle-project-05-2026.Project_Data.student_performance_finalscore`
--

SELECT * 
FROM `noelle-project-05-2026.Project_Data.student_performance_finalscore`;

--
-- View data from Table `noelle-project-05-2026.Project_Data.student_performance`
--

SELECT * 
FROM `noelle-project-05-2026.Project_Data.student_performance`;

--
-- Join tables to create Table `noelle-project-05-2026.Project_Data.student_performance_data` to focus on specific varaibles 
--

CREATE OR REPLACE TABLE `noelle-project-05-2026.Project_Data.student_performance_data` AS
SELECT 
    f.`Student_ID`,
    f.`Gender`,
    f.`Sleep_Hours`,
    f.`Study_Method`,
    f.`Tutoring_Sessions_Per_Week`,
    f.`Diet_Quality`,
    f.`Family_Income_Level`,
    f.`Previous_GPA`,
    f.`Stress_Level`,
    f.`Exam_Anxiety_Score`,
    f.`Final_Score`,
    s.`Grade`
FROM `noelle-project-05-2026.Project_Data.student_performance_finalscore` AS f
JOIN `noelle-project-05-2026.Project_Data.student_performance` AS s
  ON f.`Student_ID` = s.`Student_ID`;

SELECT *
FROM `noelle-project-05-2026.Project_Data.student_performance_data`;

--
-- Investigating Correlations and Anxiety 'Thresholds'
--

SELECT ROUND(CORR(`Exam_Anxiety_Score`, `Final_Score`), 2) AS `Anxiety_Performance_Corr`
FROM `noelle-project-05-2026.Project_Data.student_performance_data`;

SELECT ROUND(CORR(`Previous_GPA`, `Final_Score`), 2) AS `GPA_Performance_Corr`
FROM `noelle-project-05-2026.Project_Data.student_performance_data`;

SELECT ROUND(CORR(`Previous_GPA`, `Exam_Anxiety_Score`), 2)
FROM `noelle-project-05-2026.Project_Data.student_performance_data`;

SELECT `Previous_GPA`,
   `Exam_Anxiety_Score`,
   `Final_Score`
FROM `noelle-project-05-2026.Project_Data.student_performance_data`
ORDER BY 1 DESC;

SELECT `Previous_GPA`,
   `Exam_Anxiety_Score`,
   `Final_Score`
FROM `noelle-project-05-2026.Project_Data.student_performance_data`
WHERE `Previous_GPA`<= 4.0
ORDER BY 1 DESC;
--
-- Categorize student's Previous GPAs by their proximity to a Grade Threshold and compare to Average Anxiety Scores
--

SELECT 
    CASE
      WHEN `Previous_GPA` BETWEEN 3.3 AND 3.6 THEN 'Honors Border'
      WHEN `Previous_GPA` BETWEEN 2.9 AND 3.1 THEN 'B/C Border'
      WHEN `Previous_GPA` BETWEEN 1.9 AND 2.1 THEN 'Academic Probation Border'
      ELSE 'Safe'
    END AS `GPA_Group`,
    ROUND(AVG (`Exam_Anxiety_Score`), 2) AS `Avg_Anxiety`,
    ROUND(STDDEV(`Exam_Anxiety_Score`), 2) AS `Anxiety_Sigma`,
    COUNT(*) AS `Student_Count`
  FROM `noelle-project-05-2026.Project_Data.student_performance_data`
  GROUP BY 1;

--
-- Categorize by which side of the threshold studens are on and compare to anxiety scores
--

SELECT 
    CASE
      WHEN `Previous_GPA` >= 3.5 AND `Previous_GPA` <= 3.6 THEN 'At Risk Honors'
      WHEN `Previous_GPA` >= 3.0 AND `Previous_GPA` < 3.1 THEN 'Aspiring Honors'
      WHEN `Previous_GPA` >= 2.9 AND `Previous_GPA` <= 3.0 THEN 'At Risk B'
      WHEN `Previous_GPA` >= 2.6 AND `Previous_GPA` < 2.7 THEN 'Aspiring C'
      WHEN `Previous_GPA` >= 2.0 AND `Previous_GPA` <= 2.18 THEN 'At Risk C'
      WHEN `Previous_GPA` >= 1.9 AND `Previous_GPA` < 2.0 THEN 'Aspiring D'
      ELSE 'Safe'
    END AS `GPA_Status`,
    ROUND(AVG (`Exam_Anxiety_Score`), 2) AS `Avg_Anxiety`,
    ROUND(STDDEV(`Exam_Anxiety_Score`), 2) AS `Anxiety_Sigma`,
    COUNT(*) AS `Student_Count`
  FROM `noelle-project-05-2026.Project_Data.student_performance_data`
  GROUP BY 1;

--
-- Phase 2: Checking Safeguard and Mitigating Factors
--
--
-- Isolate C/D Borderline students and categorize by 'Tutored' and 'Not Tutored' students, compared the final score and anxiety results
--

SELECT 
  CASE 
    WHEN `Tutoring_Sessions_Per_Week` > 0 THEN 'Tutored'
    ELSE 'Not Tutored'
  END AS `Support_Status`,
  ROUND(AVG(`Final_Score`), 2) AS `AVG_Final_Score`,
  ROUND(AVG(`Exam_Anxiety_Score`), 2) AS `AVG_Anxiety`,
  ROUND(STDDEV(`Final_Score`), 2) AS `Score Sigma`,
  ROUND(STDDEV(`Exam_Anxiety_Score`), 2) AS `Anxiety_Signma`,
  COUNT(*) AS `Student_Count`
FROM `noelle-project-05-2026.Project_Data.student_performance_data`
GROUP BY 1;

WITH `JeopardyStudents` AS (
  SELECT
  `Student_ID`,
  `Final_Score`,
  `Exam_Anxiety_Score`,
  `Tutoring_Sessions_Per_Week`,
  CASE
    WHEN `Previous_GPA` BETWEEN 1.9 AND 2.1 THEN 'Academic Probation Border'
    ELSE 'Other'
  END AS `GPA_bucket`
  FROM `noelle-project-05-2026.Project_Data.student_performance_data`
  WHERE `Previous_GPA` BETWEEN 1.9 AND 2.1
)

SELECT 
  CASE 
    WHEN `Tutoring_Sessions_Per_Week` > 0 THEN 'Tutored'
    ELSE 'Not Tutored'
  END AS `Support_Status`,
  ROUND(AVG(`Final_Score`), 2) AS `AVG_Final_Score`,
  ROUND(AVG(`Exam_Anxiety_Score`), 2) AS `AVG_Anxiety`,
  ROUND(STDDEV(`Final_Score`), 2) AS `Score Sigma`,
  ROUND(STDDEV(`Exam_Anxiety_Score`), 2) AS `Anxiety_Signma`,
  COUNT(*) AS `Student_Count`
FROM `JeopardyStudents`
GROUP BY 1;

--
-- Isolate untutored students within the borderline C/D group, calculate correlation coefficient within this group for Sleep and Exam Anxiety
--

WITH `UntutoredBorderline` AS (
  SELECT
    `Sleep_Hours`,
    `Final_Score`,
    `Exam_Anxiety_Score`
  FROM `noelle-project-05-2026.Project_Data.student_performance_data`
  WHERE `Previous_GPA` BETWEEN 1.9 AND 2.1
  AND `Tutoring_Sessions_Per_Week` = 0
)

SELECT
  ROUND(CORR(`Sleep_Hours`, `Exam_Anxiety_Score`), 2) AS `Sleep_Anxiety_Corr`,
  ROUND(AVG(`Sleep_Hours`), 2) AS `AVG_Sleep`,
  ROUND(AVG(`Final_Score`), 2) AS `AVG_Score`
  FROM `UntutoredBorderline`;

--
-- Isolate untutored students within the borderline C/D group, categorize students by amount of sleep they get, and compare to their Final Scores and Anxiety
--


 WITH `UntutoredBorderline` AS (
  SELECT
    `Sleep_Hours`,
    `Final_Score`,
    `Exam_Anxiety_Score`
  FROM `noelle-project-05-2026.Project_Data.student_performance_data`
  WHERE `Previous_GPA` BETWEEN 1.9 AND 2.1
  AND `Tutoring_Sessions_Per_Week` = 0
)

SELECT
  CASE
    WHEN `Sleep_Hours` >= 8 AND `Sleep_Hours` < 10 THEN 'Well Rested'
    WHEN `Sleep_Hours` >= 6 AND `Sleep_Hours` < 8 THEN 'Moderately Rested'
    ELSE 'Poorly Rested'
  END AS `Sleep_Status`,
  ROUND(AVG(`Final_Score`), 2) AS `AVG_Score`,
  ROUND(AVG(`Exam_Anxiety_Score`), 2) AS `AVG_Anxiety`,
  ROUND(STDDEV(`Final_Score`), 2) AS `Score Sigma`,
  ROUND(STDDEV(`Exam_Anxiety_Score`), 2) AS `Anxiety_Signma`,
  COUNT(*) AS `Student_Count`
FROM `UntutoredBorderline`
GROUP BY 1;
