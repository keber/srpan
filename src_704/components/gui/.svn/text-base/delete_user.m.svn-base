function varargout = delete_user(varargin)
% DELETE_USER M-file for delete_user.fig
%      DELETE_USER, by itself, creates a new DELETE_USER or raises the existing
%      singleton*.
%
%      H = DELETE_USER returns the handle to a new DELETE_USER or the handle to
%      the existing singleton*.
%
%      DELETE_USER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DELETE_USER.M with the given input arguments.
%
%      DELETE_USER('Property','Value',...) creates a new DELETE_USER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before delete_user_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to delete_user_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help delete_user

% Last Modified by GUIDE v2.5 10-Dec-2007 07:35:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @delete_user_OpeningFcn, ...
                   'gui_OutputFcn',  @delete_user_OutputFcn, ...
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


% --- Executes just before delete_user is made visible.
function delete_user_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to delete_user (see VARARGIN)

% Choose default command line output for delete_user
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes delete_user wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = delete_user_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function rut_Callback(hObject, eventdata, handles)
% hObject    handle to rut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rut as text
%        str2double(get(hObject,'String')) returns contents of rut as a double


% --- Executes during object creation, after setting all properties.
function rut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in bt_cancelar.
function bt_cancelar_Callback(hObject, eventdata, handles)
% hObject    handle to bt_cancelar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);

% --- Executes on button press in btn_Aceptar.
function btn_Aceptar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Aceptar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%uapp_conexion
%usuario_app
rut=get(handles.rut,'string')

conn=database('dbc_srpan','srpan_root','123lol');

query0=['select uapp_id from usuario_app where uapp_id=' rut];
curs0=exec(conn,query0);
curs0=fetch(curs0);
out0=curs0.Data{1};
disp(out0);
load temp;
disp(usr_ap);
val=strcmpi(out0,'No Data')
val2=strcmpi(usr_ap,rut)
if(val==1)
 msg1=msgbox('El Usuario no existe','SRPAN - Error','error','modal');
 uiwait(msg1)
else
  selection = questdlg(['Esta seguro que desea Eliminar?'],...
                     ['SRPAN - Advertencia...'],...
                     'Si','No','Si');
        if strcmp(selection,'No')
            return;
        else
            if(val2==1)
             msg2=msgbox('No se puede eliminar a si mismo!','SRPAN - Error','error','modal');
             uiwait(msg2)   
            else
            query1=['delete from uapp_conexion where uacon_id=' rut];
            disp(query1);
            curs1=exec(conn,query1);
            curs1=fetch(curs1);
            out1=curs1.Data;
            disp(out1);

            query2=['delete from usuario_app where uapp_id=' rut];
            disp(query2);
            curs2=exec(conn,query2);
            curs1=fetch(curs2);
            out2=curs2.Data;
            disp(out2);

            query3=['delete from usuario where usu_id=' rut];
            disp(query3);
            curs3=exec(conn,query3);
            curs3=fetch(curs3);
            out3=curs3.Data;
            disp(out3);

            close(curs1);
            close(curs2);
            close(curs3);
            close(conn);
            end

        end

    delete(handles.figure1)

end



