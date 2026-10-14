-- Run as root in MySQL Workbench
CREATE DATABASE IF NOT EXISTS retail_staging;
CREATE DATABASE IF NOT EXISTS retail_dw;

-- Replace the user and password with your own
CREATE USER IF NOT EXISTS 'your_user'@'localhost' IDENTIFIED BY 'CHANGE_ME';
GRANT ALL PRIVILEGES ON retail_staging.* TO 'your_user'@'localhost';
GRANT ALL PRIVILEGES ON retail_dw.* TO 'your_user'@'localhost';
FLUSH PRIVILEGES;
