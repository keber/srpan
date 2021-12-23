function varargout = dBase(varargin)
%dBase Acceso a la base de datos
%  [login_valido,tipo_usuario] = dBase('login')

conn=db_openconn;
varargout=[{0},{0}];    %salida predeterminada
if(nargin >= 1)
        switch varargin{1}
            case 'login'
                [valid,type] = db_log(conn,varargin{2},varargin{3});
                varargout = [{valid},{type}];
            case 'insert'
                varargout{1} = db_insert(conn,varargin{2:nargin});
            case 'query'
                varargout{1} = db_query(conn,varargin{2:nargin});
            otherwise
                varargout = feval(varargin{1},varargin{2:nargin});    %llama a otra funcion
        end
end
close(conn);
end
