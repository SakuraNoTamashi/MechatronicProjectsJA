function varargout = Slider(varargin)
% SLIDER MATLAB code for Slider.fig
%      SLIDER, by itself, creates a new SLIDER or raises the existing
%      singleton*.
%
%      H = SLIDER returns the handle to a new SLIDER or the handle to
%      the existing singleton*.
%
%      SLIDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLIDER.M with the given input arguments.
%
%      SLIDER('Property','Value',...) creates a new SLIDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Slider_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Slider_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Slider

% Last Modified by GUIDE v2.5 04-Oct-2019 18:52:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Slider_OpeningFcn, ...
                   'gui_OutputFcn',  @Slider_OutputFcn, ...
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


% --- Executes just before Slider is made visible.
function Slider_OpeningFcn(hObject, eventdata, handles, varargin)
%Definimos las características de los tres sliders:
    %'Min' es el valor mínimo que puede tomar el slider
    %'Max' es el valor máximo que puede tomar el slider
    %'Value' es el valor actual del slider. Debe estar entre Min y Max
    %SliderStep es un vector de dos posiciones:
        %La 1era representa el avance si hacemos clic en los extremos
        %La 2da representa el avance si hacemos clic dentro del slider
        
set(handles.R,'Min',0,'Max',1,'Value',0,'SliderStep',[0.01,0.1]);
set(handles.G,'Min',0,'Max',1,'Value',0,'SliderStep',[0.01,0.1]);
set(handles.B,'Min',0,'Max',1,'Value',0,'SliderStep',[0.01,0.1]);

%Creamos tres campos nuevos donde se almacenarán los valores de los sliders
handles.r=get(handles.R,'Value'); %Campo para el color rojo del RGB
handles.g=get(handles.G,'Value'); %Campo para el color verde del RGB
handles.b=get(handles.B,'Value'); %Campo para el color azul del RGB

set(handles.Color,'BackgroundColor',[handles.r handles.g handles.b]); %Coloreamos el cuadro de texto con los valores iniciales
set(handles.R2,'String',handles.r); %Imprimimos el valor del slider rojo
set(handles.G2,'String',handles.g); %Imprimimos el valor del slider verde
set(handles.B2,'String',handles.b); %Imprimimos el valor del slider azul

% Choose default command line output for Slider
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Slider wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Slider_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Se ejecuta al mover el slider R.
function R_Callback(hObject, eventdata, handles)
RValue = get(handles.R,'Value'); %Obtenemos el nuevo valor del slider rojo
set(handles.Color,'BackgroundColor',[RValue handles.g handles.b]); %Recoloreamos el cuadro de texto
set(handles.R,'BackgroundColor',[RValue 0 0]); %Coloreamos el slider rojo
num2str(set(handles.R2,'String',RValue)); %Imprimimos el valor del slider 
handles.r=RValue; %Actualizamos el campo rojo
guidata(hObject,handles); %Actualizamos la estructura de la interfaz

% --- Executes during object creation, after setting all properties.
function R_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function G_Callback(hObject, eventdata, handles)

GValue = get(handles.G,'Value');  %Obtenemos el nuevo valor del slider verde
set(handles.Color,'BackgroundColor',[handles.r GValue handles.b]); %Recoloreamos el cuadro de texto
set(handles.G,'BackgroundColor',[0 GValue 0]); %Coloreamos el slider verde
num2str(set(handles.G2,'String',GValue)); %Imprimimos el valor del slider 
handles.g=GValue; %Actualizamos el campo verde
guidata(hObject,handles); %Actualizamos la estructura de la interfaz

% --- Executes during object creation, after setting all properties.
function G_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function B_Callback(hObject, eventdata, handles)

BValue = get(handles.B,'Value'); %Obtenemos el nuevo valor del slider azul
set(handles.Color,'BackgroundColor',[handles.r handles.g BValue]); %Recoloreamos el cuadro de texto
set(handles.B,'BackgroundColor',[0 0 BValue]); %Coloreamos el slider azul
num2str(set(handles.B2,'String',BValue)); %Imprimimos el valor del slider 
handles.b=BValue;  %Actualizamos el campo azul
guidata(hObject,handles); %Actualizamos la estructura de la interfaz

% --- Executes during object creation, after setting all properties.
function B_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
