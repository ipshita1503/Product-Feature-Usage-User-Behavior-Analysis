SELECT *
FROM `funnel-and-cohort-analysis.product_data.online_shoppers`
LIMIT 5;

SELECT
  Month,
  COUNT(*) AS total_sessions
FROM `funnel-and-cohort-analysis.product_data.online_shoppers`
GROUP BY Month
ORDER BY
  CASE Month
    WHEN 'Jan' THEN 1 WHEN 'Feb' THEN 2 WHEN 'Mar' THEN 3 WHEN 'Apr' THEN 4
    WHEN 'May' THEN 5 WHEN 'June' THEN 6 WHEN 'Jul' THEN 7 WHEN 'Aug' THEN 8
    WHEN 'Sep' THEN 9 WHEN 'Oct' THEN 10 WHEN 'Nov' THEN 11 WHEN 'Dec' THEN 12
    ELSE 13
  END;

  SELECT
  Month,
  VisitorType,
  COUNT(*) AS total_sessions
FROM `funnel-and-cohort-analysis.product_data.online_shoppers`
GROUP BY Month, VisitorType
ORDER BY
  CASE Month
    WHEN 'Jan' THEN 1 WHEN 'Feb' THEN 2 WHEN 'Mar' THEN 3 WHEN 'Apr' THEN 4
    WHEN 'May' THEN 5 WHEN 'June' THEN 6 WHEN 'Jul' THEN 7 WHEN 'Aug' THEN 8
    WHEN 'Sep' THEN 9 WHEN 'Oct' THEN 10 WHEN 'Nov' THEN 11 WHEN 'Dec' THEN 12
    ELSE 13
  END, VisitorType;

SELECT
  COUNT(*) AS total_sessions,
  SUM(CASE WHEN ProductRelated > 0 THEN 1 ELSE 0 END) AS sessions_with_product_activity,
  SUM(CASE WHEN Revenue = TRUE THEN 1 ELSE 0 END) AS purchases,
  ROUND(100.0 * SUM(CASE WHEN ProductRelated > 0 THEN 1 ELSE 0 END)/COUNT(*),2) AS pct_sessions_with_product_activity,
  ROUND(100.0 * SUM(CASE WHEN Revenue = TRUE THEN 1 ELSE 0 END)/COUNT(*),2) AS overall_conversion_rate,
  ROUND(100.0 * SUM(CASE WHEN Revenue = TRUE THEN 1 ELSE 0 END)/NULLIF(SUM(CASE WHEN ProductRelated > 0 THEN 1 ELSE 0 END),0),2) AS conversion_from_product_sessions
FROM `funnel-and-cohort-analysis.product_data.online_shoppers`;


SELECT
  Month,
  VisitorType,
  COUNT(*) AS total_sessions,
  SUM(CASE WHEN Revenue = TRUE THEN 1 ELSE 0 END) AS purchases,
  ROUND(100.0 * SUM(CASE WHEN Revenue = TRUE THEN 1 ELSE 0 END)/COUNT(*),2) AS conversion_rate_pct
FROM `funnel-and-cohort-analysis.product_data.online_shoppers`
GROUP BY Month, VisitorType
ORDER BY
  CASE Month
    WHEN 'Jan' THEN 1 WHEN 'Feb' THEN 2 WHEN 'Mar' THEN 3 WHEN 'Apr' THEN 4
    WHEN 'May' THEN 5 WHEN 'June' THEN 6 WHEN 'Jul' THEN 7 WHEN 'Aug' THEN 8
    WHEN 'Sep' THEN 9 WHEN 'Oct' THEN 10 WHEN 'Nov' THEN 11 WHEN 'Dec' THEN 12
    ELSE 13
  END, VisitorType;

SELECT
  CASE 
    WHEN ProductRelated_Duration > 300 AND PageValues > 5 THEN 'High Engagement'
    WHEN ProductRelated_Duration > 300 OR PageValues > 5 THEN 'Medium Engagement'
    ELSE 'Low Engagement'
  END AS engagement_segment,
  COUNT(*) AS sessions,
  SUM(CASE WHEN Revenue = TRUE THEN 1 ELSE 0 END) AS purchases,
  ROUND(100.0 * SUM(CASE WHEN Revenue = TRUE THEN 1 ELSE 0 END)/COUNT(*),2) AS conversion_pct
FROM `funnel-and-cohort-analysis.product_data.online_shoppers`
GROUP BY engagement_segment
ORDER BY conversion_pct DESC;

SELECT
  CAST(Weekend AS INT64) AS weekend_flag,
  COUNT(*) AS total_sessions,
  SUM(CAST(Revenue AS INT64)) AS purchases,
  ROUND(100.0 * SUM(CAST(Revenue AS INT64))/COUNT(*),2) AS conversion_pct
FROM `funnel-and-cohort-analysis.product_data.online_shoppers`
GROUP BY weekend_flag
ORDER BY weekend_flag;

