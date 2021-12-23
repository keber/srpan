function varargout = defPeaksObservados(varargin)
% DEFPEAKSOBSERVADOS M-file for defPeaksObservados.fig
%      DEFPEAKSOBSERVADOS, by itself, creates a new DEFPEAKSOBSERVADOS or raises the existing
%      singleton*.
%
%      H = DEFPEAKSOBSERVADOS returns the handle to a new DEFPEAKSOBSERVADOS or the handle to
%      the existing singleton*.
%
%      DEFPEAKSOBSERVADOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEFPEAKSOBSERVADOS.M with the given input arguments.
%
%      DEFPEAKSOBSERVADOS('Property','Value',...) creates a new DEFPEAKSOBSERVADOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before defPeaksObservados_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to defPeaksObservados_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help defPeaksObservados

% Last Modified by GUIDE v2.5 04-Dec-2008 12:53:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @defPeaksObservados_OpeningFcn, ...
                   'gui_OutputFcn',  @defPeaksObservados_OutputFcn, ...
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


% --- Executes just before defPeaksObservados is made visible.
function defPeaksObservados_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to defPeaksObservados (see VARARGIN)

% Choose default command line output for defPeaksObservados
%handles.output = hObject;

% Asigna valores de entrada a los textBox y a variables a nivel de handles,
% en caso de presionar Cancelar
if (nargin>3)
    %for i=1:nargin-2
    set(handles.txtPeaks,'String',num2str(varargin{1}));
    
    handles.output = [varargin{1}];
    %end
end

% Update handles structure
guidata(hObject, handles);

% Determine the position of the dialog - centered on the callback figure
% if available, else, centered on the screen
FigPos=get(0,'DefaultFigurePosition');
OldUnits = get(hObject, 'Units');
set(hObject, 'Units', 'pixels');
OldPos = get(hObject,'Position');
FigWidth = OldPos(3);
FigHeight = OldPos(4);
if isempty(gcbf)
    ScreenUnits=get(0,'Units');
    set(0,'Units','pixels');
    ScreenSize=get(0,'ScreenSize');
    set(0,'Units',ScreenUnits);

    FigPos(1)=1/2*(ScreenSize(3)-FigWidth);
    FigPos(2)=2/3*(ScreenSize(4)-FigHeight);
else
    GCBFOldUnits = get(gcbf,'Units');
    set(gcbf,'Units','pixels');
    GCBFPos = get(gcbf,'Position');
    set(gcbf,'Units',GCBFOldUnits);
    FigPos(1:2) = [(GCBFPos(1) + GCBFPos(3) / 2) - FigWidth / 2, ...
                   (GCBFPos(2) + GCBFPos(4) / 2) - FigHeight / 2];
end
FigPos(3:4)=[FigWidth FigHeight];
set(hObject, 'Position', FigPos);
set(hObject, 'Units', OldUnits);

set(handles.figure1,'WindowStyle','modal');
% UIWAIT makes defPeaksObservados wait for user response (see UIRESUME)

uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = defPeaksObservados_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output(1);


% The figure can be deleted now
delete(handles.figure1);

function txtPeaks_Callback(hObject, eventdata, handles)
% hObject    handle to txtPeaks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPeaks as text
%        str2double(get(hObject,'String')) returns contents of txtPeaks as a double


% --- Executes during object creation, after setting all properties.
function txtPeaks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPeaks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in btnAceptar.
function btnAceptar_Callback(hObject, eventdata, handles)
% hObject    handle to btnAceptar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.output=[str2num(get(handles.txtPeaks,'String'))];

%inicio = str2num(get(handles.txtPeaks,'String'));
%fin = str2num(get(handles.txtFin,'String'));
%filtro = str2num(get(handles.txtFiltro,'String'));

%handles.output = [inicio,fin,filtro];

% Update handles structure
guidata(hObject, handles);

% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);


% --- Executes on button press in btnCancelar.
function btnCancelar_Callback(hObject, eventdata, handles)
% hObject    handle to btnCancelar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%handles.output = [handles.Inicio,handles.Fin,handles.Filtro];

% Update handles structure
%guidata(hObject, handles);

% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);
