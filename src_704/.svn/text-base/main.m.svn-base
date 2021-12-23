%function [ output_args ] = main
function main
%main Punto de entrada - SRPAN
%  Sistema de Reconocimiento de Patrones de Actividad Neural
disp('Sistema de Reconocimiento de Patrones de Actividad Neural');
addpath(genpath(pwd));  %Añade los subdirectorios del directorio actual al PATH de matlab

valor=1;
while(valor==1)
    [aut_ok,usr_ap,tipo_usr]=mod_auth;  %llama a logindlg y a db_log
    if(aut_ok)
        valor = principal(usr_ap,tipo_usr);
        %uiwait(h); %llama en forma modal.
    else
        valor=0;
    end
end
%rmpath(genpath(pwd));   %Elimina los subidrectorios añadidos al comienzo
end
