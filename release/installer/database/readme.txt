0.a Instalar el servidor de postgres.
	refer to https://www.postgresql.org/download/
0.b Instalar el driver ODBC de postgres.
	refer to https://www.postgresql.org/ftp/odbc/versions/msi/

1. Con el usuario postgres, crear el rol 'srpan_root' - contrase�a: 123lol
	Program Files\PostgreSQL\XX\bin\psql -Upostgres
	create role srpan_root;
	alter role srpan_root with password '123lol';

2. ejecutar: "\Archivos de programa\PostgreSQL\8.1\bin\psql.exe" -f srpan_postgres_db.sql -U postgres

3. Crear el DSN de ODBC:
   - Inicio -> Configuraci�n -> Panel de Control -> Herramientas administrativas -> doble click sobre "Or�genes de datos (ODBC)"
   - Seleccionar la p�gina o pesta�a "DSN de usuario". Pulsar el bot�n 'Agregar'
   - Seleccionar "PostgreSQL Unicode"
   - Utilizar los siguientes datos:
      * DataSource: dbc_srpan
      * Database: srpan
      * Server: localhost
      * User Name: srpan_root
      * password: 123lol
      * port: 54312 [predeterminado]