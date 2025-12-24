-- Dataset for the project

SELECT *
FROM company_esg_financial_dataset
;


-- Focus region and year range for the project

SELECT *
FROM company_esg_financial_dataset
WHERE
	Region IN ('Asia', 'North America')
	AND Year IN (2024, 2025)
ORDER BY 5 
;


-- Distribution of total Market Capital(in tillion USD) by Industries in Asia and North America region 2024-2025

    WITH Asia_MarketCap AS 
(
    SELECT
        Industry,
        ROUND(SUM(MarketCap_in_millionsUSD) / 1000000, 2) AS MarketCap_Asia_trillions
    FROM company_esg_financial_dataset
    WHERE Region = 'Asia'
      AND Year IN (2024, 2025)
    GROUP BY Industry
),
NorthAmerica_MarketCap AS 
(
    SELECT
        Industry,
        ROUND(SUM(MarketCap_in_millionsUSD) / 1000000, 2) AS MarketCap_NorthAmerica_trillions
    FROM company_esg_financial_dataset
    WHERE Region = 'North America'
      AND Year IN (2024, 2025)
    GROUP BY Industry
)
SELECT
    COALESCE(a.Industry, na.Industry) AS Industry,
    a.MarketCap_Asia_trillions,
    na.MarketCap_NorthAmerica_trillions
FROM Asia_MarketCap a
JOIN NorthAmerica_MarketCap na
    ON a.Industry = na.Industry
ORDER BY COALESCE(a.MarketCap_Asia_trillions, na.MarketCap_NorthAmerica_trillions) DESC
;


-- Comparision of sum of Annual Revenue and Market Capital between Asia and North America from 2015 to 2025

SELECT 
	Region, 
	Year, 
    ROUND(SUM(Annual_Revenue_in_millionsUSD)/1000, 2) AS Annual_Revenue_in_billionsUSD,
	ROUND(SUM(MarketCap_in_millionsUSD)/1000000, 2) AS MarketCap_in_trillionsUSD
FROM company_esg_financial_dataset
WHERE Region IN ('Asia', 'North America')
	  AND Year IN (2024, 2025)
 GROUP BY Region, Year
 ;
  
  
  -- Growth rate YOY for year 2024 & 2025
  
  SELECT
	Region,
    Industry,
    Year,
    GrowthRate_YOY_revenue_growth_rate
FROM company_esg_financial_dataset
WHERE Year IN (2024, 2025) AND Region IN ('Asia', 'North America') 
ORDER BY GrowthRate_YOY_revenue_growth_rate DESC
;
 
 
 -- Profit Margin by industry for year 2024 & 2025
  
  SELECT
	Region,
    Industry,
    Year,
    ProfitMargin
FROM company_esg_financial_dataset
WHERE Year IN (2024, 2025) 
	AND Region IN ('Asia', 'North America') 
ORDER BY ProfitMargin DESC;
 
 
-- Industries with highest Carbon Emission in Asia and North America region for year 2024 & 2025 (1 megaton = 1*10^6 tons)
 
 SELECT
    Region,
    Year,
    Industry,
    ROUND(MAX(CarbonEmissions_in_tons/1000000), 2) AS Highest_CarbonEmissions_in_megatons
FROM company_esg_financial_dataset
WHERE Region IN ('Asia', 'North America')
	AND Year IN (2024, 2025)
GROUP BY Region, Industry, Year
ORDER BY Region, Highest_CarbonEmissions_in_megatons DESC
;    


-- Total carbon emissions for year 2025 in Asia & North America region

WITH Carbon_emission_comparision AS
(
	SELECT 
		Region,
		Year,
		ROUND(SUM(CarbonEmissions_in_tons)/1000000, 2) AS CarbonEmissions_in_megatons
	FROM company_esg_financial_dataset
	WHERE Region = 'Asia' AND Year = 2025
),
Carbon_emission_comparision2 AS
(
	SELECT 
		Region,
		Year,
		ROUND(SUM(CarbonEmissions_in_tons)/1000000, 2) AS CarbonEmissions_in_megatons
	FROM company_esg_financial_dataset
	WHERE Region = 'North America' AND Year = 2025
)
SELECT *
FROM Carbon_emission_comparision
JOIN Carbon_emission_comparision2
	ON Carbon_emission_comparision.Year = Carbon_emission_comparision2.Year
;


-- Comparing Annual revenue by industry for 2024 & 2025

SELECT
	Region,
    Industry,
    Year,
	ROUND(SUM(Annual_Revenue_in_millionsUSD)/1000, 2) AS Annual_Revenue_in_billionsUSD
FROM company_esg_financial_dataset
WHERE Year IN (2024, 2025) 
	  AND Region IN ('Asia', 'North America') 
GROUP BY Industry, Region, Year
ORDER BY Annual_Revenue_in_billionsUSD DESC
;
 

-- Comparing Sustainablity score and other scores based on ESG parameters by Asia and North America in various industries in year 2024 & 2025
  
SELECT 
	Region, 
	Year, 
	Industry, 
	ROUND(AVG(ESG_Overall_sustainability_score_0_to_100), 2) AS Sustainability_score,
	ROUND(AVG(ESG_Environmental), 2) AS Environmental_average,
	ROUND(AVG(ESG_Social), 2) AS Social_average,
	ROUND(AVG(ESG_Governance), 2) AS Governance_average
FROM company_esg_financial_dataset
WHERE Region IN ('Asia', 'North America') 
AND Year IN ('2024', '2025')
 GROUP BY Region, Year, Industry
 ORDER BY Industry, Sustainability_score DESC
;
 

-- Comparing total resource usage and carbon emissions by Asia and North America in various industries in year 2024 & 2025
 
SELECT 
	Region,
    Year,
    Industry, 
	ROUND(SUM(CarbonEmissions_in_tons), 2) AS  Total_Carbon_Emissions_in_tons, 
	ROUND(SUM(WaterUsage_in_cubic_meters), 2) AS Total_WaterUsage_in_cubic_meters, 
	ROUND(SUM(EnergyConsumption_in_megawatthours_MWh), 2) AS Total_EnergyConsumption_in_megawatthours_MWh
FROM company_esg_financial_dataset
WHERE Region IN ('Asia', 'North America')
	AND Year IN (2024, 2025)
GROUP BY Region, Year, Industry
ORDER BY Industry, Region, Year
;


-- Percentage increase in Carbon Emissions (2024 to 2025) in Asia and North America region 

WITH Percentage_increase AS
(
	SELECT 
		'Asia' AS Region,
		ROUND(
			((SUM(CASE WHEN Year = 2025 THEN CarbonEmissions_in_tons ELSE 0 END) -
			  SUM(CASE WHEN Year = 2024 THEN CarbonEmissions_in_tons ELSE 0 END)) /
			  NULLIF(SUM(CASE WHEN Year = 2024 THEN CarbonEmissions_in_tons ELSE 0 END), 0)
			) * 100, 
		2) AS Percentage_Increase_2024_to_2025
	FROM company_esg_financial_dataset
	WHERE Year IN (2024, 2025) AND Region = 'Asia' 

	UNION ALL

	SELECT 
		'North America' AS Region,
		ROUND(
			((SUM(CASE WHEN Year = 2025 THEN CarbonEmissions_in_tons ELSE 0 END) -
			  SUM(CASE WHEN Year = 2024 THEN CarbonEmissions_in_tons ELSE 0 END)) /
			  NULLIF(SUM(CASE WHEN Year = 2024 THEN CarbonEmissions_in_tons ELSE 0 END), 0)
			) * 100, 
		2) AS Percentage_Increase_2024_to_2025
	FROM company_esg_financial_dataset
	WHERE Year IN (2024, 2025) AND Region = 'North America' 
)
SELECT *
FROM Percentage_increase 
;


-- Lowest ESG scoring industries by region and year

SELECT Region, Industry, Year,
	MIN(ESG_Overall_sustainability_score_0_to_100) AS Lowest_Overall_ESG_Score
FROM company_esg_financial_dataset
WHERE Region IN ('Asia', 'North America') AND Year IN (2024, 2025)
	GROUP BY Region, Industry, Year
	ORDER BY Lowest_Overall_ESG_Score 
; 


-- Ranking of the industries in the Asia and North America continents based on Sustainability scores from highest to lowest

 SELECT
    t1.Region,
    t1.Industry,
    t1.Rank_2024,
    t1.Sustainability_score_2024,
    t2.Rank_2025,
    t2.Sustainability_score_2025
FROM (
    SELECT
        Region,
        Industry,
        MAX(ESG_Overall_sustainability_score_0_to_100) AS Sustainability_score_2024,
        RANK() OVER (PARTITION BY Region ORDER BY MAX(ESG_Overall_sustainability_score_0_to_100) DESC) AS Rank_2024
    FROM company_esg_financial_dataset
    WHERE Year = 2024 AND Region IN ('Asia', 'North America')
    GROUP BY Region, Industry
) t1
LEFT JOIN (
    SELECT
        Region,
        Industry,
        MAX(ESG_Overall_sustainability_score_0_to_100) AS Sustainability_score_2025,
        RANK() OVER (PARTITION BY Region ORDER BY MAX(ESG_Overall_sustainability_score_0_to_100) DESC) AS Rank_2025
    FROM company_esg_financial_dataset
    WHERE Year = 2025 AND Region IN ('Asia', 'North America') 
    GROUP BY Region, Industry
) t2 
    ON t1.Region = t2.Region AND t1.Industry = t2.Industry
;