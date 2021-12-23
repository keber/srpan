function varargout = resultadoAnalisis(varargin)
% RESULTADOANALISIS M-file for resultadoAnalisis.fig
%      RESULTADOANALISIS, by itself, creates a new RESULTADOANALISIS or raises the existingca
%      singleton*.
%
%      H = RESULTADOANALISIS returns the handle to a new RESULTADOANALISIS or the handle to
%      the existing singleton*.
%
%      RESULTADOANALISIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULTADOANALISIS.M with the given input arguments.
%
%      RESULTADOANALISIS('Property','Value',...) creates a new RESULTADOANALISIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before resultadoAnalisis_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property
%      application
%      stop.  All inputs are passed to resultadoAnalisis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help resultadoAnalisis

% Last Modified by GUIDE v2.5 08-Dec-2008 03:43:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @resultadoAnalisis_OpeningFcn, ...
                   'gui_OutputFcn',  @resultadoAnalisis_OutputFcn, ...
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


% --- Executes just before resultadoAnalisis is made visible.
function resultadoAnalisis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to resultadoAnalisis (see VARARGIN)

% Choose default command line output for resultadoAnalisis
    handles.output = hObject;
    guidata(hObject,handles);
    
    if(nargin==10)
        handles.vector = varargin{1};   %segmento
        handles.vector_filtrado = varargin{2};  %segmento_filtrado
        handles.evento = varargin{3};   %EventosSennal
        handles.inicio = varargin{4};   %inicio
        handles.intervalo = varargin{5};%intervalo de muestreo
        handles.sennal_max = varargin{6};
        handles.sennal_min = varargin{7};
        
    end
    guidata(hObject,handles);
    %*************
    vartest = [];

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

        if(i>1)
            vartest.durCiclo(i) = (handles.evento(i).inicio - handles.evento(i-1).inicio)/1000;
        else
            vartest.durCiclo(i) = 0;
        end
        %handles.evento(i).seleccionado = (output(i)>=0.8);
        %miEvento(i).seleccionado = 1;
        vartest.seleccionado(i) = handles.evento(i).seleccionado;

        %if(handles.evento(i).maximo > handles.AmplitudMaximaMuestra)
        %    handles.AmplitudMaximaMuestra = handles.evento(i).maximo;
        %end
        if( (handles.evento(i).fin-handles.evento(i).inicio) > handles.duracionMaximaMuestra)
            handles.duracionMaximaMuestra = handles.evento(i).fin-handles.evento(i).inicio;
        end
    end
    handles.AmplitudMaximaMuestra = mean(vartest.amplitud_max);
    handles.vartest = vartest;
    guidata(hObject,handles);

    %%% HISTOGRAMA %%%
    axes(handles.axes2);hist(handles.vector,0:0.01:handles.AmplitudMaximaMuestra);
    title('Histograma')
    %%%

    % Update handles structure
    guidata(hObject, handles);

    menu = '';
    first=1;
    sw=0;
    for i=1:1:length(handles.evento)
        if(vartest.seleccionado(i))
            if(~sw)
                first=i;
                sw=1;
            end
            menu = [menu num2str(i)];
            if(i<length(handles.evento))
                menu = [menu '|'];
            end
        end
    end
    set(handles.popupmenu1,'String',menu);
    guidata(hObject, handles);
    cargar_evento(1,num2str(1),handles);   %carga en pantalla los datos de un evento x
    graficarPoincare(handles);  %grafico de Poincare.
    
    %%% RESULTADO DE LA SELECCION MEDIANTE ANN FF BP %%%
    axes(handles.axes4);
    plot(handles.vector_filtrado);
    hold on;
    plot(handles.sennal_max','-xr');
    plot(handles.sennal_min','-og');
    %etiquetar
    
    for(i=1:length(handles.evento))
        if(handles.evento(i).seleccionado)
            text(handles.evento(i).peakpos,handles.evento(i).maximo,num2str(handles.evento(i).id),'HorizontalAlignment','left');
        end
    end
    
    hold off;
    zoom on;
    
    
    handles.output = handles.vartest;
    guidata(hObject,handles);

    set(handles.figure1,'WindowStyle','modal');
    % UIWAIT makes defPeaksObservados wait for user response (see UIRESUME)
    % NOTE: uiwait(handles.figure1); %
    uiwait(handles.figure1);    %descomentar en produccion o compilacion


% --- Outputs from this function are returned to the command line.
function varargout = resultadoAnalisis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
    varargout{1} = handles.output;
    
    %varargout{2} = handles.output;

    delete(handles.figure1);
    

function myCloseFcn(hObject,eventdata,handles)
uiresume(handles.figure1);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

    popup_sel_index = get(hObject, 'Value');
    contenido = get(hObject,'String');
    %set(handles.lbl_nEvento,'String',contenido(popup_sel_index,:));
    cargar_evento(str2num(contenido(popup_sel_index,:)),contenido(popup_sel_index,:),handles);

    
function cargar_evento(i,lbl_i,handles)
%señal
    axes(handles.axes1);
    plot([...
        handles.vector(handles.evento(i).inicio:handles.evento(i).fin) ...
        handles.vector_filtrado(handles.evento(i).inicio:handles.evento(i).fin)
        ]);
    set(gca,'XLimMode','manual','Xlim',[0 handles.duracionMaximaMuestra],'YLimMode','manual','Ylim',[0 handles.AmplitudMaximaMuestra]);
    title(['Evento ' lbl_i])
    xlabel('tiempo (ms)')
    ylabel('amplitud (ampere)')

    %%% Adaptado del comentario de Walter Robertson en
    %%% http://groups.google.ca/group/comp.soft-sys.matlab/browse_thread/thread/08e8568fbc2e25af
    xticks = get(gca,'XTick');
    xticklabels = get(gca,'XTickLabel');
    xticklabels = [(num2str(str2num(xticklabels)/1000))];
    %xticklabels = [(num2str(str2num(xticklabels)*handles.intervalo/1000000))];
    set(gca,'XTickLabel',xticklabels);
    %%%

    %%% Parametros descriptivos del evento
    set(handles.lbl_nEvento,'String',lbl_i);
    set(handles.lbl_Inicio,'String',[num2str( (handles.evento(i).inicio+handles.inicio -1) )  ' [ms]' ]);
    set(handles.lbl_Fin,'String',[num2str( (handles.evento(i).fin+handles.inicio -1)) ' [ms]']);
    %[handles.lbl_inicio handles.lbl_fin]
    set(handles.lbl_Duracion,'String',[num2str(handles.evento(i).duracion) ' [ms]']);
    set(handles.lbl_Area,'String',[num2str(handles.evento(i).area) ' [C]']);
    set(handles.lbl_maximo,'String',[num2str(handles.evento(i).maximo) ' [A]']);
    set(handles.lbl_stdev,'String',[num2str(handles.evento(i).stdev) '    ']);
    set(handles.lbl_Promedio,'String',[num2str(handles.evento(i).promedio) ' [A]']);
    if(i>1)
        durCiclo = (handles.evento(i).inicio - handles.evento(i-1).inicio)/1000;
    else
        durCiclo = 0;
    end;
    set(handles.lbl_durCiclo,'String',[num2str(durCiclo) ' [Seg]']);

    %set(handles.lbl_perimetro,'String',num2str(handles.evento(i).perimetro));
    %set(handles.chk_incluir,'Value',handles.evento(i).seleccionado)
    %guidata(hObject, handles);
    

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
    title('Grafico de Poincaré')
    xlabel('duración (ms)')
    ylabel('duración (ms)')
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
    i=n+1;res=0;
    while(i<=length(handles.evento) && ~res)
        if(handles.evento(i).seleccionado)
            res=1;
        else
            i=i+1;
        end
    end
    cargar_evento(i,num2str(i),handles);
end

% --- Executes on button press in btn_anterior.
function btn_anterior_Callback(hObject, eventdata, handles)
% hObject    handle to btn_anterior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n = str2num(get(handles.lbl_nEvento,'String'));
if (n > 1)
    i=n-1;res=0;
    while(i>=1 && ~res)
        if(handles.evento(i).seleccionado)
            res=1;
        else
            i=i-1;
        end
    end
    cargar_evento(i,num2str(i),handles);
end
