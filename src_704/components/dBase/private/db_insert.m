function [ output ] = db_insert(conn,funcion,varargin )
%db_insert(funcion,varargin) - Inserta datos en una tabla de la DB.
%
%   r = db_insert(muestra,path::txt,id_muestra::num,tama�oArchivo::num,obs::txt)
%   id_analisis = db_insert(analisis,usr::num,nEventos::num,id_muestra::num,obs::txt)
%   r = db_insert(evento,analisis,id_evento,inicio,fin,duracion,area,max,stdv,prom,durCiclo)
%   r = db_insert(eventoce,analisis,id_evento,inicio,fin,duracion,area,max,stdv,prom,durCiclo)
%   r = db_insert(conjentr,analisis, eventoce, seleccionado)
%   id_patron = db_insert(patron,id_analisis)
%   r = db_insert(iw,id_patron,coordenadaMatriz(5x5),valor)
%   r = db_insert(lw,id_patron,coordenadaMatriz(1x5),valor)
%   r = db_insert(bias,id_patron,valor(1),valor(2),...,valor(6))
%
output=0;
error=false;
sqlqry='';
%conn=db_openconn;
if(~islogical(conn) && ~isempty(funcion))
    switch funcion
        case 'muestra'  %-- (path,id_muestra,tama�o,observacion)
            sqlqry=['{call ins_muestra(''' varargin{1} ''',' num2str(varargin{2}) ',' num2str(varargin{3}) ',''' varargin{4} ''') as resultado}'];
        case 'analisis' %-- (usuario,nEventos,muestra,obs) ; retorna id_analisis
            sqlqry=['{call ins_analisis(' num2str(varargin{1}) ',' num2str(varargin{2}) ',' num2str(varargin{3}) ',''' varargin{4} ''') as resultado}'];
        case 'evento'   %-- (analisis,id_evento,inicio,fin,duracion,area,max,stdv,prom,durCiclo)
            sqlqry=['{call ins_evento(' num2str(varargin{1}) ',' num2str(varargin{2}) ',' num2str(varargin{3}) ',' num2str(varargin{4}) ',' num2str(varargin{5}) ',' num2str(varargin{6}) ',' num2str(varargin{7}) ',' num2str(varargin{8}) ',' num2str(varargin{9}) ',' num2str(varargin{10}) ') as resultado}'];
        % -- A�adir un evento del conjunto de entrenamiento.
        case 'eventoce'
            sqlqry=['{call ins_eventoce(' num2str(varargin{1}) ',' num2str(varargin{2}) ',' num2str(varargin{3}) ',' num2str(varargin{4}) ',' num2str(varargin{5}) ',' num2str(varargin{6}) ',' num2str(varargin{7}) ',' num2str(varargin{8}) ',' num2str(varargin{9}) ',' num2str(varargin{10}) ') as resultado}'];
        % -- Insertar un registro de conjunto de entrenamiento
        case 'conjentr' %-- (analisis, eventoce, seleccionado)
            if(true(varargin{3}))
                logicvalue = 'true';
            else
                logicvalue = 'false';
            end
            sqlqry=['{call ins_conjentr(' num2str(varargin{1}) ',' num2str(varargin{2}) ',' logicvalue ') as resultado}'];       
        % -- Insertar un patron
        case 'patron'   %-- (analisis); retorna id_patron
            sqlqry=['{call ins_patron(' num2str(varargin{1}) ') as resultado}']; 
        % -- Insertar InputWeights de un patron (nnet)
        case 'iw'       %-- (id_patron,coordenadaMatriz(5x5),valor)
            sqlqry=['{call ins_iw(' num2str(varargin{1}) ',' num2str(varargin{2}) ',' num2str(varargin{3}) ') as resultado}']; 
        % -- Insertar LayerWeights de un patron (nnet)	
        case 'lw'       %-- (id_patron,coordenadaMatriz(1x5),valor)
            sqlqry=['{call ins_lw(' num2str(varargin{1}) ',' num2str(varargin{2}) ',' num2str(varargin{3}) ') as resultado}'];
            %
            % select * from LayerWeights join(
            % 	select * from patron join analisis on (pat_analisis=ana_id)) as foo 
            % on lw_patron = pat_id  order by lw_id;   
            %
        % -- Insertar bias de un patron (nnet )
        case 'bias'     %-- (id_patron,valor(1),valor(2),...,valor(6)). Ojo: Por la caracter�stica de la red, ac� es {1x5} y {1x1}
            sqlqry=['{call ins_bias(' num2str(varargin{1}) ',' num2str(varargin{2}) ',' num2str(varargin{3}) ',' num2str(varargin{4}) ',' num2str(varargin{5}) ',' num2str(varargin{6}) ',' num2str(varargin{7})  ') as resultado}'];
        %otherwise
    end
    
    curs=exec(conn,sqlqry);
    if(isempty(curs.Message))  % => no error.
        row=fetch(curs);    %NOTE: quitar el punto y coma final para ver la salida del cursor, al probar esta funcion.
        output=row.Data.resultado;
    else
        disp(['Error al ejecutar la consulta: ' sqlqry]);
        disp(curs.Message);
    end
end
%close(conn);