function varargout = principal(varargin)
% principal M-file for principal.fig
%      principal, by itself, creates a mnu_nuevo principal or raises the existing
%      singleton*.
%
%      H = principal returns the handle to a mnu_nuevo principal or the handle to
%      the existing singleton*.
%
%      principal('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in principal.M with the given input arguments.
%
%      principal('Property','Value',...) creates a mnu_nuevo principal or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before principal_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to principal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help principal

% Last Modified by GUIDE v2.5 10-Dec-2007 15:42:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @principal_OpeningFcn, ...
                   'gui_OutputFcn',  @principal_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);

if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end


if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end



% End initialization code - DO NOT EDIT


% --- Executes just before principal is made visible.
function principal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)
% varargin   command line arguments to principal (see VARARGIN)

% Choose default command line output for principal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

if(nargin==5)
    handles.usr_ap = varargin{1};
    handles.tipo_usr = varargin{2};
    guidata(hObject,handles);
end
if (handles.tipo_usr==1)
    set(handles.mnu_crearUsuario,'Enable','off')
    set(handles.mnu_eliminarUsuario,'Enable','off')
    set(handles.mnu_imprimirReporteBD,'Enable','off')
end

%set(handles.figure1,'WindowStyle','modal');
% UIWAIT makes defPeaksObservados wait for user response (see UIRESUME)
% NOTE: uiwait(handles.figure1); descomentar en produccion %
uiwait(handles.figure1); %descomentar en produccion o compilacion.


% --- Outputs from this function are returned to the command line.
function varargout = principal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
delete(handles.figure1);


% --------------------------------------------------------------------
function mnu_nuevo_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_nuevo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)
gui_02(handles.usr_ap)

% --------------------------------------------------------------------
function mnu_cargar_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_guardar_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_salir_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)
selection = questdlg(['Esta seguro que desea cerrar ' get(handles.figure1,'Name') '?'],...
                     ['Cerrar ' get(handles.figure1,'Name') '...'],...
                     'Si','No','Si');
if strcmp(selection,'No')
    return;
end
uiresume(handles.figure1);
%delete(handles.figure1);

% --------------------------------------------------------------------
function mnu_nuevo_mnu_usuario_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_nuevo_mnu_usuario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_imprimirReporteBD_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_imprimirReporteBD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)


% --------------------------------------------------------------------
function del_mnu_usuario_Callback(hObject, eventdata, handles)
% hObject    handle to del_mnu_usuario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_analisis_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_analisis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_usuario_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_usuario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)


% --------------------------------------------------------------------
function menu_cerrarSesion_Callback(hObject, eventdata, handles)
% hObject    handle to menu_cerrarSesion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_guardar__Callback(hObject, eventdata, handles)
% hObject    handle to mnu_guardar_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and mnu_usuario data (see GUIDATA)

% --------------------------------------------------------------------
function mnu_guardarComo_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_guardarComo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_crearUsuario_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_crearUsuario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
create_user;

% --------------------------------------------------------------------
function mnu_eliminarUsuario_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_eliminarUsuario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete_user;

% --------------------------------------------------------------------
function mnu_acercaDe_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_acercaDe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(['SRPAN - Sistema de Reconocimiento de Patrones';' Yashir Henriquez                            ';' Susana Donoso                               ';' Keber Flores                                '],'Acerca de SRPAN','help','modal');

% --------------------------------------------------------------------
function mnu_ayuda_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_guardarComo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --------------------------------------------------------------------
function mnu_closeSes_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_closeSes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output=1;
guidata(hObject,handles);
uiresume(handles.figure1);
%[aut_ok,user_ap,tipo_usr]=mod_auth;
%ENTORNO
%if (tipo_usr==1)
%set(handles.mnu_crearUsuario,'Enable','off')
%set(handles.mnu_eliminarUsuario,'Enable','off')
%set(handles.mnu_imprimirReporteBD,'Enable','off')

