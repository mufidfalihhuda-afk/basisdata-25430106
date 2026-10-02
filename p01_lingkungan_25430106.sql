-- p01_lingkungan_2301010123.sql
-- Password sengaja diganti penanda. JANGAN commit password asli.
CREATE DATABASE kopma_123
 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'mhs_123'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT ALL PRIVILEGES ON kopma_123.* TO 'mhs_123'@'localhost';