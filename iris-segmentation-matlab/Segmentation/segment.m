function varargout = segment(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @segment_OpeningFcn, ...
                   'gui_OutputFcn',  @segment_OutputFcn, ...
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


% --- Executes just before segment is made visible.
function segment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to segment (see VARARGIN)

% Choose default command line output for segment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes segment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = segment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname]= uigetfile({'*.*'},'All Files');
fullname=strcat(pathname,filename);
%display(eyeimage_filename);
I= imread(fullname);
handles.filename=fullname;
guidata(hObject,handles)
imshow(I,"Parent",handles.axesoriginal);

function model1btn_Callback(hObject, eventdata, handles)
filename=handles.filename;
[I1 x y r xp yp rp]=createiristemplateagain(filename);
handles.x=x;
handles.y=y;
handles.r=r;
handles.xp=xp;
handles.yp=yp;
handles.rp=rp;
handles.I1=I1;
guidata(hObject,handles)
imshow(I1,"Parent",handles.axes2);
% --- Executes on button press in model2btn.
function model2btn_Callback(hObject, eventdata, handles)
% hObject    handle to model2btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=handles.x;
y=handles.y;
r=handles.r;
xp=handles.xp;
yp=handles.yp;
rp=handles.rp;
I1=handles.I1;
I2=model2outputagain(I1,x,y,r,xp,yp,rp);
imshow(I2,"Parent",handles.axes3)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2

function axesoriginal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2