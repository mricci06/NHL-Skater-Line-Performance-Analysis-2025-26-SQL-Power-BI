# NHL Skater & Line Performance Analysis (2025–26)
[View the live Power BI dashboard](https://app.powerbi.com/view?r=eyJrIjoiYWMwYzYyNzYtMWJjOS00Yzc2LWFmMjctZjYzY2IwNGI0ZjFmIiwidCI6ImNkMzE5NjcxLTUyZTctNGE2OC1hZmE5LWZjZjhmODlmMDllYSIsImMiOjN9)

Overview

This project identifies which players, and pairing/lines overperformed or underperformed during the
2025-26 NHL season. For the individual players, their expected high danger goal total is compared to the
league average high danger goal total to identify if their actual goal total is not representative of their
expected output. For the lines/pairing, their expected goal percentage when on the ice is compared to their
actual goal percentage. The goal is to identify regression candidates, which are players or lines/pairing
who are outscoring their expected stats, and bounce back candidates, players who are underscoring those
expected stats.

Business Question

Which skaters and lines/pairing are producing results that their expected goal metrics don’t support?

Data Source

Data was taken from MoneyPuck, for the 2025-26 season at the skaters and lines level.
https://moneypuck.com/data.htm

Methodology

Skater analysis
1. Calculated each player’s difference between expected goal and actual goal total
2. Calculated each player’s expected high danger goals per 60 minutes played, and calculated the
league average expected high danger goals per 60 minutes
3. Tiered players into three categories using a threshold of ±5.7, equivalent to roughly 1.5 standard
deviations from the mean expected goal differential:
Regression Candidate: xG diff > 5.7
Bounce Back Candidate: xG diff < -5.7
Sustainable: within the expected range

Line Analysis

1. Calculated each line/pairings actual goal share (goals for/total goals)
2. Calculated the difference between their actual goal share and their expected goal share
3. Tiered lines based on the gap between the two, using a threshold of ±0.10, equivalent to roughly
1.5 standard deviations from the mean goal share difference:
Overachieving Line: outscoring their expected share by 10%+
Underachieving Line: underscoring their expected share by 10%+
Performing as Expected: within the expected range

Key Findings

Jake DeBrusk posted the largest negative difference between their actual goal output and their expected
goal output, suggesting that if he were to keep up his play into the 2026-27 year, he would likely have a
higher goal output.

The Holloway-Thomas-Snuggerud is significantly outperforming its expected goal share, (G% of 80%
compared to xG% of 58%), likely driven by their strong finishing in limited minutes together (260
minutes played together).

Tools Used

SQL
- CTEs
- Window functions
- Conditional tiering logic
Power BI
- Interactive dashboard
- Tables
- KPI cards

