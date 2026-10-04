
CREATE DATABASE IF NOT EXISTS kopma_106
 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'mhs_106'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT ALL PRIVILEGES ON kopma_106.* TO 'mhs_106'@'localhost';