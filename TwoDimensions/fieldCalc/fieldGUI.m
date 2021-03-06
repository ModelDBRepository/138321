function varargout = fieldGUI(varargin)
% FIELDGUI M-file for fieldGUI.fig
%      FIELDGUI, by itself, creates a new FIELDGUI or raises the existing
%      singleton*.
%
%      H = FIELDGUI returns the handle to a new FIELDGUI or the handle to
%      the existing singleton*.
%
%      FIELDGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIELDGUI.M with the given input arguments.
%
%      FIELDGUI('Property','Value',...) creates a new FIELDGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fieldGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fieldGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fieldGUI

% Last Modified by GUIDE v2.5 05-Apr-2009 10:27:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fieldGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @fieldGUI_OutputFcn, ...
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


% --- Executes just before fieldGUI is made visible.
function fieldGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fieldGUI (see VARARGIN)

% Choose default command line output for fieldGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fieldGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fieldGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function r_Callback(hObject, eventdata, handles)
a=str2double(get(handles.r,'String'));
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of r as text
%        str2double(get(hObject,'String')) returns contents of r as a double


% --- Executes during object creation, after setting all properties.
function r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_Callback(hObject, eventdata, handles)
n=str2double(get(handles.n,'String'));

% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z_Callback(hObject, eventdata, handles)
z=str2double(get(handles.z,'String'));

% hObject    handle to z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z as text
%        str2double(get(hObject,'String')) returns contents of z as a double


% --- Executes during object creation, after setting all properties.
function z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calc.
function calc_Callback(hObject, eventdata, handles)

y=0.0119:1e-6:0.0159; 
x=0.0119:1e-6:0.0159; 

Ex=zeros(length(x),length(y));
Ey=zeros(length(x),length(y));
theta=atan2(y,x);
a=str2double(get(handles.r,'String')); %[m]
n=str2double(get(handles.n,'String'));
mio=4*pi*1e-4;      % [v][msec]/[A][m]
z=str2double(get(handles.z,'String')); %[m]

for i=1:1:length(x)
        for j=1:1:length(y)
            r=sqrt((x(i)^2+y(j)^2));  %[m]
            m=4*a.*r./((a+r).^2+z^2);  % no units , m=k^2
            [K,E] = ellipke(m);
            A=mio*n*(a/r)^(0.5)*(K*(1-0.5*m)-E)/(pi*sqrt(m)); %[v][msec]/[A][m]
            Ey(i,j)=-cos(atan2(y(j),x(i))+pi/2)*A; %[v][msec]/[A][m]
            Ex(i,j)=sin(atan2(y(j),x(i))+pi/2)*A; %[v][msec]/[A][m]
        end
end

axes(handles.axes1);
imagesc(x,y,Ex)
title('Ex')
xlabel('x')
ylabel('y')
colorbar
axes(handles.axes2);
imagesc(x,y,Ey)
title('Ey')
xlabel('x')
ylabel('y')
colorbar
dlmwrite('ex.txt', Ex, ' ')
dlmwrite('ey.txt', Ey, ' ')


% hObject    handle to calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure_CreateFcn(hObject, eventdata, handles)

% hObject    handle to figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate figure


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
%dlmwrite('ex.txt', Ex, ' ')
%dlmwrite('ey.txt', Ey, ' ')
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


