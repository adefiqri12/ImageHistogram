function varargout = programKonversi(varargin)
% PROGRAMKONVERSI MATLAB code for programKonversi.fig
%      PROGRAMKONVERSI, by itself, creates a new PROGRAMKONVERSI or raises the existing
%      singleton*.
%
%      H = PROGRAMKONVERSI returns the handle to a new PROGRAMKONVERSI or the handle to
%      the existing singleton*.
%
%      PROGRAMKONVERSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGRAMKONVERSI.M with the given input arguments.
%
%      PROGRAMKONVERSI('Property','Value',...) creates a new PROGRAMKONVERSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before programKonversi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to programKonversi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help programKonversi

% Last Modified by GUIDE v2.5 13-Sep-2021 23:22:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @programKonversi_OpeningFcn, ...
                   'gui_OutputFcn',  @programKonversi_OutputFcn, ...
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


% --- Executes just before programKonversi is made visible.
function programKonversi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to programKonversi (see VARARGIN)

% Choose default command line output for programKonversi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes programKonversi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = programKonversi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.*'});
 
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    info = imfinfo(fullfile(pathname,filename));
    bitdepth = info.BitDepth;
    if bitdepth ==24
        axes(handles.axes1)
        imshow(Img)
        set(handles.popupmenu1,'enable','on')
        set(handles.popupmenu1,'Value',1)
    else
        errordlg('Image must be RGB','File Error');
    end
else
    return
end

handles.Img = Img;
guidata(hObject, handles);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
Img = handles.Img;
val = get(hObject,'Value');
 
switch val
    case 1
        cla(handles.axes2);
        cla(handles.axes5);
        cla(handles.axes3);
        cla(handles.axes8);
        cla(handles.axes4);
        cla(handles.axes9);
    case 2
        axes(handles.axes1);
        imshow(Img);
        
        R = Img(:,:,1);
        axes(handles.axes2);
        imshow(R);
        axes(handles.axes5);
        imhist(R);
        
        G = Img(:,:,2);
        axes(handles.axes3);
        imshow(G);
        axes(handles.axes8);
        imhist(G);
        
        B = Img(:,:,3);
        axes(handles.axes4);
        imshow(B);
        axes(handles.axes9);
        imhist(B);

    case 3
        gray = rgb2gray(Img);
        axes(handles.axes1);
        imshow(gray);
        
        kanal1 = gray(:,:,1);
        axes(handles.axes2);
        imshow(kanal1);
        axes(handles.axes5);
        imhist(kanal1);
        
        cla(handles.axes3);
        cla(handles.axes8);
        cla(handles.axes4);
        cla(handles.axes9);
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


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
