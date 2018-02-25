function varargout = marsmissiongui(varargin)
% MARSMISSIONGUI MATLAB code for marsmissiongui.fig
%      MARSMISSIONGUI, by itself, creates a new MARSMISSIONGUI or raises the existing
%      singleton*.
%
%      H = MARSMISSIONGUI returns the handle to a new MARSMISSIONGUI or the handle to
%      the existing singleton*.
%
%      MARSMISSIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MARSMISSIONGUI.M with the given input arguments.
%
%      MARSMISSIONGUI('Property','Value',...) creates a new MARSMISSIONGUI or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before marsmissiongui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to marsmissiongui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help marsmissiongui

% Last Modified by GUIDE v2.5 24-Feb-2018 14:24:37

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @marsmissiongui_OpeningFcn, ...
                   'gui_OutputFcn',  @marsmissiongui_OutputFcn, ...
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

% --- Executes just before marsmissiongui is made visible.
function marsmissiongui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to marsmissiongui (see VARARGIN)

% Choose default command line output for marsmissiongui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes marsmissiongui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = marsmissiongui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function timestep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timestep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timestep_Callback(hObject, eventdata, handles)
% hObject    handle to timestep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timestep as text
%        str2double(get(hObject,'String')) returns contents of timestep as a double
density = str2double(get(hObject, 'String'));
handles.control.dt=str2double(get(hObject, 'String'));
if isnan(density)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new timestep value
handles.metricdata.density = density;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function saveinterval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saveinterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function saveinterval_Callback(hObject, eventdata, handles)
% hObject    handle to saveinterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of saveinterval as text
%        str2double(get(hObject,'String')) returns contents of saveinterval as a double

% if isnan(volume)
%     set(hObject, 'String', 0);
%     errordlg('Input must be a number','Error');
% end
handles.control.saveinterval = str2int(get(hObject, 'String'));
%handles.control.saveinterval=str2double(get(hObject, 'String'));
% Save the new saveinterval value
handles.metricdata.volume = volume;
guidata(hObject,handles)

% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mass = handles.metricdata.density * handles.metricdata.volume;
set(handles.textvy, 'String', mass);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles, true);

% --- Executes when selected object changed in unitgroup.
function unitgroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.textactualtime, 'String', num2str(handles.state.time));
if (hObject == handles.earth)
    set(handles.textvx, 'String', num2str(handles.state.vxe/1000));
    set(handles.textvy, 'String', num2str(handles.state.vye/1000));
    set(handles.textx, 'String', num2str(handles.state.xe/1000));
    set(handles.texty, 'String', num2str(handles.state.ye/1000));
    set(handles.text4, 'String', 'lb/cu.in');
    set(handles.text5, 'String', 'cu.in');
    set(handles.text6, 'String', 'lb');
elseif (hObject == handles.moon)
        set(handles.textvx, 'String', num2str(handles.state.vxm/1000));
    set(handles.textvy, 'String', num2str(handles.state.vym/1000));
    set(handles.textx, 'String', num2str(handles.state.xm/1000));
    set(handles.texty, 'String', num2str(handles.state.ym/1000));
    set(handles.text4, 'String', 'kg/cu.m');
    set(handles.text5, 'String', 'cu.m');
    set(handles.text6, 'String', 'kg');
elseif (hObject == handles.rocket)
        set(handles.textvx, 'String', num2str(handles.state.vx/1000));
    set(handles.textvy, 'String', num2str(handles.state.vy/1000));
    set(handles.textx, 'String', num2str(handles.state.x/1000));
    set(handles.texty, 'String', num2str(handles.state.y/1000));
    set(handles.text4, 'String', 'kg/cu.m');
    set(handles.text5, 'String', 'cu.m');
    set(handles.text6, 'String', 'kg');
elseif (hObject == handles.mars)
        set(handles.textvx, 'String', num2str(handles.state.vxma/1000));
    set(handles.textvy, 'String', num2str(handles.state.vyma/1000));
    set(handles.textx, 'String', num2str(handles.state.xma/1000));
    set(handles.texty, 'String', num2str(handles.state.yma/1000));
    set(handles.text4, 'String', 'kg/cu.m');
    set(handles.text5, 'String', 'cu.m');
    set(handles.text6, 'String', 'kg');
elseif (hObject == handles.sun)
        set(handles.textvx, 'String', num2str(handles.state.vxs/1000));
    set(handles.textvy, 'String', num2str(handles.state.vys/1000));
    set(handles.textx, 'String', num2str(handles.state.xs/1000));
    set(handles.texty, 'String', num2str(handles.state.ys/1000));
    set(handles.text4, 'String', 'kg/cu.m');
    set(handles.text5, 'String', 'cu.m');
    set(handles.text6, 'String', 'kg');
end

% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

global statearray;
global stop_state;
global js;
stop_state=0;
statearray(1)=handles.state;
js=2; %first state is always saved
%stop_state=0;
%stop_state=0;
handles.metricdata.density = 0;
handles.metricdata.volume  = 0;

set(handles.timestep, 'String', handles.metricdata.density);
set(handles.saveinterval,  'String', handles.metricdata.volume);
set(handles.textvy, 'String', 0);

set(handles.unitgroup, 'SelectedObject', handles.earth);

set(handles.text4, 'String', 'lb/cu.in');
set(handles.text5, 'String', 'cu.in');
set(handles.text6, 'String', 'lb');

[state,const,control]=initmarsmission();
figh=startrocketgraphics(state); %returns handle to the graphics

handles.state=state;
handles.control=control;
%handles.control.dt=12;
handles.const=const;
handles.figh=figh;

% Update handles structure
guidata(handles.figure1, handles);


% --- Executes on button press in pushbutton3_Init.
function pushbutton3_Init_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3_Init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4_Load.
function pushbutton4_Load_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4_Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiopen('mat');
handles.control=control;
handles.state=state;
handles.const=const;
guidata(hObject,handles);

% --- Executes on button press in pushbutton5_InitGraphics.
function pushbutton5_InitGraphics_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5_InitGraphics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6_Run.
function pushbutton6_Run_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6_Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
simloop(hObject,eventdata,handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stop_state;

if stop_state
    stop_state=0;
    set(handles.pushbutton7, 'Value', 0);

else
    stop_state=1;
    set(handles.pushbutton7, 'Value', 1);
end

% if stop_state
%     stop_state=0;
% else
%     stop_state=1;
% end
guidata(hObject,handles);


function fx_Callback(hObject, eventdata, handles)
% hObject    handle to fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fx as text
%        str2double(get(hObject,'String')) returns contents of fx as a double
handles.control.fx = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function fx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fy_Callback(hObject, eventdata, handles)
% hObject    handle to fy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fy as text
%        str2double(get(hObject,'String')) returns contents of fy as a double
handles.control.fy = str2double(get(hObject, 'String'));
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function fy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function simloop(hObject,eventdata,handles)

% handles.simdata.time = 0;
% handles.simdata.theta = 0;
% handles.simdata.dt = 0.1;
% handles.simdata.radius = 1;
global stop_state;
global statearray;
global js;


for i=0:500000
    
    handles.state=updatestate(handles.state, handles.control, handles.const,handles.figh);
    handles.state.time=  handles.state.time+(control.dt/3600);
    if mod(i,handles.control.saveinterval)==0
        statearray(js)=handles.state;
        j=j+1;
        save('currentstate.mat','statearray');        
    end
    %handles.stop_state = get(handles.pushbutton7, 'Value');
    if stop_state
        stop_state=0;
        break;
    end
% % %     handles.simdata.theta=handles.simdata.theta+(2*pi)/250;
% % %     if handles.simdata.theta>(2*pi) 
% % %         handles.simdata.theta=0;   
% % %     end
% % %     handles.simdata.radius=handles.simdata.radius*exp(-handles.simdata.decay);
% % %     handles.simdata.xp=+4*handles.simdata.radius*cos(handles.simdata.theta);
% % %     handles.simdata.yp=+4*handles.simdata.radius*sin(handles.simdata.theta);
% % %     set(handles.hm,'XData',handles.simdata.xp);
% % %     set(handles.hm,'YData',handles.simdata.yp);
% % %       
% % %     drawnow;
% % %     %guidata(hObject, handles);
    guidata(hObject,handles)
end
%handles.simdata.radius=1.0;

guidata(hObject, handles);


% --- Executes on button press in pushbutton8savestate.
function pushbutton8savestate_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8savestate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
const=handles.const;
state=handles.state;
control=handles.control;
uisave({'const','control','state'},'marsmission.mat');
guidata(hObject,handles);
