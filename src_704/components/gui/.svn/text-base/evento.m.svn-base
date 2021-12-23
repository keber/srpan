function varargout = evento(varargin)
% EVENTO M-file for evento.fig
%      EVENTO, by itself, creates a new EVENTO or raises the existingca
%      singleton*.
%
%      H = EVENTO returns the handle to a new EVENTO or the handle to
%      the existing singleton*.
%
%      EVENTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EVENTO.M with the given input arguments.
%
%      EVENTO('Property','Value',...) creates a new EVENTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before evento_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property
%      application
%      stop.  All inputs are passed to evento_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help evento

% Last Modified by GUIDE v2.5 10-Dec-2008 10:49:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @evento_OpeningFcn, ...
                   'gui_OutputFcn',  @evento_OutputFcn, ...
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


% --- Executes just before evento is made visible.
function evento_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to evento (see VARARGIN)

% Choose default command line output for evento
handles.output = hObject;

if(nargin==8)
    handles.vector = varargin{1};   %segmento
    handles.vector_filtrado = varargin{2};  %segmento_filtrado
    handles.evento = varargin{3};   %miEvento
    handles.inicio = varargin{4};   %inicio
    handles.intervalo = varargin{5};%intervalo de muestreo
end

%*************
vartest = [];
handles.AmplitudMaximaMuestra = handles.evento(1).maximo;
handles.duracionMaximaMuestra = handles.evento(1).fin - handles.evento(1).inicio;
for i=1:1:length(handles.evento)
%     %a(i,1) = miEvento(i).inicio;
%     %a(i,2) = miEvento(i).fin;
     vartest.duracion(i) = handles.evento(i).duracion;
     vartest.area(i) = handles.evento(i).area;
     vartest.perimetro(i) = handles.evento(i).perimetro;
     vartest.amplitud_max(i) = handles.evento(i).maximo;
     vartest.amplitud_min(i) = handles.evento(i).minimo;
     vartest.amplitud_promedio(i) = handles.evento(i).promedio;
     vartest.stdev(i) = handles.evento(i).stdev;
     
     if(i>1)
        vartest.durCiclo(i) = (handles.evento(i).inicio - handles.evento(i-1).inicio)/1000;
     else
         vartest.durCiclo(i) = 0;
     end
     handles.evento(i).seleccionado = 1; 
     %miEvento(i).seleccionado = 1; 
     vartest.seleccionado(i) = 1;
     
     if(handles.evento(i).maximo > handles.AmplitudMaximaMuestra)
         handles.AmplitudMaximaMuestra = handles.evento(i).maximo;
     end
     if( (handles.evento(i).fin-handles.evento(i).inicio) > handles.duracionMaximaMuestra)
         handles.duracionMaximaMuestra = handles.evento(i).fin-handles.evento(i).inicio;
     end
end
handles.vartest = vartest;

%%% grafico poincare: en cargar_evento

%%% HISTOGRAMA %%%
axes(handles.axes2);hist(handles.vector,0:0.01:handles.AmplitudMaximaMuestra);
%%%

%save test vartest ;    %test almacena la estructura vartest, que contiene
%los parametros de los eventos obtenidos a partir de la señal; con el fin
%de ser rescatados desde otra gui. 

% Update handles structure
guidata(hObject, handles);

menu = '';
for i=1:1:length(handles.evento)
    menu = [menu num2str(i)];
    if(i<length(handles.evento))
        menu = [menu '|'];
    end
end
set(handles.popupmenu1,'String',menu);
guidata(hObject, handles);
cargar_evento(1,handles);   %carga en pantalla los datos de un evento x

set(handles.figure1,'WindowStyle','modal');
% UIWAIT makes defPeaksObservados wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = evento_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.vartest;
%varargout{2} = handles.output;

delete(handles.figure1);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

popup_sel_index = get(hObject, 'Value');
cargar_evento(popup_sel_index,handles);

function cargar_evento(i,handles)
%señal
axes(handles.axes1);
plot([...
      handles.vector(handles.evento(i).inicio:handles.evento(i).fin) ...
      handles.vector_filtrado(handles.evento(i).inicio:handles.evento(i).fin)
    ]);
set(gca,'XLimMode','manual','Xlim',[0 handles.duracionMaximaMuestra],'YLimMode','manual','Ylim',[0 handles.AmplitudMaximaMuestra]);

%%% Adaptado del comentario de Walter Robertson en
%%% http://groups.google.ca/group/comp.soft-sys.matlab/browse_thread/thread/08e8568fbc2e25af
xticks = get(gca,'XTick'); 
xticklabels = get(gca,'XTickLabel'); 
xticklabels = [(num2str(str2num(xticklabels)/1000))];
%xticklabels = [(num2str(str2num(xticklabels)*handles.intervalo/1000000))];
set(gca,'XTickLabel',xticklabels);
%%%

%%% Parametros descriptivos del evento
set(handles.lbl_nEvento,'String',num2str(i));
set(handles.lbl_Inicio,'String',[num2str( (handles.evento(i).inicio+handles.inicio -1) )  ' [ms]' ]);
set(handles.lbl_Fin,'String',[num2str( (handles.evento(i).fin+handles.inicio -1)) ' [ms]']);
%[handles.lbl_inicio handles.lbl_fin]
set(handles.lbl_Duracion,'String',[num2str(handles.evento(i).duracion) ' [ms]']);
set(handles.lbl_Area,'String',[num2str(handles.evento(i).area) ' [C]']);
set(handles.lbl_Maximo,'String',[num2str(handles.evento(i).maximo) ' [A]']);
set(handles.lbl_stdev,'String',[num2str(handles.evento(i).stdev) ' [A]']);
set(handles.lbl_Promedio,'String',[num2str(handles.evento(i).promedio) ' [A]']);
if(i>1)
   durCiclo = (handles.evento(i).inicio - handles.evento(i-1).inicio)/1000;
else
   durCiclo = 0;
end;
set(handles.lbl_durCiclo,'String',[num2str(durCiclo) ' [Seg]']);

%set(handles.lbl_perimetro,'String',num2str(handles.evento(i).perimetro));
set(handles.chk_incluir,'Value',handles.evento(i).seleccionado);
%guidata(hObject, handles);
graficarPoincare(handles);

%FIN cargar_evento

function graficarPoincare(handles)
%%% grafico poincare
%%% duracion del proximo versus la duracion del actual.
cont=0;
p1=[];p2=[];
for i=1:length(handles.evento)-1
    %disp([num2str(i) '=' num2str(handles.evento(i).seleccionado)]);
    %disp([num2str(i) '=' num2str(hay_un_proximo(i,handles.evento))]);
    if(handles.evento(i).seleccionado && hay_un_proximo(i,handles.evento))
        cont=cont+1;
        p1(cont)=handles.evento(i).duracion;     %p1
    end
end
cont=0;
for i=2:length(handles.evento)
    %disp([num2str(i) '=' num2str(handles.evento(i).seleccionado)]);
    %disp([num2str(i) '=' num2str(hay_un_anterior(i,handles.evento))]);
    if(handles.evento(i).seleccionado && hay_un_anterior(i,handles.evento))
        cont=cont+1;
        p2(cont)=handles.evento(i).duracion;   %p2  
    end
end

axes(handles.axes3);plot(p1,p2,'rx');
cont=1;
for i=1:length(p1)
    while(~handles.evento(cont).seleccionado)
        cont=cont+1;
    end
    text(p1(i),p2(i),num2str(cont),...
     'HorizontalAlignment','left');
    cont=cont+1;
end
%%%%%%%%%%%%%%%

function res = hay_un_anterior(actual,conjunto)
i=1;res=0;
while( (i<actual) && ~res)
    if(conjunto(i).seleccionado)
        res=1;
    end
    i=i+1;
end

function res = hay_un_proximo(actual,conjunto)
i=actual+1;res=0;
while(i<=length(conjunto) && ~res)
    if(conjunto(i).seleccionado)
        res=1;
    end
    i=i+1;
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_siguiente.
function btn_siguiente_Callback(hObject, eventdata, handles)
% hObject    handle to btn_siguiente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n = str2num(get(handles.lbl_nEvento,'String'));
if (n < length(handles.evento))
    n=n+1;
    %set(handles.lbl_nEvento,'String',num2str(n));
    cargar_evento(n,handles);
end

% --- Executes on button press in btn_anterior.
function btn_anterior_Callback(hObject, eventdata, handles)
% hObject    handle to btn_anterior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n = str2num(get(handles.lbl_nEvento,'String'));
if (n > 1)
    n=n-1;
    %set(handles.lbl_nEvento,'String',num2str(n));
    cargar_evento(n,handles);
end


% --- Executes on button press in chk_incluir.
function chk_incluir_Callback(hObject, eventdata, handles)
% hObject    handle to chk_incluir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk_incluir
n = str2num(get(handles.lbl_nEvento,'String'));
if (get(hObject,'Value') == get(hObject,'Max'))
    handles.evento(n).seleccionado = 1;
    handles.vartest.seleccionado(n) = 1;
else
     handles.evento(n).seleccionado = 0;
     handles.vartest.seleccionado(n) = 0;
end
guidata(hObject, handles);
graficarPoincare(handles);






function txt_pesos_Callback(hObject, eventdata, handles)
% hObject    handle to txt_pesos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_pesos as text
%        str2double(get(hObject,'String')) returns contents of txt_pesos as a double


% --- Executes during object creation, after setting all properties.
function txt_pesos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_pesos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_bias_Callback(hObject, eventdata, handles)
% hObject    handle to txt_bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_bias as text
%        str2double(get(hObject,'String')) returns contents of txt_bias as a double


% --- Executes during object creation, after setting all properties.
function txt_bias_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in btnGuardar.
function btnGuardar_Callback(hObject, eventdata, handles)
% hObject    handle to btnGuardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.output = handles.vartest.seleccionado;

%handles.output = handles.vartest.seleccionado';
guidata(hObject,handles);
%vartest = handles.vartest;
%save 'C:\Documents and Settings\Keber\Escritorio\Escritorio\SRPAN\DS2\source\components\gui\red' vartest;
uiresume(handles.figure1);


% --- Executes on button press in chk_incluir.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to chk_incluir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk_incluir


