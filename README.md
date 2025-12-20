# ESG & Financial Performance Analysis: Asia vs North America (2024-2025)
## Quick Overview:</br>
This project compares ESG(Environmental, Social, Governance) scores, carbon emissions, market capitalization, and financial metrics across Asia and North America for 2024-2025 using SQL queries on a comprehensive dataset.

### Goals: </br>
   + Uncover sustainability trends.</br> 
   + Identify top/bottom performers. </br>
   + Industries with high carbon emissions. </br>
   +  Provide actionable insights for investors/regulators on balancing profitability with environmental responsibility.

 ### Key Takeaway:</br>
 While North American industries lead in overall ESG scores, certain Asian sectors show rapid improvement—but at the cost of higher carbon emissions in high-revenue industries.

### Key Insights:</br>
   + Highest Market capitalization: The technology industry dominated with <mark>$2.80</mark> and <mark>$3.01</mark> trillion total in Asia & North America, respectively, for 2024 & 2025.</br>
   + Highest Revenue Generator: The technology industry dominated with <mark>$276.87</mark> and <mark>$355.93</mark> billion for Asia and North America, respectively, for 2024 & 2025.</br>
   + Highest ESG overall score: Consumer Goods in Asia scored <mark>89.8/100</mark> in 2025 (up 1.12% from 2024) & Utilities in North America scored <mark>91.4/100</mark> in 2025 (down 2.14% from 2024)</br>
   + Highest Carbon-Emitting Industry: </br>
      - The energy industry emitted <mark>52.16</mark> megatons (23.5% of the total 221.11 megatons), primarily in Asia during 2025. </br>

      - The energy industry emitted <mark>100.96</mark> megatons (30.18% of the total 334.49 megatons), primarily in North America during 2025.</br>
   + Carbon Emissions increased<mark> 5.63%</mark> and <mark>13.2%</mark> in the Asia and North America regions, respectively
   
    
### Data & Modeling </br>
   + Dataset: company_esg_financial_dataset (11,000 rows) covering ESG scores (0-100), carbon emissions (tons), market cap, revenue, etc.</br>
   + Tools: Excel, MySQL aggregations (SUM, AVG, MAX), window functions (RANK, PARTITION BY), CTEs, joins for ranking industries from highest to lowest.</br>
   + Approach: Filtered for Asia/North America & 2024-2025; grouped by Region/Industry/Year; calculated percentages, rankings, and changes.</br>

 ### Sample SQL Highlights:   -- Growth rate YOY for year 2024 & 2025</br>
  
                              SELECT
                                    Region,
                                    Industry,
                                    Year,
                                    GrowthRate_YOY_revenue_growth_rate
                                FROM company_esg_financial_dataset
                                WHERE Year IN (2024, 2025) AND Region IN ('Asia', 'North America') 
                                ORDER BY GrowthRate_YOY_revenue_growth_rate DESC
                                ;


 Recommendations:</br>
    + Investors: Prioritize [high ESG/low emission industries] for sustainable portfolios.</br>
    + Policymakers: Target subsidies/regulations on [high-emission/high-revenue sectors].</br>
    + Companies: Focus on [specific pillar, e.g., Governance] for the quickest ESG gains.</br>

 Limitations & Next Steps:</br>
   + Data limited to 2024-2025; longer trends needed.</br>
   + No causality analysis (e.g., does high ESG drive revenue?).</br>
   + Future: Integrate Python/Tableau for interactive dashboards or ML predictions.</br>

 How to Run:
    + Clone repo: git clone [url]
    + Import dataset (Excel/CSV provided).
    + Run queries in your SQL environment.

 About Me
                  Data Analyst passionate about sustainable finance. Connect on LinkedIn | View more projects [here].
                  Thanks for visiting! ⭐ Star if useful!
                                          






<img width="542" height="238" alt="Screenshot 2025-12-19 005555" src="https://github.com/user-attachments/assets/3ae39952-641a-485e-8828-034b8592db48" />
