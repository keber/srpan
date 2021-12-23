function [ conn ] = db_openconn(varargin)
%db_openconn Abre la conexion a la base de datos
%  Detailed explanation goes here
try
    conn = database('dbc_srpan','srpan_root','srpan'); %deber�a ser una cuenta con permisos para ver s�lo una vista de la tabla de usuarios
    setdbprefs('DataReturnFormat','structure');
    if(~isempty(conn.Message))
        conn=false;
    end
catch
    disp('Error al establecer conexi�n con la base de datos');
    disp(conn.Message);
    conn = false;
end