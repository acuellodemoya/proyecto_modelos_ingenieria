function varargout = proyecto_modelos(varargin)
% PROYECTO_MODELOS MATLAB code for proyecto_modelos.fig
%      PROYECTO_MODELOS, by itself, creates a new PROYECTO_MODELOS or raises the existing
%      singleton*.
%
%      H = PROYECTO_MODELOS returns the handle to a new PROYECTO_MODELOS or the handle to
%      the existing singleton*.
%
%      PROYECTO_MODELOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROYECTO_MODELOS.M with the given input arguments.
%
%      PROYECTO_MODELOS('Property','Value',...) creates a new PROYECTO_MODELOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proyecto_modelos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proyecto_modelos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proyecto_modelos

% Last Modified by GUIDE v2.5 20-May-2020 12:21:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proyecto_modelos_OpeningFcn, ...
                   'gui_OutputFcn',  @proyecto_modelos_OutputFcn, ...
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


% --- Executes just before proyecto_modelos is made visible.
function proyecto_modelos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to proyecto_modelos (see VARARGIN)

% Choose default command line output for proyecto_modelos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes proyecto_modelos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = proyecto_modelos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_punto_1_1.
function btn_punto_1_1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_punto_1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
