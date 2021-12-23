function varargout = create_user(varargin)
% CREATE_USER M-file for create_user.fig
%      CREATE_USER, by itself, creates a new CREATE_USER or raises the existing
%      singleton*.
%
%      H = CREATE_USER returns the handle to a new CREATE_USER or the handle to
%      the existing singleton*.
%
%      CREATE_USER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATE_USER.M with the given input arguments.
%
%      CREATE_USER('Property','Value',...) creates a new CREATE_USER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before create_user_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to create_user_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help create_user

% Last Modified by GUIDE v2.5 10-Dec-2007 07:35:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @create_user_OpeningFcn, ...
                   'gui_OutputFcn',  @create_user_OutputFcn, ...
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


% --- Executes just before create_user is made visible.
function create_user_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to create_user (see VARARGIN)

% Choose default command line output for create_user
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes create_user wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = create_user_OutputFcn(hObject, eventdata, handles) 
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



function pw1_Callback(hObject, eventdata, handles)
% hObject    handle to pw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pw1 as text
%        str2double(get(hObject,'String')) returns contents of pw1 as a double


% --- Executes during object creation, after setting all properties.
function pw1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pw2_Callback(hObject, eventdata, handles)
% hObject    handle to pw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pw2 as text
%        str2double(get(hObject,'String')) returns contents of pw2 as a double


% --- Executes during object creation, after setting all properties.
function pw2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function appat_Callback(hObject, eventdata, handles)
% hObject    handle to appat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of appat as text
%        str2double(get(hObject,'String')) returns contents of appat as a double


% --- Executes during object creation, after setting all properties.
function appat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to appat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function apmat_Callback(hObject, eventdata, handles)
% hObject    handle to apmat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of apmat as text
%        str2double(get(hObject,'String')) returns contents of apmat as a double


% --- Executes during object creation, after setting all properties.
function apmat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to apmat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radadmin.
function radadmin_Callback(hObject, eventdata, handles)
% hObject    handle to radadmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radadmin


% --- Executes on button press in raduser.
function raduser_Callback(hObject, eventdata, handles)
% hObject    handle to raduser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of raduser



function nomb_Callback(hObject, eventdata, handles)
% hObject    handle to nomb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nomb as text
%        str2double(get(hObject,'String')) returns contents of nomb as a double


% --- Executes during object creation, after setting all properties.
function nomb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nomb (see GCBO)
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

if(get(handles.raduser,'Value')==1)
    tipo=1;
else
    tipo=2;
end

% get(handles.pw1,'string')
% get(handles.rut,'string')
% get(handles.nomb,'string')
% get(handles.appat,'string')
% get(handles.apmat,'string')

disp('test: ')
length(get(handles.pw1,'string'))==0
length(get(handles.rut,'string'))==0
strcmpi(get(handles.pw1,'string'),get(handles.pw2,'string'))==1

% FIXME: Mover almacenamiento a area de base de datos. Llamar como función.

j=0;
while(j==0)
    if( length(get(handles.pw1,'string'))==0 ||  length(get(handles.rut,'string'))==0 ||  length(get(handles.nomb,'string'))==0 ||  length(get(handles.appat,'string'))==0 ||  length(get(handles.apmat,'string'))==0 )
        msg3=msgbox('Debe completar los campos','SRPAN - Error','error','modal');
        uiwait(msg3)
        uiwait(handles.figure1);
    else
        j=1
    end
end

i=0;
while(i==0)
    if( (strcmpi(get(handles.pw1,'string'),get(handles.pw2,'string')))==1)
    % FIXME: conexion a base de datos debería estar centralizada.
    conn=database('dbc_srpan','srpan_root','123lol');
    query=['select fn_crear_usuario(' get(handles.rut,'string') ',''' get(handles.nomb,'string') ''',''' get(handles.appat,'string') ''',''' get(handles.apmat,'string') ''',' num2str(tipo) ',''' get(handles.pw1,'string') ''') as result'];
    disp(query);
    curs=exec(conn,query);
    curs=fetch(curs);
    
    if(iscell(curs.Data))
        disp(curs.Data{1});
        r=curs.Data{1};
    else
        disp(curs.Data);
        r=curs.Data;
    end
    %FIXME: Problema al recuperar el valor de salida.
    %DEVUELVE TRUE O FALSE -- HACER INTERRUPCION DE MENSAJE ERROR
        if(r==1)
        disp('Saliendo');
        close(curs);
        close(conn);
        i=1;
        delete(handles.figure1);
        else
        msg=msgbox('No es posible realizar la operación','SRPAN - Error','error','modal');
        uiwait(msg)
        uiwait(handles.figure1);
        end
    else
    msg2=msgbox('Passwords no coinciden','SRPAN - Error','error','modal');
    % Update handles structure
    guidata(hObject, handles);
    % Use UIRESUME instead of delete because the OutputFcn needs
    % to get the updated handles structure.
    uiwait(msg2)
    uiwait(handles.figure1);
    end
end




