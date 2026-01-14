
# Module Recommendation Engine for Municipality Customers

## Overview
This project generates **module-level recommendations** for municipality customers using **Snowflake analytics** and **Azure Foundation Models (AFM)**.  
It helps identify **under-adopted modules** and suggests **next best modules** for upsell opportunities.

---

## Data Model
- **Customer Gold Table:** deduplicated customer attributes (customer_id, account_name, city, state, account_type)  
- **Customer Products Table:** module-grain purchase records (customer_id, module, module_fee, ship_date, invoice_date)  

---

## Solution
- Aggregates module adoption metrics per customer  
- Generates **customer embeddings** via AFM  
- Performs similarity search to find modules purchased by **similar customers** but not yet purchased by the target  
- Optionally, uses AFM to generate **business-friendly explanations**  

---

## Repository Structure
- `sql/setup/` – Snowflake warehouse, database, and schema setup  
- `sql/analytics/` – Customer metrics, segmentation, and module adoption calculations  
- `sql/ai/` – Embeddings, similarity search, and AI-generated explanations  
- `data/sample_inputs/` – Sample CSV datasets  
- `docs/` – Project scope and interview talking points  

---

## Scope & Assumptions
- Customer and product data is already deduplicated  
- Focus is on **analytics + AI-driven recommendations**  
- Upstream ingestion (Bronze/Silver) is out of scope  

---

## Tech Stack
- Snowflake SQL (analytics & modeling)  
- Snowflake External Functions / AFM (Azure OpenAI embeddings & LLM)  
- Snowflake Tasks (materialized refresh)  
- GitHub  

---

## How to Run
1. Load `customer_gold.csv` and `customer_products.csv` into Snowflake tables  
2. Create metrics and segmentation views  
3. Generate embeddings using AFM  
4. Run similarity search to create `customer_module_recommendations` table  
5. Optional: generate business explanations using AFM  
