echo "Installing MariaDB..."

apt install -y mariadb-server

mysql <<EOF

CREATE DATABASE IF NOT EXISTS cs2;

CREATE USER IF NOT EXISTS 'cs2server'@'localhost'
IDENTIFIED BY 'cs2server';

GRANT ALL PRIVILEGES ON cs2.* TO 'cs2server'@'localhost';

FLUSH PRIVILEGES;

EOF