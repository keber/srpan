function [varargout]=db_log(conn,varargin)
% var = db_log(usr_ap,pw_ap): Verifica la existencia del usuario
% Retorna 1 y el tipo de usuario si encuentra el user y su pass corresponde, 
% Retorna 0,0 si no existe el usuario, o si la contraseña es incorrecta.
%
% Abre una nueva conexión a la base de datos, lo ideal sería tener una 
% conexión centralizada, abierta al comienzo del programa y cerrada al
% final. 
% Para eso habría que usar variables globales u otro método.

%Intenta Abrir la conexión a la base de datos

error = false;
usr_ap=varargin{1};
pw_ap=varargin{2};
varargout = [{0},{0}];  %salida predeterminada
% try
%     conn = database('dbc_srpan','srpan_root','123lol'); %debería ser una cuenta con permisos para ver sólo una vista de la tabla de usuarios
%     setdbprefs('DataReturnFormat','structure');
% catch
%     disp('Error al establecer conexión con la base de datos');
%     disp(conn.Message);
%     error = true;
% end
%conn=db_openconn;   %post: conn es de tipo 'database', o bien, es de tipo logico (false).
%Si no hubo error al abrir la DB, intenta ejecutar la consulta
if(~islogical(conn))
    %pre: hay una conexión a la base de datos mediante conn
    query=['SELECT uapp_pass,uacon_tip from usuario_app,uapp_conexion where uapp_id=''' num2str(str2num(usr_ap)) ''' and uacon_id=uapp_id;'];
    try
        curs=exec(conn,query);  %ejecuta la query
    catch
        disp(['Error al ejecutar la consulta: ' query]);
        disp(curs.Message);
        error = true;
    end
    %Si no hubo error al obtener el cursor, intenta obtener los datos del
    %cursor
    if(~error)
        %pre: hay un cursor en curs
        %try
            row=fetch(curs);    %se espera encontrar una sola coincidencia
            if(strcmpi(row.Data.uapp_pass,pw_ap)) %compara contraseñas
                varargout = [{1},{row.Data.uacon_tip}];
            end
            close(curs);
        %catch
        %    disp(['Error al obtener datos de la consulta: ' query]);
        %    lasterr
        %end
        %close(conn);
    end
end



