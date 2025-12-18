Overview:
This project analyzes user behavior and product feature usage for an e-commerce platform. Using SQL (BigQuery) and Python, it identifies patterns in user engagement, conversion funnels, cohorts, and key drivers of purchase. Insights are actionable for improving retention, conversions, and overall product strategy.

Dataset:
The dataset is a sample of 100k+ online shopper sessions from a multi-category e-commerce store.
Columns include: Month, VisitorType, ProductRelated, ProductRelated_Duration, PageValues, Revenue, Weekend, engagement_segment, etc.
Source: Kaggle (modified/sample version suitable for analysis)

Tools & Technologies:

SQL / BigQuery – data extraction, DAU/WAU/MAU, funnels, cohort analysis, engagement segmentation

Python (Pandas, Matplotlib, Seaborn) – EDA, correlation analysis, visualization

Optional: Power BI / Tableau for dashboards

Analysis Performed:

SQL Analysis

Computed DAU/WAU/MAU and sessions per month

Compared New vs Returning Users

Built conversion funnels (Total Sessions → Product Activity → Purchases)

Conducted cohort analysis by month and user type

Segmented users into High / Medium / Low engagement based on ProductRelated_Duration and PageValues

Analyzed Weekend vs Weekday conversion

Python EDA

Visualized sessions per month, user types, funnel, and engagement segments

Calculated correlations of numeric features with purchase to identify top drivers

Visualized Weekend vs Weekday conversion

Key Insights:

Returning users convert 2× higher than new visitors

High engagement sessions drive 3–4× more purchases than low engagement

Weekend sessions have 1.5× higher conversion than weekdays

Top drivers of purchase: PageValues, ProductRelated_Duration (positive), BounceRates (negative)
