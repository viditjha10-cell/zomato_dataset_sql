# zomato_dataset_sql
SQL assignment queries and dataset analysis for Zomato restaurant data

## Overview
This project presents an end-to-end exploratory and business performance analysis of a Zomato restaurant dataset using standard SQL. The goal is to uncover key market drivers, evaluate customer satisfaction trends, understand pricing tiers, and identify top-performing culinary hubs to help stakeholders make data-driven decisions.

---

## Dataset Schema (`zomato_restaurants`)
The analysis is performed on a structured relational table containing the following fields:

* `restaurant_id` (INT, Primary Key): Unique identifier for each restaurant.
* `restaurant_name` (VARCHAR): Name of the establishment.
* `city` (VARCHAR): City where the restaurant is located.
* `cuisines` (VARCHAR): Types of food served.
* `average_cost_for_two` (INT): Average estimated cost for two people.
* `currency` (VARCHAR): Local currency code.
* `has_table_booking` (VARCHAR): Availability of table booking (`Yes` / `No`).
* `has_online_delivery` (VARCHAR): Availability of online delivery (`Yes` / `No`).
* `aggregate_rating` (DECIMAL): Average customer rating (0.0 to 5.0).
* `rating_text` (VARCHAR): Categorical rating label (e.g., Excellent, Good, Average).
* `votes` (INT): Total number of customer votes/reviews received.

---

## Project Structure & SQL Walkthrough

### Phase 1: Exploratory Data Analysis (EDA)
Explores baseline platform statistics, dominant cuisine trends, and overall rating distributions.
* **Top Cuisines:** Identifies the most prevalent food types to understand platform supply and customer demand.
* **Rating Distribution:** Evaluates the percentage breakdown of overall customer sentiment tiers (`rating_text`).

### Phase 2: Business & Performance Analysis
Answers core operational and geographic questions:
* **Top Cities by Rating:** Filters out smaller sample sizes using `HAVING COUNT(*) > 10` to highlight top culinary markets reliably.
* **Service Impact:** Compares average ratings and customer engagement (votes) between restaurants with and without online delivery integration.
* **Pricing Segmentation:** Extracts high-end establishments and evaluates market cost bounds.

### Phase 3: Simplified Aggregations & Grouping
Leverages streamlined SQL queries for quick insights:
* Finding peak restaurant ratings per city using `MAX()`.
* Grouping restaurant density and average scores directly by cost brackets.

---

## Key Business Insights

1. **Online Delivery Drives Engagement:** Restaurants offering online delivery systematically capture a significantly higher volume of votes, indicating that digital integration broadens consumer reach and active feedback loops.
2. **Cost vs. Rating Correlation:** Mid-range and fine-dining establishments typically achieve higher average aggregate ratings compared to budget alternatives, largely driven by service quality and ambiance consistency.
3. **Geographic Variance Requires Filtering:** Raw averages can be misleading due to low-density suburbs with single high-rating outliers. Enforcing a minimum sample threshold ($n > 10$) exposes true high-performing metropolitan food scenes.
4. **Cuisine Concentration:** A handful of staple cuisines dominate the majority of listings, suggesting high market saturation where differentiation or niche positioning is crucial for new entrants.

---

## How to Run the Queries
1. Create your database environment (compatible with PostgreSQL, MySQL, or SQL Server).
2. Run the schema creation script from Phase 1 to set up your `zomato_restaurants` table.
3. Import your Zomato CSV data into the table.
4. Execute the analytical queries sequentially to reproduce insights and dashboards.
