# speak-up-market-analysis
Market feasibility study for a multilingual public speaking school in Nitra, Slovakia: Google Trends analysis, survey research, and pricing recommendation.

# What this project does
1) Analyzes 5-year Google Trends demand data for public speaking / communication courses using R (ggplot2, patchwork)
2) Collects and analyzes original survey data on demand, segments, and price sensitivity
3) Benchmarks 6 competitors (format, pricing, strengths/weaknesses)
4) Estimates TAM/SAM/SOM and recommends a course pricing strategy

# Key findings
1) Rising, seasonal demand (annual peaks in July) across all three tracked search queries
2) Average self-assessed public speaking confidence: 3.2/5; intention to enroll within 12 months: 4.0/5
3) Recommended pricing: €40–50 per group course (€6–10/hour), with no direct low-cost competitor in this segment
4) Estimated year-1 reachable market (SOM): 150–250 learners, ~€8,000–12,000 revenue

## Structure
1) `data/` — raw Google Trends exports and survey results (.csv)
2) `scripts/public.R` — R script for data cleaning, analysis, and visualization
3) `output/` — generated charts (.png)
4) `report/` — full write-up (Audit.pdf)

# Example output
![Combined search interest trends](output/Overall.png)
