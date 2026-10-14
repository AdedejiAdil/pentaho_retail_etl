USE retail_staging;

-- Staging: raw text exactly as received
DROP TABLE IF EXISTS raw_sales;
CREATE TABLE raw_sales (
  invoice_no   VARCHAR(100),
  stock_code   VARCHAR(100),
  description  VARCHAR(500),
  quantity     VARCHAR(100),
  invoice_date VARCHAR(100),
  unit_price   VARCHAR(100),
  customer_id  VARCHAR(100),
  country      VARCHAR(100)
);

-- Clean: typed columns plus calculated revenue
DROP TABLE IF EXISTS clean_sales;
CREATE TABLE clean_sales (
  invoice_no   VARCHAR(20),
  stock_code   VARCHAR(30),
  description  VARCHAR(255),
  quantity     INT,
  invoice_date DATETIME,
  unit_price   DECIMAL(10,2),
  customer_id  VARCHAR(20),
  country      VARCHAR(60),
  revenue      DECIMAL(12,2)
);
