# Noelle Axalan
Noelle Axalan data analytics project portfolio

## Project One - Analysis of Student Success Data

## Background and Overview
This project investigates the relationship between psychological stressors and academic outcomes among university students. Using SQL to merge and analyze disparate datasets, the study aims to identify at-risk student populations and evaluate the effectiveness of institutional support systems. 

## Data Structure Overview
The analysis was performed in Google BigQuery using a relational schema consisting of two primary datasets:

student_performance_finalscore: Contains outcome-based data including final exam scores and GPA.
<img width="398" height="822" alt="student_performance (4)" src="https://github.com/user-attachments/assets/0fe2b4af-4fd2-4fb0-a08b-2cc26932f6a6" />

student_performance: 
<img width="400" height="825" alt="student_performance (5)" src="https://github.com/user-attachments/assets/6947a4cb-3875-4739-b020-b8670aa67f43" />

Key Technical Operation: Tables were joined via a `Student_ID` key. 

## Executive Summary
The data reveals that academic success is a multi-variable equation where both psychological health and support systems are as predictive as students' natural academic aptitude. This project identifies 'Threshold Anxiety' at the C/D GPA border as a primary predictor of academic failure and utilized CTE-driven intervention analysis to evaluate institutional safeguards to propose targeted, data-driven support strategies.

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



## PROJECT TWO: DML and DDL SYNTAX PRACTICE - BUILDING A RELATIONAL DATABASE

## Project Overview
This project serves as a comprehensive technical demonstration of Data Definition Language (DDL) and Data Manipulation Language (DML) within a Google BigQuery environment. I architected a relational database from scratch, simulating an e-commerce ecosystem with seven interconnected tables to practice schema enforcement, data integrity, and complex table relationships.

## Technical Skills Demonstrated
  - Schema Design: Creating a normalized relational structure with Primary and Foreign Key constraints.

  - Data Definition (DDL): Utilizing CREATE, ALTER, and DROP to manage table structures and data types.

  - Data Manipulation (DML): Executing INSERT, UPDATE, and DELETE operations to maintain a dynamic dataset.

  - Database Constraints: Implementing NOT ENFORCED keys (standard for BigQuery) to document logical relationships between entities.

## Database Schema
The database consists of the following seven entities, designed to simulate a real-world retail environment:
<img width="754" height="390" alt="student_performance (2)" src="https://github.com/user-attachments/assets/ad6d05e9-7baa-4a99-97b4-e969b0a7f465" />

## Key Project Highlights
Structural Evolution: Rather than static creation, I practiced evolving the schema as business needs change
  - Dynamic Column Addition: Used ALTER TABLE to add quantity to the OrderItems table and payment_method to the Payments table after initial creation.
  - Data Integrity: Implemented PRIMARY KEY and FOREIGN KEY references to map the logical flow from Users $\rightarrow$ Orders $\rightarrow$ OrderItems.
Precise Data Maintenance: I performed targeted updates to simulate real-world data maintenance tasks:
  - Customer Updates: Updated user contact information (e.g., email corrections) using specific WHERE clause filtering.
  - Price Management: Modified retail pricing for specific inventory items (UPDATE) to reflect market changes.
  - Record Sanitization: Utilized DELETE to remove erroneous transaction entries while maintaining referential integrity.
  - 
## Project Conclusion
This practice project established the technical rigor required to manage large-scale datasets. By manually constructing these relationships and manipulating the data within them, I developed a deep understanding of how backend data structures support frontend business analytics and reporting.

