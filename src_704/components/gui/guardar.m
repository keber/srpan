function varargout = guardar(varargin)
% GUARDAR M-file for guardar.fig
%      GUARDAR, by itself, creates a new GUARDAR or raises the existing
%      singleton*.
%
%      H = GUARDAR returns the handle to a new GUARDAR or the handle to
%      the existing singleton*.
%
%      GUARDAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUARDAR.M with the given input arguments.
%
%      GUARDAR('Property','Value',...) creates a new GUARDAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guardar_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guardar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help guardar

% Last Modified by GUIDE v2.5 11-Dec-2008 18:38:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guardar_OpeningFcn, ...
                   'gui_OutputFcn',  @guardar_OutputFcn, ...
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


% --- Executes just before guardar is made visible.
function guardar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guardar (see VARARGIN)

% Choose default command line output for guardar
handles.output = hObject;

% Update handles structure
    handles.usr=varargin{1}.usr;
    handles.id_muestra=varargin{1}.id_muestra;
    handles.filesize=varargin{1}.filesize;
    handles.parsedfilepath=varargin{1}.parsedfilepath;
    handles.conjEntr=varargin{1}.conjEntr;
    handles.net=varargin{1}.net;
    handles.EventosSennal=varargin{1}.EventosSennal;
    handles.resultado=varargin{1}.resultado;
guidata(hObject, handles);

set(handles.figure1,'WindowStyle','modal');
% UIWAIT makes guardar wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guardar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
delete(handles.figure1);

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



function txtDescripcionAnalisis_Callback(hObject, eventdata, handles)
% hObject    handle to txtDescripcionAnalisis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtDescripcionAnalisis as text
%        str2double(get(hObject,'String')) returns contents of txtDescripcionAnalisis as a double


% --- Executes during object creation, after setting all properties.
function txtDescripcionAnalisis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtDescripcionAnalisis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
error=false;
try
    r = dBase('query',['select * from muestra where mue_id=' handles.id_muestra]);
    if(iscell(r.Data))  %no encontró datos, de lo contrario retornaría una estructura.
        % insertar la muestra
        r = dBase('insert','muestra',handles.parsedfilepath,str2num(handles.id_muestra),handles.filesize,'Observacion');
    end
catch
    msgbox('Se ha producido un error al insertar| la muestra en la base de datos','Error al insertar muestra','error');
    error=true;
end    

if(~error)
    % insertar el analisis
    id_analisis = dBase('insert','analisis',str2num(handles.usr),sum(handles.resultado.seleccionado),str2num(handles.id_muestra),get(handles.txtDescripcionAnalisis,'String'));

    % insertar eventos
    for i=1:length(handles.resultado.duracion)
        if(handles.resultado.seleccionado(i))
            r = dBase('insert','evento',id_analisis,handles.EventosSennal(i).id,handles.EventosSennal(i).inicio,handles.EventosSennal(i).fin,handles.EventosSennal(i).duracion,handles.EventosSennal(i).area,handles.EventosSennal(i).maximo,handles.EventosSennal(i).stdev,handles.EventosSennal(i).promedio,handles.resultado.durCiclo(i));
        end
    end

    % insertar eventos conj.entr.
    for i=1:length(handles.conjEntr.duracion)
        r = dBase('insert','eventoce',id_analisis,i,handles.conjEntr.inicio(i),handles.conjEntr.fin(i),handles.conjEntr.duracion(i),handles.conjEntr.area(i),handles.conjEntr.amplitud_max(i),handles.conjEntr.stdev(i),handles.conjEntr.amplitud_promedio(i),handles.conjEntr.durCiclo(i));
    end

    %insertar conjunto entrenamiento.
    for i=1:length(handles.conjEntr.duracion)
        r = dBase('insert','conjentr',id_analisis,i,handles.conjEntr.seleccionado(i));
    end

    %insertar "patron" (NN)
    id_patron = dBase('insert','patron',id_analisis);

    %guardar pesos de entrada, IW
    for i=1:5
        for j=1:5
            r = dBase('insert','iw',id_patron,(i*10)+j,handles.net.IW{1}(i,j));
        end
    end

    %guardar pesos de la capa oculta, LW
    for i=1:5
        r=dBase('insert','lw',id_patron,10+i,handles.net.LW{2}(1,i));
    end

    %guardar bias !!!
    r = dBase('insert','bias',id_patron,handles.net.b{1}(1,1),handles.net.b{1}(2,1),handles.net.b{1}(3,1),handles.net.b{1}(4,1),handles.net.b{1}(5,1),handles.net.b{2});
    
    msgbox('El proceso de almacenamiento del analisis ha finalizado exitosamente','Analisis almacenado');
    uiresume(handles.figure1);
end %if

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume(handles.figure1);

function myCloseFcn(hObject,eventdata,handles)
uiresume(handles.figure1);
