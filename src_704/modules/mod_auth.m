function [aut_ok,usr_ap,tipo_usuario] = mod_auth(varargin)
%modauth SRPAN - Módulo de Autentificación
%  Llamada: [aut_ok,tipo_usuario] = mod_auth
%
%  Muestra un cuadro de diálogo para solicitar al usuario su credencial.
%  Luego, se conecta  a la base de datos para verificar la existencia del 
%  usuario, y la coincidencia de las contraseñas.
%  Retorna un par, consistente en 1 y el tipo de usuario si la
%  autentificación tuvo éxito, o en un 0,0 en caso contrario.
%
%   Llamado desde: modules\main.
%   Requiere a:
%       components\gui
%       components\dBase

%AUTENTIFICACION USERS aut_ok
%0 no autentificado 
%1 autentificado
    aut_ok=0;
    usr_ap=[];
    tipo_usuario=[];
    failedAttempts=0;
    while(aut_ok==0 && failedAttempts<3)
        [usr_ap,pw_ap] = gui('logindlg','Title','SRPAN - Ingresar');   %llamado a funcion logindlg de gui. Obtiene usuario y contraseña

        if(~(isempty(usr_ap) && isempty(pw_ap)))
            [aut_ok,tipo_usuario] = dBase('login',usr_ap,pw_ap); %Envía usuario y contraseña a funcion login de base de datos.
        end
        if(~aut_ok)
            msgout=msgbox('Usuario y/o Contraseña Incorrecta','SRPAN - Ingresar','error','modal');
            uiwait(msgout);
            failedAttempts=failedAttempts+1;
        end
    end
end
%FIN AUTENTIFICACION
