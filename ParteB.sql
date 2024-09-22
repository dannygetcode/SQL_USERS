--1.	Revocar los permisos del usuario “administrador” de tal forma que solo pueda realizar consultas sobre la base de datos.
REVOKE ALL PRIVILEGES ON prueba.* FROM 'administrador'@'localhost';

GRANT SELECT ON prueba.* TO 'administrador'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'administrador'@'localhost';



-- 2.	Revocar los permisos sobre el usuario “consulta_ejemplo” de tal forma que solo quede con permisos de consulta sobre la tabla “ejemplo”.
REVOKE ALL PRIVILEGES ON prueba.ejemplo FROM 'consulta_ejemplo'@'localhost';

GRANT SELECT ON prueba.ejemplo TO 'consulta_ejemplo'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'consulta_ejemplo'@'localhost';



-- 3.	Remover todos los permisos del usuario “gerente”.
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'gerente'@'%';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'gerente'@'%';


-- 4.	Renombrar el tipo de usuario “gerente” a “asesor”
RENAME USER 'gerente'@'%' TO 'asesor'@'%';

SELECT User, Host FROM mysql.user WHERE User = 'asesor';


-- 5.	Cambiar la clave del usuario “asesor”
ALTER USER 'asesor'@'%' IDENTIFIED BY 'asesor123';

mysql -u asesor -p 
asesor123


-- 6.	Eliminar el usuario “asesor” 
DROP USER 'asesor'@'%';

SELECT User, Host FROM mysql.user WHERE User = 'asesor';

SELECT User, Host FROM mysql.user 






