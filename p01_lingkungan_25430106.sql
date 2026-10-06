
CREATE DATABASE IF NOT EXISTS kopma_106
 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'mhs_106'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT ALL PRIVILEGES ON kopma_106.* TO 'mhs_106'@'localhost';

CREATE USER IF NOT EXISTS 'tamu_106'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT SELECT ON kopma_106.* TO 'tamu_106'@'localhost';

CREATE DATABASE IF NOT EXISTS perpus_106
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'dev_106'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT ALL PRIVILEGES ON perpus_106.* TO 'dev_106'@'localhost';

git init
git add README.md p01_lingkungan_25430106.sql
git commit -m "p01: inisialisasi repositori dan skrip lingkungan"
git remote add origin https://github.com/mufidfalihhuda-afk/basisdata-25430106.git
git push -u origin main