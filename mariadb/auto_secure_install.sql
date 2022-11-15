-- DELETE FROM mysql.user WHERE User='';
-- DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
-- DROP DATABASE IF EXISTS test;
-- DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

CREATE DATABASE IF NOT EXISTS yourdb;

CREATE USER 'hliwa'@'%' IDENTIFIED BY 'secret';

GRANT ALL PRIVILEGES ON yourdb.* TO 'hliwa'@'%';

USE yourdb;

UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='root';
UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='root';
FLUSH PRIVILEGES;

-- change root password
ALTER USER 'root'@'%' IDENTIFIED BY '123456';


--  To verify the right permissions you just granted to the user, run this command:
--    SHOW GRANTS FOR 'hliwa'@localhost;

-- UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root';

FLUSH PRIVILEGES;