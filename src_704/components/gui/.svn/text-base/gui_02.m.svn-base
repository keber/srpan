function varargout = gui_02(varargin)
% GUI_02 M-file for gui_02.fig
%      GUI_02, by itself, creates a new GUI_02 or raises the existing
%      singleton*.
%
%      H = GUI_02 returns the handle to a new GUI_02 or the handle to
%      the existing singleton*.
%
%      GUI_02('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_02.M with the given input arguments.
%
%      GUI_02('Property','Value',...) creates a new GUI_02 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_02_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_02_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help gui_02

% Last Modified by GUIDE v2.5 05-Dec-2008 11:10:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_02_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_02_OutputFcn, ...
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
end

% --- Executes just before gui_02 is made visible.
function gui_02_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_02 (see VARARGIN)

    if(nargin==4)
        handles.usr=varargin{1};
    end
    % Choose default command line output for gui_02
    handles.output = hObject;
    handles.evento = [];
    %valores predeterminados:
    handles.inicio = 1;
    handles.fin = 1000;
    handles.gradoFiltro = 10;
    handles.nPeaks=1;
    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes gui_02 wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = gui_02_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
    varargout{1} = handles.output;
end

% --- Executes on button press in btnCargarArchivo.
function btnCargarArchivo_Callback(hObject, eventdata, handles)
% hObject    handle to btnCargarArchivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    axes(handles.axes1);
    cla;
    %disp('Cargando Archivo ABF');
    %C:\Documents and Settings\Keber\Escritorio\axon\ejemplos_lab\07508000.abf
    [d,si]=abfload(get(handles.txt_archivo,'string'),'start',0,'stop','e');

    %disp('Carga de archivo ABF finalizada');
    %disp(['si=' num2str(si)]);
    plot(d(:,2));
    %disp(length(d(:,2)));
    
    set(gca,'XLimMode','manual','Xlim',[0 length(d(:,2))]);
    %%% Adaptado del comentario de Walter Robertson en
    %%% http://groups.google.ca/group/comp.soft-sys.matlab/browse_thread/thread/08e8568fbc2e25af
    
    %xticks = get(gca,'XTick'); 
    %xticklabels = get(gca,'XTickLabel'); 
    %xticklabels = [(num2str(str2num(xticklabels)*100000/1000))]; %ajuste a segundos; 
    
    %set(gca,'XTickLabel',xticklabels);
    xlabel('tiempo transcurrido [ms]');
    ylabel('Potencial de acción [A]');

        
    handles.archivo_actual = d;
    handles.intervalo = si;
    guidata(hObject,handles);
    set(handles.figure1,'Name',['Analisis - ' get(handles.txt_archivo,'string')]);
    %set(handles.axes2_btn_cargar,'Enable','on')
    set(handles.btnDefSegmento,'Enable','on')
    
    set(handles.btnDefConjEntrenamiento,'Enable','off')
    set(handles.btnEntrenar,'Enable','off')
    set(handles.btnDetectar,'Enable','off')
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end



% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%printdlg(handles.figure1)
end

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                         ['Close ' get(handles.figure1,'Name') '...'],...
                         'Yes','No','Yes');
    if strcmp(selection,'No')
        return;
    end
    delete(handles.figure1)
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as
% cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
end


% --- Executes on button press in btnSeleccionar.
function btnSeleccionar_Callback(hObject, eventdata, handles)
% hObject    handle to btnSeleccionar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    [filename, pathname, filterindex] = uigetfile('*.ABF', 'Seleccione el archivo ABF');
    if isequal(filename,0)
        %disp('User selected Cancel');
    else
        
        archivo=[pathname,filename];
        filedata = dir(archivo);
        filesize = filedata.bytes;
        %The dir function also returns the filename (s.name), last
        %modification date (s.date), and whether or not it's a directory (s.isdir).
        [handles.id_muestra,rem]=strtok(filename,'.');
        handles.filesize=filesize;
        handles.parsedfilepath = [];
        [str,rem]=strtok(pathname,'\');
        while(~isempty(str))
            handles.parsedfilepath= [handles.parsedfilepath str '\\'];
            [str,rem]=strtok(rem,'\');
        end
        %parsedfilepath='C:\\Documents and Settings\\User\\etc...'
        
        set(handles.txt_archivo,'string',archivo);
        set(handles.btnCargarArchivo,'Enable','on');

        set(handles.btnDefSegmento,'Enable','off')
        set(handles.btnDefConjEntrenamiento,'Enable','off')
        set(handles.btnEntrenar,'Enable','off')
        set(handles.btnDetectar,'Enable','off')
        
        guidata(hObject,handles);
    end
end


function txt_archivo_Callback(hObject, eventdata, handles)
% hObject    handle to txt_archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_archivo as text
%        str2double(get(hObject,'String')) returns contents of txt_archivo as a double
end





% --- Executes during object creation, after setting all properties.
function txt_archivo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end





% --- Executes on button press in btnDefSegmento.
function btnDefSegmento_Callback(hObject, eventdata, handles)
% hObject    handle to btnDefSegmento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    % obtiene parametros que definen un segmento (inicio y fin) y el grado
    % del filtro (cantidad de elementos que se consideran para calcular el
    % promedio), mediante una interfaz grafica de usuario (gui
    % defParamSegmento).
    [handles.inicio,handles.fin,handles.gradoFiltro] = defParamSegmento(handles.inicio,handles.fin,handles.gradoFiltro);
    % se almacenan ambos segmentos en un área global
    guidata(hObject,handles)    
    
    axes(handles.axes2);cla;
  
    % segmento_integrado es un segmento de la señal integrada v/s tiempo.
    handles.segmento=handles.archivo_actual(handles.inicio:handles.fin,2);  %segmento_integrado = archivo_actual(:,2)
    handles.segmento_filtrado=filtro_promedio(handles.archivo_actual(handles.inicio:handles.fin,2),handles.gradoFiltro);

    % se almacenan ambos segmentos en un área global
    guidata(hObject,handles)
    
    % dibujar la grafica (segmento seleccionado)
    plot([handles.segmento,handles.segmento_filtrado]);
    %set(handles.btn_peaks,'Enable','on')
    set(handles.btnDefConjEntrenamiento,'Enable','on')
    set(gca,'XLimMode','manual','Xlim',[0 length(handles.segmento)]);

end


function [delta] = delta(vector,n)
    x = diff(vector)
    delta = [0 x']
end




function [v1,v2,v3] = filtro3(segmento_filtrado,segmento,n,intervalo)
    % encontrar máximos, y entorno a ellos, encontrar mínimos.
    % SALIDAS:
    % v1: vector de maximos
    % v2: vector de mínimos
    % v3: Estructura con informaciòn de los eventos.
    n=n+1;
    lv = length(segmento_filtrado);                    %lv: largo vector (segmento)

    %pant=ini;                               %pant: punto anterior
    pant=1;

    l=floor(pant+(lv/n - mod(lv,n)/n));     %ceil->techo ; floor->piso ; round->redondear
    v1 = NaN(1,lv);                         %matriz para maximos
    v2 = NaN(1,lv);                         %matriz para minimos
    %v3 = NaN(1,round(lv/l));                                 %matriz-estructura para datos de eventos
    i=1;
    for p=l:l:lv
       [x,y] = maxpos(segmento_filtrado(pant:p));      %posicion y valor max entre pant y p.
       pos=pant+x-1;
       v1(pos)=y;

       [x2,y2] = minpos(segmento_filtrado(max((pos-300),1):pos));%pos y val min entre pos-300 y pos
       minleft=max(pos-300+x2,1);
       v2(minleft)=y2;

       [x2,y2] = minpos(segmento_filtrado(pos:min(pos+600,lv) ));%pos y val min entre pos y pos+600
       minright=min(pos+x2,lv);
       v2(minright)=y2;
       pant=p;
       
       v3(i).id=i;
       v3(i).inicio = minleft;
       v3(i).fin = minright;
       v3(i).duracion = (minright - minleft);%*intervalo / 1000; %duracion en milisegundos
       v3(i).area = area(segmento(minleft:minright)); %area (Coulombios: Ampere * Segundos)
       v3(i).maximo = max(segmento(minleft:minright));
       v3(i).peakpos = pos;
       v3(i).minimo = min(segmento(minleft:minright));   
       v3(i).perimetro = perimetro(segmento(minleft:minright));    %resultados no probados.
       v3(i).promedio = mean(segmento(minleft:minright));
       v3(i).stdev = std(segmento(minleft:minright));
       v3(i).seleccionado = 1;
       i=i+1;
       %msgbox(num2str(perimetro(vector(minleft:minright))) );
    end
end




% --- Executes on button press in btn_Area.
function btn_Area_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
end




% --- Executes on button press in btnDefConjEntrenamiento.
function btnDefConjEntrenamiento_Callback(hObject, eventdata, handles)
% hObject    handle to btnDefConjEntrenamiento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    handles.nPeaks = defPeaksObservados(handles.nPeaks);
    guidata(hObject,handles)

    axes(handles.axes3);    
    cla;
    
    [segmento_max,segmento_min,miEvento] = filtro3(handles.segmento_filtrado,handles.segmento,handles.nPeaks,handles.intervalo); %ojo: segmento / ¿inicio?

    
    plot(handles.segmento_filtrado);
    hold on;
    plot(segmento_max','-xr');
    plot(segmento_min','-og');
    %etiquetar
    cont=0;
    %segmento_max
    for(i=1:length(miEvento))
        if(miEvento(i).seleccionado)
            text(miEvento(i).peakpos,miEvento(i).maximo,num2str(miEvento(i).id),'HorizontalAlignment','left');
        end
    end
    
    hold off;
    
    handles.evento=miEvento;
    %llamada a gui 'definir conjunto entrenamiento'
    [handles.conjEntr] = evento(handles.segmento,handles.segmento_filtrado,miEvento,handles.inicio,handles.intervalo);  %llamada a evento.fig
    for i=1:length(miEvento)
        handles.conjEntr.inicio(i) = handles.inicio+miEvento(i).inicio-1;
        handles.conjEntr.fin(i) = handles.inicio+miEvento(i).fin-1;
    end
    guidata(hObject,handles)
    
    set(handles.btnEntrenar,'Enable','on');
    
    
end


% --- Executes on button press in btnEntrenar.
function btnEntrenar_Callback(hObject, eventdata, handles)
% hObject    handle to btnEntrenar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    %                   duracion,area ,ampMax,ampProm,stdv(amp)
    handles.net = newff([0 900 ;0 2 ; 0 3  ; 0 3 ; 0 0.2]   , [5 1],{'logsig','logsig'});
    % NOTE: net1 = handles.net; save net1 net1;
    %net1 = handles.net;
    %save net1 net1;
    handles.net.trainParam.epochs = 2300;
    input = [handles.conjEntr.duracion;handles.conjEntr.area;handles.conjEntr.amplitud_max;handles.conjEntr.amplitud_promedio;handles.conjEntr.stdev];
    target = handles.conjEntr.seleccionado;

    handles.net = train(handles.net,input,target);
    % NOTE: net2 = handles.net; save net2 net2;
    %net2 = handles.net;
    %save net2 net2; 

    guidata(hObject,handles)

    set(handles.btnDetectar,'Enable','on');
end

% --- Executes on button press in btnDetectar.
function btnDetectar_Callback(hObject, eventdata, handles)
% hObject    handle to btnDetectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

   
    largo_sennal = length(handles.archivo_actual(:,2));
    %nPeaks Estimados de la señal completa%
    nPeaks = round(largo_sennal/(length(handles.segmento)/handles.nPeaks));  
    sennal_filtrada=filtro_promedio(handles.archivo_actual(:,2),handles.gradoFiltro);

    axes(handles.axes3);    
    cla;
    
    [sennal_max,sennal_min,EventosSennal] = filtro3(sennal_filtrada,handles.archivo_actual(:,2),nPeaks,handles.intervalo); %ojo: segmento / ¿inicio?
    input = [EventosSennal.duracion;EventosSennal.area;EventosSennal.maximo;EventosSennal.promedio;EventosSennal.stdev];
    %handles.evento = evento;
    %guidata(hObject,handles)
    output = sim(handles.net,input);
    
    
    sw=0;
    for i=1:length(output)
        %EventosSennal.id=i;
        if(output(i)<0.8)
            EventosSennal(i).seleccionado=0;
            sennal_max(EventosSennal(i).peakpos)=NaN;
            sennal_min(EventosSennal(i).inicio)=NaN;
            sennal_min(EventosSennal(i).fin)=NaN;
        else
            EventosSennal(i).seleccionado=1;
        end
    end
    
    plot(sennal_filtrada);
    hold on;
    plot(sennal_max','-xr');
    plot(sennal_min','-og');
    
    %etiquetar 
    for(i=1:length(EventosSennal))
        if(EventosSennal(i).seleccionado)
            text(EventosSennal(i).peakpos,EventosSennal(i).maximo,num2str(EventosSennal(i).id),'HorizontalAlignment','left');
        end
    end
    
    hold off;
    zoom on;
    
    handles.EventosSennal = EventosSennal;
    resultado = resultadoAnalisis(handles.archivo_actual(:,2),sennal_filtrada,EventosSennal,1,handles.intervalo,sennal_max,sennal_min);  %llamada a resultadoAnalisis.fig
    handles.resultado = resultado;
    %save resultado resultado;
    guidata(hObject,handles);
        
end



% --- Executes on button press in btnGuardarAnalisis.
function btnGuardarAnalisis_Callback(hObject, eventdata, handles)
% hObject    handle to btnGuardarAnalisis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    strsave.usr=handles.usr;
    strsave.id_muestra=handles.id_muestra;
    strsave.filesize=handles.filesize;
    strsave.parsedfilepath=handles.parsedfilepath;
    strsave.conjEntr=handles.conjEntr;
    strsave.net=handles.net;
    strsave.EventosSennal=handles.EventosSennal;
    strsave.resultado=handles.resultado;
    guardar(strsave);
end
