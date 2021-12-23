function [varargout]  = gui( varargin )
%gui punto de entrada a interfaces graficas
%  Ejemplo: gui(logindlg,user,pass)


if(nargin >= 1)
        switch varargin{1}
            case 'logindlg'
                [usr,pass] = feval(varargin{1},varargin{1+1},varargin{1+2});
                varargout = [{usr},{pass}];
            otherwise
                varargout = feval(varargin{index});    %llama a una funcion gui
        end
end

end
