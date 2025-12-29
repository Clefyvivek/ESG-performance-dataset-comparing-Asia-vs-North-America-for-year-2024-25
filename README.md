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
| Metric | Asia (2025) | North America (2025) | Notes / Trend | Query Results |
| ------ | ----------- | -------------------- | ------------- | ------------- |
| **Highest Market Capitalization** | Technology: **$2.80 T** (2024–2025) | Technology: **$3.01 T** (2024–2025) | Tech dominates both regions | <img width="578" height="270" alt="image" src="https://github.com/user-attachments/assets/7e17eb71-e773-416f-93bd-daee716706bf" /> |
| **Highest Revenue Generator** | Technology: **$276.87B** | Technology: **$355.93B** | Consistent industry leader | <img width="483" height="323" alt="image" src="https://github.com/user-attachments/assets/c0aef347-82c0-43fb-8d96-8b9095b9ab74" /> |
| **Highest ESG Score** | Consumer Goods: **89.8/100** (+1.12%) | Utilities: **91.4/100** (−2.14%) | Asia improving, North America declining | <img width="784" height="419" alt="image" src="https://github.com/user-attachments/assets/e3dcef6c-debf-425a-acb2-47edf2619179" /> |
| **Highest Carbon Emissions** | Energy: **52.16 Mt** (23.5% of 221.11 Mt) | Energy: **100.96 Mt** (30.18% of 334.49 Mt) | Energy sector is the largest emitter | <img width="747" height="288" alt="image" src="https://github.com/user-attachments/assets/9fe93f25-675a-41c6-bb5d-388fe1c61c3b" /> |
| **Carbon Emissions Growth** | **+5.63%** | **+13.2%** | Both regions show rising emissions | <img width="659" height="313" alt="image" src="https://github.com/user-attachments/assets/bc677798-9626-42d2-88c9-03fafce5a0e7" /> |



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
- Clone the repository
- Import the database
- Explore the data
- That's it! You should now have a fully populated database ready for querying and further exploration. Feel free to modify the queries or extend the analysis. Contributions and suggestions are welcome!


### About Me:

Data Analyst, passionate about sustainable finance. Connect on [LinkedIn](https://www.linkedin.com/in/vivek-sharma-b74950241/)  | View more projects [here](https://github.com/Clefyvivek) Thanks for visiting!
