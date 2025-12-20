# ESG & Financial Performance Analysis: Asia vs North America (2024-2025)
## Executive Summary
- North America leads in ESG scores overall, but faces a sharper rise in carbon emissions (+13.2% vs Asia’s +5.63%).
- Asia shows rapid ESG improvement, particularly in Consumer Goods, though high-revenue industries still drive emissions upward.
- Technology dominates both regions in market capitalization and revenue, underscoring its dual role as a growth driver and sustainability challenge.
- Energy remains the largest carbon emitter, accounting for ~23.5% of Asia’s and ~30.2% of North America’s total emissions.
- Actionable insights highlight opportunities for investors, regulators, and companies to balance profitability with environmental responsibility

### Goals: </br>
   + Uncover sustainability trends.</br> 
   + Identify top/bottom performers. </br>
   + Industries with high carbon emissions. </br>
   +  Provide actionable insights for investors/regulators on balancing profitability with environmental responsibility.

 ### Key Takeaway:</br>
 While North American industries lead in overall ESG scores, certain Asian sectors show rapid improvement—but at the cost of higher carbon emissions in high-revenue industries.

### Key Insights:</br>
| Metric | Asia (2025) | North America (2025) | Notes / Trend |
| ------ | ----------- | -------------------- | ------------- |
| **Highest Market Capitalization** | Technology: **$2.80 T** (2024–2025) | Technology: **$3.01 T** (2024–2025) | Tech dominates both regions |
| **Highest Revenue Generator** | Technology: **$276.87 B** | Technology: **$355.93 B** | Consistent industry leader |
| **Highest ESG Score** | Consumer Goods: **89.8/100** (+1.12%) | Utilities: **91.4/100** (−2.14%) | Asia improving, North America declining |
| **Highest Carbon Emissions** | Energy: **52.16 Mt** (23.5% of 221.11 Mt) | Energy: **100.96 Mt** (30.18% of 334.49 Mt) | Energy sector is the largest emitter |
| **Carbon Emissions Growth** | **+5.63%** | **+13.2%** | Both regions show rising emissions |


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



 ### Recommendations: 
   + Investors: Prioritize high ESG and low-emission industries for sustainable portfolios.
     
   + Policymakers: Target subsidies/regulations on high-emission/high-revenue sectors.
   
   + Companies: Focus on specific pillar, e.g., Governance for the quickest ESG gains.

 ### Limitations & Next Steps: 
   + Data limited to 2024-2025; longer trends needed.
   
   + No causality analysis (e.g., does high ESG drive revenue?).

   + Future: Integrate Python/Tableau for interactive dashboards or ML predictions.</br>

 ### How to Run: 
   + Clone repo: git clone [url]
   
   + Import dataset (Excel/CSV provided).
  
   + Run queries in your SQL environment.

 About Me
                Data Analyst passionate about sustainable finance. Connect on LinkedIn | View more projects [here].
                  Thanks for visiting! 
                                          






<img width="542" height="238" alt="Screenshot 2025-12-19 005555" src="https://github.com/user-attachments/assets/3ae39952-641a-485e-8828-034b8592db48" />
