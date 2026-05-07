# NoelleAxalan
Noelle Axalan data analytics project portfolio

Student Stress and Academic Performance Analysis
## Background and Overview
This project investigates the relationship between psychological stressors and academic outcomes among university students. Using SQL to merge and analyze disparate datasets, the study aims to identify at-risk student populations and evaluate the effectiveness of institutional support systems. 

## Data Structure Overview
The analysis was performed in Google BigQuery using a relational schema consisting of two primary datasets:

student_performance_finalscore: Contains outcome-based data including final exam scores and GPA.
<img width="396" height="832" alt="student_performance (1)" src="https://github.com/user-attachments/assets/06e1e167-f0b9-461a-b60b-4c2ba7b9e12c" />

student_performance: 
<img width="324" height="828" alt="student_performance" src="https://github.com/user-attachments/assets/8eb0fa05-0fab-4032-aae8-e052ef25fbff" />

Key Technical Operation: Tables were joined via a `Student_ID` key. 

## Executive Summary
The data reveals that academic success is a multi-variable equation where both psychological health and support systems are as predictive as students' natural academic aptitude. This project identifies a clear "Anxiety-Performance Inverse" and highlights specific points of intervention for institutional success.

  - A moderate negative correlation ($r = -0.49$) exists between exam anxiety and final scores.

  - Anxiety levels account for 24% of the variance in final grades ($r^2 = 0.24$), suggesting that nearly one-quarter of a student's performance is dictated by their stress state.

  - Students who received formal support achieved an average final score of 78.8, representing a 38.5% increase over the non-tutored group average of 56.9.

## Insights Deep Dive
The C/D Threshold Spike: Data reveals a significant non-linear spike in stress as students approach the passing threshold. Students in the "Aspiring D" category (those working to move from failing to a 1.7 GPA) reported anxiety levels 31.9% higher than those in the "Safe" category.

  - Insight: The psychological pressure is highest at the point of "Academic Survival." Interestingly, anxiety levels actually     decrease once students move into "At Risk" or "Aspiring B" tiers, suggesting that once a basic level of security is reached, the intense "survival stress" begins to subside. 
  - High-achieving students ("At Risk A") are consistently calm (Anxiety sigma of 1.96), while students at the "C" threshold are experiencing wildly different emotional states (Anxiety Sigma of 1.55). This suggests that while some "C" students are coping well, others are in a state of high-stress crisis, driving that average up and making the group much more volatile.

Tutoring as a Stabilizer: The data indicates that institutional intervention (tutoring) provides a dual benefit: it raises the academic "ceiling" while simultaneously stabilizing the anxiety levels of students.

  - Performance Lift: Students who utilized tutoring achieved an average final score of 78.8, a 38.5% increase over the non-tutored average of 56.9.

  - Reduced Volatility: The Score Sigma for tutored students was 10.48, compared to 14.77 for those without support.

  - Conclusion: Tutoring acts as a "Predictability Engine." It results in a 29% reduction in performance variance, meaning tutored students not only score higher but are significantly less likely to experience "outlier" failing grades.

Lifestyle Safeguards: While sleep is generally a stabilizer, the data reveals a non-linear relationship where the Poorly Rested group (less than six hours of sleep) achieved the highest average scores (66.4). This suggests an effect where a specific subset of students prioritizes short-term academic output over rest and recovery.

 - The Performance Peak: The Poorly Rested group outperformed the Well Rested group by 8.8% and the Moderately Rested group by 31.6%.

  - The Anxiety Trade-off: Despite the lack of sleep, the Poorly Rested group maintained lower anxiety (5.4) than both other cohorts. This suggests these students may possess higher levels of "academic self-efficacy" and are willing to sacrifice sleep because they have a clear, focused plan for their study "crunch."
    
  - The Moderately Rested Crisis: The most significant finding remains the Moderately Rested cohort. With the highest anxiety (7.6) and lowest scores (50.4), this group likely represents students who are struggling to find a balance—getting enough sleep to feel the "weight" of their stress, but not enough to achieve cognitive clarity.
    
  - Conclusion: For a small number of students, extreme sleep deprivation is a deliberate (if unsustainable) tactical choice for performance. However, for the majority, falling into "Moderate" sleep deprivation ($7+$ students) results in the worst possible outcome: high anxiety paired with low retention.

## Recommendations
  - Allocate immediate counseling and coaching resources to students in the 1.5-1.7 GPA range (Aspiring D/At Risk C). Data indicates this cohort faces a 31.9% spike in anxiety compared to "Safe" students, suggesting that the psychological pressure of the passing threshold is a primary barrier to their academic performance.

  - Expand tutoring access. With tutored students showing a 38.5% higher average score and a 29% reduction in grade volatility, tutoring should be positioned as both an academic elevator and an emotional stabilizer that provides a consistent performance "floor".

  - Implement early-warning systems to identify "At Risk" behaviors before students resort to the sleep depravation and cramming. While unsustainable sleep deprivation (see in the "Poorly Rested" group) yields high scores in the short term, the goal is to shift the high-anxiety "Moderately Rested" group toward healthy "Well Rested" habits, which correlates with a 21% score lift and 22% lower anxiety.
