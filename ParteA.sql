--cd mysql
--cd bin
--- mysql -u root -p


--1.	Crear una base de datos llamada “prueba”.

CREATE DATABASE PRUEBA;
SHOW DATABASES;
USE PRUEBA;


-- 2.	Crear una tabla “ejemplo” en la base de datos “prueba”

CREATE TABLE EJEMPLO(
COD_EJEMPLO BIGINT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO VARCHAR(50) NOT NULL
)



SHOW TABLES;
DESCRIRBE EJEMPLO;



-- 3.	Crear un usuario “administrador” para la base de datos “prueba” que pueda conectarse localmente a la base de datos y tenga todos los permisos sobre la base de datos.
CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'admin123';

GRANT ALL PRIVILEGES ON prueba.* TO 'administrador'@'localhost';

FLUSH PRIVILEGES;

SELECT User, Host FROM mysql.user;

SHOW GRANTS FOR 'administrador'@'localhost';



-- 4.	Crear un usuario “gerente” para la base de datos que se pueda conectar remotamente y tenga todos los permisos. 
CREATE USER 'gerente'@'%' IDENTIFIED BY 'gerente123';

GRANT ALL PRIVILEGES ON prueba.* TO 'gerente'@'%';

FLUSH PRIVILEGES;

SELECT User, Host FROM mysql.user WHERE User = 'gerente';

SHOW GRANTS FOR 'gerente'@'%';


--5.	Crear un usuario “consulta” para la base de datos que se pueda conectar remotamente y que pueda tener permisos de consulta sobre la base de datos.

CREATE USER 'consulta'@'%' IDENTIFIED BY 'consulta123';

GRANT SELECT ON prueba.* TO 'consulta'@'%';

FLUSH PRIVILEGES;

SELECT User, Host FROM mysql.user WHERE User = 'consulta';

SHOW GRANTS FOR 'consulta'@'%';


--6.	Crear un usuario “consulta_ejemplo” que pueda conectarse localmente y que tenga permisos de consulta, inserción, borrado y modificación en la tabla “ejemplo”.  
CREATE USER 'consulta_ejemplo'@'localhost' IDENTIFIED BY 'consulta_ejemplo123';

GRANT SELECT, INSERT, DELETE, UPDATE ON prueba.ejemplo TO 'consulta_ejemplo'@'localhost';

FLUSH PRIVILEGES;

SELECT User, Host FROM mysql.user WHERE User = 'consulta_ejemplo';

SHOW GRANTS FOR 'consulta_ejemplo'@'localhost';




