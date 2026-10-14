# Retail Sales ETL Pipeline (Pentaho Data Integration + MySQL)

An ETL pipeline that loads over one million online-retail transactions from CSV into a MySQL staging layer, then cleans and validates them for analysis.

## Tools
- Pentaho Data Integration (Spoon) 9.4
- MySQL 8.0 and MySQL Workbench
- SQL

## Pipeline
```
online_retail_II.csv  -->  retail_staging.raw_sales  -->  retail_staging.clean_sales
      (source)              (raw text, as received)        (typed, cleaned, revenue added)
```

| Step | Transformation | What it does |
|---|---|---|
| 0 | `00_create_tables.ktr` | Drops and recreates the `raw_sales` staging table |
| 1 | `01_load_staging.ktr` | Reads the CSV, renames columns, loads rows as-is into `raw_sales` |
| 2 | `02_clean.ktr` | Cleans the data and loads `clean_sales` |

## Cleaning rules
- Remove cancelled invoices (invoice numbers starting with `C`)
- Remove rows with a missing customer ID
- Remove rows with quantity <= 0 or unit price <= 0
- Convert text columns to proper types (integer, decimal, datetime)
- Calculate `revenue = quantity * unit_price`
- Remove exact duplicate rows

## Validation
SQL checks in [`sql/validation_checks.sql`](sql/validation_checks.sql) confirm the clean table has no cancellations, no missing customers, no invalid quantities or prices, and correct revenue. A reconciliation query compares the expected clean row count with the Pentaho output.

| Metric | Result |
|---|---|
| Raw rows loaded | `[FILL IN]` |
| Clean rows | `[FILL IN]` |
| Cancelled invoices remaining | 0 |
| Missing customer IDs remaining | 0 |

## How to run
1. Install MySQL and Pentaho Data Integration; copy the MySQL Connector/J `.jar` into `data-integration/lib`.
2. Create the databases: run [`sql/create_databases.sql`](sql/create_databases.sql).
3. Download the dataset (see [`data/README.md`](data/README.md)) and save it as CSV.
4. In Spoon, create a MySQL connection named `retail_staging`.
5. Run `00_create_tables.ktr`, then `01_load_staging.ktr`, then `02_clean.ktr`.
6. Run `sql/validation_checks.sql` in MySQL Workbench.

## Lessons learned
- Pentaho's *Select values* step fails if the field name does not match the incoming column; rename via **Rename to**, not **Fieldname**.
- Auto-generated staging columns can be too short ("Data too long for column"); defining the table explicitly with roomy VARCHAR lengths avoids truncation.
- Table creation should run in a separate transformation, because steps inside one transformation start in parallel.
- Staging holds raw text; type conversion belongs in the cleaning layer.

## Next steps
- Build a star schema (`dim_customer`, `dim_product`, `dim_date`, `fact_sales`)
- Chain the transformations in a Pentaho job with logging and scheduling
- Add a dashboard (Power BI or Metabase)

## Data credit
Online Retail II dataset, UCI Machine Learning Repository, CC BY 4.0.
