function varargout = mmr_project(varargin)
% MMR_PROJECT M-file for mmr_project.fig
%      MMR_PROJECT, by itself, creates a new MMR_PROJECT or raises the existing
%      singleton*.
%
%      H = MMR_PROJECT returns the handle to a new MMR_PROJECT or the handle to
%      the existing singleton*.
%
%      MMR_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MMR_PROJECT.M with the given input arguments.
%
%      MMR_PROJECT('Property','Value',...) creates a new MMR_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ex1_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mmr_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mmr_project

% Last Modified by GUIDE v2.5 17-Dec-2014 11:45:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mmr_project_OpeningFcn, ...
                   'gui_OutputFcn',  @mmr_project_OutputFcn, ...
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
% --- Executes just before mmr_project is made visible.
function mmr_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
global reach
set(handles.Arm_length,'max' ,12 ,'min', 8 , 'value',8);
set(handles.lengthvalue, 'max',10, 'min', 4,'value' , 4);
reach= get(handles.Reach, 'Value');

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mmr_project (see VARARGIN)



% Choose default command line output for mmr_project
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% --- Outputs from this function are returned to the command line.
function varargout = mmr_project_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% initial configuration


xe=0; ye=0; phe=0;
global theta1 theta2 theta3 theta4 l e d1 d2 d3 d4 d 
global reach xe ye phe del1 del2 del3 del4 limit1 limit2 varx vary 
limit1 = 10;
limit2 = 25;
reach= get(handles.Reach,'Value');
del1=135; 
del2=225;
del3=315;
del4=45;
d=16; 
l= get(handles.Arm_length, 'Value');
e= get(handles.lengthvalue,'Value');
l2=num2str(l);
e2=num2str(e);
set(handles.slider_ap , 'string' , l2);
set(handles.slider_ee , 'string' , e2);
xe=0; ye=0; phe=0;
axis([-17 17 -17 17])
[varx,vary]=manu_disp_initial(); %Initial Display of the system

set(handles.slide_xe,'value',0); 
u1= get(handles.slide_xe,'Value');
set(handles.xe_disp, 'String',num2str(u1));
set(handles.slide_ye,'value',0);
u2=get(handles.slide_ye,'Value');
set(handles.ye_disp, 'String',num2str(u2));
set(handles.slide_phe,'value',0); 
u3=get(handles.slide_phe,'Value');
set(handles.phe_disp, 'String',num2str(u3));
set(handles.theta1_disp, 'string','45');
set(handles.theta2_disp, 'string',num2str(del2));
set(handles.theta3_disp, 'string',num2str(del3));



%Display End Effector Position and Angle

%Set the Display
set(handles.display_status,'string','Begin');
set(handles.slider_theta1,'Value',del1);
set(handles.slider_theta2,'Value',del2);
set(handles.slider_theta3,'Value',del3);
a1= get((handles.slider_theta1), 'Value');
a1_1= num2str(a1);
a2= get((handles.slider_theta2),'Value');
a2_2= num2str(a2);
a3= get((handles.slider_theta3), 'Value');
a3_3 = num2str(a3);
set(handles.theta1_disp, 'String','45');
set(handles.theta2_disp, 'String',a2);
set(handles.theta3_disp, 'String',a3);



function [varx,vary]= manu_disp_initial()
global del1 del2 del3 del4 xe ye phe d1 d2 d3 d4 d e r l
global reach
cla
x_a=e*cos(del3*pi/180);
y_a=e*sin(del3*pi/180);
x_b=e*cos(del4*pi/180); 
y_b=e*sin(del4*pi/180);
x_c=e*cos(del1*pi/180);
y_c=e*sin(del1*pi/180);
x_d=e*cos(del2*pi/180);
y_d=e*sin(del2*pi/180);
x_e =l*cos(del1*pi/180)+d; 
y_e =l*sin(del1*pi/180)-d;
x_f =l*cos(del2*pi/180)+d;
y_f =l*sin(del2*pi/180)+d;
x_g =l*cos(del3*pi/180)-d; 
y_g =l*sin(del3*pi/180)+d;
x_h =l*cos(del4*pi/180)-d; 
y_h =l*sin(del4*pi/180)-d;
D1 = (x_a)-(x_e);
D2 = (y_a)-(y_e);
D3 = (x_b)-(x_f);
D4 = (y_b) -(y_f);
D5 = (x_c)-(x_g);
D6 =(y_c)-(y_g);
D7 = (x_d)-(x_h);
D8 = (y_d)- (y_h);
%Prismatic Arm lengths
d1=((D1)^2+(D2)^2)^1/2;
d2=((D3)^2+(D4)^2)^1/2;
d3=((D5)^2+(D6)^2)^1/2;
d4=((D7)^2+(D8)^2)^1/2;
varx(1)=x_a; vary(1)=y_a;varx(2)=x_b;  
vary(2)=y_b;varx(3)=x_c; vary(3)= y_c; 
varx(4)= x_d; vary(4)=y_d;
varx(5)=x_e; vary(5)=y_e; varx(6)=x_f;  
vary(6)=y_f; varx(7)=x_g; vary(7)= y_g; 
varx(8)= x_h; vary(8)= y_h;
if reach==1
    man_disp_sp(varx,vary,xe,ye,phe);
else
man_disp(varx,vary,xe,ye,phe);
end

%
% --- Executes on slider movement.
function slider_theta1_Callback(hObject, eventdata, handles)

% --- Executes on slider movement.
function slider_theta2_Callback(hObject, eventdata, handles)
a1=get(handles.slider_theta2,'Value');
%a1=vpa(a1);
set(handles.theta2_disp,'String',num2str(a1))

% --- Executes on slider movement.
function slider_theta3_Callback(hObject, eventdata, handles)
a1=get(handles.slider_theta3,'Value');
set(handles.theta3_disp,'String',num2str(a1))
%
function slide_xe_Callback(hObject, eventdata, handles)
 a1=get(handles.slide_xe,'Value');
set(handles.xe_disp,'String',num2str(a1))

function slide_ye_Callback(hObject, eventdata, handles)
 a1=get(handles.slide_ye,'Value');
set(handles.ye_disp,'String',num2str(a1))

function slide_phe_Callback(hObject, eventdata, handles)
 a1=get(handles.slide_phe,'Value');
set(handles.phe_disp,'String',num2str(a1))
 
function [P,ab]=forward(theta1,theta2,theta3 ,x0)
global e del1 del2 del3 del4 d l reach
global d1 d2 d3 d4
global theta4 
a_1= [ 0 0 0 ];
a_2= [l l l];
x0 = [a_1 a_2];

x_e=d+l*cos(theta1*pi/180);         
y_e=-d+l*sin(theta1*pi/180);
x_f=d+l*cos(theta2*pi/180);         
y_f=d+l*sin(theta2*pi/180);
x_g=-d+l*cos(theta3*pi/180);         
y_g=d+l*sin(theta3*pi/180);
Eqn=@(x)[-x(1)+x_e+(x(4)+e)*cos(x(3)+(del1*pi/180));
         -x(2)+y_e+(x(4)+e)*sin(x(3)+(del1*pi/180));
         -x(1)+x_f+(x(5)+e)*cos(x(3)+(del2*pi/180));
         -x(2)+y_f+(x(5)+e)*sin(x(3)+(del2*pi/180));
         -x(1)+x_g+(x(6)+e)*cos(x(3)+(del3*pi/180));
         -x(2)+y_g+(x(6)+e)*sin(x(3)+(del3*pi/180))];
 options=optimset('MaxFunEvals',1000,'Display','On'); % Option to display output
 P = fsolve(Eqn,x0,options);
 xe=P(1); 
 ye=P(2); 
 phe=P(3);       
 d1=P(4); 
 d2=P(5);
 d3=P(6);
 
% To calculate d4 
 x_a=xe+cos((del3+phe)*pi/180)*e;
 x_b=xe+cos((del4+phe)*pi/180)*e;
 x_c=xe+cos((del1+phe)*pi/180)*e;
 y_a=ye+sin((del3+phe)*pi/180)*e;
 y_b=ye+sin((del4+phe)*pi/180)*e;
 y_c=ye+sin((del1+phe)*pi/180)*e;
 angle=(phe+del2)*pi/180;

val1 = -2*((-d-xe)*cos(angle)+(-d-ye)*sin(angle));
val2 =  ((-d-xe)^2+(-d-ye)^2-l^2);
syms x
y_d = (P(2)*2)-y_b;
solv_1 = solve(x^2+ val1*x +val2);
solv1= vpa(solv_1(2));
d4=solv1 -e ;
x_d = (P(1)*2)-x_b;  
x_h=xe+(d4+e)*cos(angle);
y_h=ye+(d4+e)*sin(angle);
x0=P;
if  d1>0 && d2>0 && d3>0 && d4>0 && d1<12 && d2<12 && d3<12 && d4 < 12  
    if (isreal(solv_1))
    angle123=atan((y_h +d),(x_h +d));
    if angle123 < 0
    theta4=(angle123+pi)*180/pi;
    else
    theta4=angle123*180/pi;
vary(2)=y_b; 
vary(1)=y_a; 
vary(3)=y_c;
vary(4)=y_d;
vary(5)=y_e;
vary(6)=y_f;
vary(7)= y_g;
vary(8)= y_h;
ab(1)=theta4; ab(2)=d4;P(4)=d1; P(5)=d2; P(6)=d3;
varx(1)=x_a; 
varx(2)=x_b;  
varx(3)=x_c; 
varx(4)= x_d; 
varx(5)=x_e; 
varx(6)=x_f;  
varx(7)=x_g; 
varx(8)= x_h; 

if reach==1
    man_disp_sp(varx,vary,xe,ye,phe);
else 
    man_disp(varx,vary,xe,ye,phe);
end
    end
    end
else
   ab=[];
   P=[];
end
%
function[P1,a2] = inverse(xe,ye,phe)
global theta1 theta2 theta3 theta4 e l d reach
global del1 del2 del3 del4 d1 d2 d3 d4
hold on 
axis([-17 17 -17 17])
delta1=(phe+del3)*pi/180; 
delta2=(phe+del4)*pi/180; 
delta3=(phe+del1)*pi/180; 
delta4=(phe+del2)*pi/180;
a= xe; b=ye; p = phe;
val1= ((d-xe)*cos(delta1)+(-d-ye)*sin(delta1))*(-2);
val2 = (-l^2+(d-xe)^2+(-d-ye)^2);
syms x;
solv1 = solve(x^2 + val1*x+val2) ;
d1=vpa((solv1(2))-e);
val3=((d-xe)*cos(delta2)+(d-ye)*sin(delta2))*(-2);
val4=(-l^2+(d-xe)^2+(d-ye)^2);
solv2 = solve(x^2 + val3*x+val4) ;
d2 =vpa(solv2(2))-e;
val5 =  ((-d-xe)*cos(delta3)+(d-ye)*sin(delta3))*(-2);
val6 = (-l^2+(-d-xe)^2+(d-ye)^2);
solv3 = solve(x^2 + val5*x+val6) ;
d3=vpa(solv3(2))-e;
val7 = ((-d-xe)*cos(delta4)+(-d-ye)*sin(delta4))*(-2);
val8 = (-l^2+(-d-xe)^2+(-d-ye)^2); 
solv4 = solve(x^2 + val7*x+val8) ;
d4=vpa(solv4(2))-e;
if  d1>0 && d2>0 && d3>0 && d4>0 && d1 < 12 && d2 < 12 &&...
    d3 < 12 && d4 < 12

x_e=xe+(d1+e)*cos(delta1);
y_e=ye+(d1+e)*sin(delta1);
x_f=xe+(d2+e)*cos(delta2);
y_f=ye+(d2+e)*sin(delta2);
x_g=xe+(d3+e)*cos(delta3);
y_g=ye+(d3+e)*sin(delta3);
x_h=xe+(d4+e)*cos(delta4);
y_h=ye+(d4+e)*sin(delta4);     
x_a=xe+e*cos(delta1);  
y_a=ye+e*sin(delta1);
x_b=xe+e*cos(delta2);  
y_b=ye+e*sin(delta2);
x_c=xe+e*cos(delta3);  
y_c=ye+e*sin(delta3);

ang1=atan((y_e+d),(x_e-d));
if ang1 > 0
    theta1=(ang1)*180/pi;
else
    theta1=(ang1+pi)*180/pi;
end
x_d=2*xe-x_b;
ang2=atan((y_f-d),(x_f-d));
if ang2 > 0
    theta2=(ang2)*180/pi;
else
    theta2=(ang2+pi)*180/pi;
end
ang3=atan((y_g-d),(x_g+d));
if ang3 > 0
    theta3=(ang3)*180/pi;
else
    theta3=(ang3+pi)*180/pi;
end
y_d=2*ye-y_b;
ang4=atan((y_h+ d),(x_h + d));
if ang4 > 0
theta4=(ang4)*180/pi;
else
theta4=(ang4+pi)*180/pi;
end
varx(1)=x_a; 
vary(1)=y_a;
varx(2)=x_b;  
vary(2)=y_b; 
varx(3)=x_c; 
vary(3)=y_c; 
varx(4)=x_d;  
vary(4)=y_d;
varx(5)=x_e; 
vary(5)=y_e; 
varx(6)=x_f;  
vary(6)=y_f; 
varx(7)=x_g; 
vary(7)=y_g; 
varx(8)=x_h; 
vary(8)=y_h;
P1(1) =d1;
P1(2) =d2;
P1(3) =d3;
P1(4) =d4;
a2(1)= theta1;
a2(2)= theta2;
a2(3)= theta3;
a2(4)= theta4;
time=0:1:5;
n= length(time);
if reach==1
    man_disp_sp(varx,vary,xe,ye,phe);
else 
    man_disp(varx,vary,xe,ye,phe);

end

else
P1=[];
a2=[];
end  

% --- Executes on button press in workspace.
function workspace_Callback(hObject, eventdata, handles)
set(handles.display_status,'string', 'Please wait...')
global l e d theta1 theta2 theta3 theta4 xe ye phe
global limit1 limit2
manu_disp_initial;
p=-limit2:10:limit2;
x=-limit1:2:limit1;
y=-limit1:2:limit1;
length1= length(x);
length2=length(p);

for i1 =1:length1
    for i2 =1:length1
        for i3 = 1:length2
            
            [test]= inverse1(x(i1),y(i2),p(i3));
            if(isempty(test))
                set(handles.display_status,'string', 'Done!')
            else    
                viscircles([x(i1),y(i2)],0.1,'edgecolor','b', 'linewidth',2);
                
                hold on
            end
        end
    end
end

        
    



function [P2]= inverse1(xe,ye,phe)
global del1 del2 del3 del4 d1 d2 d3 d4 d l e
 
hold on 
axis([-17 17 -17 17])
delta1=(phe+del3)*pi/180; 
delta2=(phe+del4)*pi/180; 
delta3=(phe+del1)*pi/180; 
delta4=(phe+del2)*pi/180;

a= xe; b=ye ;p = phe;
val1= ((d-xe)*cos(delta1)+(-d-ye)*sin(delta1))*(-2);
val2 = (-l^2+(d-xe)^2+(-d-ye)^2);
syms x;
solv1 = solve(x^2 + val1*x+val2) ;
d1=vpa((solv1(2))-e);
val3=((d-xe)*cos(delta2)+(d-ye)*sin(delta2))*(-2);
val4=(-l^2+(d-xe)^2+(d-ye)^2);
solv2 = solve(x^2 + val3*x+val4) ;
d2 =vpa(solv2(2))-e;
val5 =  ((-d-xe)*cos(delta3)+(d-ye)*sin(delta3))*(-2);
val6 = (-l^2+(-d-xe)^2+(d-ye)^2);
solv3 = solve(x^2 + val5*x+val6); 
d3=vpa(solv3(2))-e;
val7 = ((-d-xe)*cos(delta4)+(-d-ye)*sin(delta4))*(-2);
val8 = (-l^2+(-d-xe)^2+(-d-ye)^2); 
solv4 = solve(x^2 + val7*x+val8); 
d4=vpa(solv4(2))-e;
if  d1>0 && d2>0 && d3>0 && d4>0 && d1 < 12 && d2 < 12 && d3 < 12 &&...
    d4 < 12
r11= [delta1 delta2 delta3 delta4];
r12 =[d1 d2 d3 d4];
P2 = [r11 r12];
else
    P2= [];
end



% --- Executes during object creation, after setting all properties.
function theta1_text_CreateFcn(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function theta2_text_CreateFcn(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function theta3_text_CreateFcn(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function theta1_disp_CreateFcn(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function theta2_disp_CreateFcn(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function theta3_disp_CreateFcn(hObject, eventdata, handles)
%
function slider_theta1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider_theta2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider_theta3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%
% --- Executes during object creation, after setting all properties.
function slide_phe_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes during object creation, after setting all properties.
function slide_xe_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes during object creation, after setting all properties.
function slide_ye_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes during object creation, after setting all properties.

function reset_button_ButtonDownFcn(hObject, eventdata, handles)
%
function []=man_disp(varx,vary,xe,ye,phe)
global d

hold on
axis([-17 17 -17 17])
x_a=varx(1); y_a=vary(1);x_b=varx(2);  
y_b=vary(2);x_c=varx(3);   y_c=vary(3);  
x_d=varx(4);  y_d=vary(4);
x_e=varx(5); y_e=vary(5);x_f=varx(6);  
y_f=vary(6);x_g=varx(7);   y_g=vary(7);  x_h=varx(8);  
y_h=vary(8);

cla
line([d,x_e],[-d,y_e],'color','black', 'linewidth' , 2)
viscircles([x_e,y_e] ,0.5, 'EdgeColor', 'b', 'linewidth' , 2)
line([x_a,x_e],[y_a,y_e],'color','black', 'linewidth' , 3)
line([-d,x_h],[-d,y_h],'color','black', 'linewidth' , 2)
viscircles([x_h, y_h] ,0.5, 'EdgeColor', 'b' )
fill([x_a,x_b,x_c,x_d],[y_a,y_b,y_c,y_d], 'red')
line([d,x_f],[d,y_f],'color','black', 'linewidth' , 2)
viscircles([x_f, y_f] ,0.5, 'EdgeColor', 'b' )
line([x_b,x_f],[y_b,y_f],'color', 'black','linewidth',3)
line([-d,x_g],[d,y_g],'color', 'black','linewidth',2)
viscircles([x_g, y_g] ,0.5, 'EdgeColor', 'b' )
line([x_g,x_c],[y_g,y_c],'color', 'black','linewidth',3)
line([x_h,x_d],[y_h,y_d],'color', 'black','linewidth',3)
viscircles([x_g, y_g] ,0.5, 'EdgeColor', 'b' )

fill([d-1.5,d+1.5,d+1.5,d-1.5],[-d+1.5,-d+1.5,-d-1.5,-d-1.5], 'black')
fill([d-1.5,d+1.5,d+1.5,d-1.5],[d+1.5,d+1.5,d-1.5,d-1.5], 'black')
fill([-d-1.5,-d+1.5,-d+1.5,-d-1.5],[-d+1.5,-d+1.5,-d-1.5,-d-1.5], 'black')
fill([-d-1.5,-d+1.5,-d+1.5,-d-1.5],[d+1.5,d+1.5,d-1.5,d-1.5], 'black')
viscircles([d,d] ,0.5, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,-d] ,0.5, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,d] ,0.5, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,-d] ,0.5, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,d] ,1, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,-d] ,1, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,d] ,1, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,-d] ,1, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,d] ,1.2, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,-d] ,1.2, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,d] ,1.2, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,-d] ,1.2, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,d] ,0.8, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,-d] ,0.8, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,d] ,0.8, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,-d] ,0.8, 'EdgeColor', 'r', 'linewidth' , 2)



function []=man_disp_sp(varx,vary,xe,ye,phe)
global d

hold on
axis([-17 17 -17 17])
x_a=varx(1); y_a=vary(1);x_b=varx(2);  
y_b=vary(2);x_c=varx(3);   y_c=vary(3);  
x_d=varx(4);  y_d=vary(4);
x_e=varx(5); y_e=vary(5);x_f=varx(6);  
y_f=vary(6);x_g=varx(7);   y_g=vary(7);  x_h=varx(8);  
y_h=vary(8);


line([d,x_e],[-d,y_e],'color','black', 'linewidth' , 2)
viscircles([x_e,y_e] ,0.5, 'EdgeColor', 'b', 'linewidth' , 2)
line([x_a,x_e],[y_a,y_e],'color','black', 'linewidth' , 3)
line([-d,x_h],[-d,y_h],'color','black', 'linewidth' , 2)
viscircles([x_h, y_h] ,0.5, 'EdgeColor', 'b' )
fill([x_a,x_b,x_c,x_d],[y_a,y_b,y_c,y_d], 'red')
line([d,x_f],[d,y_f],'color','black', 'linewidth' , 2)
viscircles([x_f, y_f] ,0.5, 'EdgeColor', 'b' )
line([x_b,x_f],[y_b,y_f],'color', 'black','linewidth',3)
line([-d,x_g],[d,y_g],'color', 'black','linewidth',2)
viscircles([x_g, y_g] ,0.5, 'EdgeColor', 'b' )
line([x_g,x_c],[y_g,y_c],'color', 'black','linewidth',3)
line([x_h,x_d],[y_h,y_d],'color', 'black','linewidth',3)
viscircles([x_g, y_g] ,0.5, 'EdgeColor', 'b' )
fill([d-1.5,d+1.5,d+1.5,d-1.5],[-d+1.5,-d+1.5,-d-1.5,-d-1.5], 'black')
fill([d-1.5,d+1.5,d+1.5,d-1.5],[d+1.5,d+1.5,d-1.5,d-1.5], 'black')
fill([-d-1.5,-d+1.5,-d+1.5,-d-1.5],[-d+1.5,-d+1.5,-d-1.5,-d-1.5], 'black')
fill([-d-1.5,-d+1.5,-d+1.5,-d-1.5],[d+1.5,d+1.5,d-1.5,d-1.5], 'black')
viscircles([d,d] ,0.5, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,-d] ,0.5, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,d] ,0.5, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,-d] ,0.5, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,d] ,1, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,-d] ,1, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,d] ,1, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,-d] ,1, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,d] ,1.2, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,-d] ,1.2, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,d] ,1.2, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,-d] ,1.2, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,d] ,0.8, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,-d] ,0.8, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([-d,d] ,0.8, 'EdgeColor', 'r', 'linewidth' , 2)
viscircles([d,-d] ,0.8, 'EdgeColor', 'r', 'linewidth' , 2)



% --- Executes on button press in path_tracing_1.
function path_tracing_1_Callback(hObject, eventdata, handles)
global xe ye phe theta1 theta2 theta3 theta4
grid off
hold on
a11=get(handles.slide_xe,'Value');
a12=get(handles.slide_ye,'Value');
phe=get(handles.slide_phe,'Value');
axis([-17 17 -17 17])
set(handles.display_status,'string','Tracing Ellipse')
speed = get(handles.speed, 'value');
if speed==0;
    set(handles.display_status,'string','Increase the Speed!')
end
time=0:speed*2:360;
radius_a=3;
radius_b=0.6;
length1=length(time);
count =1 ; time_pause=0.0001;
for j=1:length1 
    hold on
    axis([-17 17 -17 17])
    xval(j)=a11+radius_a*cos(time(j)*pi/180);
    yval(j)=a12+radius_b*sin(time(j)*pi/180);
end
for j=1:length1
        pause(time_pause)
        hold on
        axis([-17 17 -17 17])
        xe=xval(j); ye=yval(j);
        inverse(xe,ye,phe)
        plot(xval,yval,'linewidth',1,'color' ,'yellow');      
        set(handles.slider_theta1,'Value',(vpa(theta4)));
        set(handles.slider_theta2,'Value',vpa(theta2)+180);
        set(handles.slider_theta3,'Value',vpa(theta3)+180);
        v1=get(handles.slider_theta1,'Value')
        v2=get(handles.slider_theta2,'Value')
        v3=get((handles.slider_theta3),'Value')
        v1=num2str((v1));
        v2= num2str(v2);
        v3= num2str(v3);
        set(handles.theta1_disp, 'String',v1);
        set(handles.theta2_disp, 'String',v2);
        set(handles.theta3_disp, 'String',v3);
        set(handles.xe_disp, 'String',num2str(xval(j))); 
        set(handles.ye_disp, 'String',num2str(yval(j)));
        set(handles.phe_disp, 'String',num2str(phe));
      
end





% --- Executes on slider movement.
function slider15_Callback(hObject, eventdata, handles)
% hObject    handle to slide_phe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slide_phe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider16_Callback(hObject, eventdata, handles)
% hObject    handle to slide_ye (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slide_ye (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider17_Callback(hObject, eventdata, handles)
% hObject    handle to slide_xe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slide_xe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in inverse_go.
function inverse_go_Callback(hObject, eventdata, handles)
% hObject    handle to inverse_go (see GCBO)
global e l d1 d2 d3 d4 theta1 theta2 theta3 theta4 
%global xe ye phe reach
global d1 d2 d3 d4   
set(handles.slider_theta1,'Value',theta1);
set(handles.slider_theta2,'Value',theta2);
set(handles.slider_theta3,'Value',theta3);
xe=get(handles.slide_xe,'Value'); 
set(handles.xe_disp, 'String',num2str(xe));
ye=get(handles.slide_ye,'Value'); 
set(handles.ye_disp, 'String',num2str(ye));
phe=get(handles.slide_phe,'Value'); 
set(handles.phe_disp, 'String',num2str(phe));
[P1,a_n]=inverse(xe,ye,phe);
if (isempty(P1))
    set(handles.display_status,'string',...
    'Oops!Configuration Not Possible(Limits Exceeded)')
else
set(handles.display_status,'string','Present Configuration Displayed')

val11= vpa(theta1+180) / 4 +12;
val22 = vpa(theta2);
val33= vpa(theta3);
sfkg = vpa( theta4);

set(handles.slider_theta1,'Value',val11);
set(handles.slider_theta2,'Value',val22+180);
set(handles.slider_theta3,'Value',val33+180);

xe=get(handles.slide_xe,'Value'); 
set(handles.xe_disp, 'String',num2str(xe));
ye=get(handles.slide_ye,'Value'); 
set(handles.ye_disp, 'String',num2str(ye));
phe=get(handles.slide_phe,'Value'); 
set(handles.phe_disp, 'String',num2str(phe));

end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in forward_go.
function forward_go_Callback(hObject, eventdata, handles)
% hObject    handle to forward_go (see GCBO)
global theta1 theta2 theta3 reach
global e theta4 xe ye phe d1 d2 d3 d4 l
REACH = reach;
theta1=get(handles.slider_theta1,'Value');
b1= num2str(theta1/4 +12);
set(handles.theta1_disp, 'String',b1);
theta2=get(handles.slider_theta2,'Value');
b2= num2str(theta2);
set(handles.theta2_disp, 'String',b2);
theta3=get(handles.slider_theta3,'Value'); 
b3= num2str(theta3);
set(handles.theta3_disp, 'String',b3);
x0 = [ 0 0 0 l l l];
[P,ab]=forward(theta1,theta2,theta3,x0);
if (isempty(P))
    set(handles.display_status,'string','Oops!Configuration not possible')
else
    set(handles.display_status,'string','Present Configuration Displayed')
xe=P(1); ye=P(2); phe=P(3); 
d1=P(4); d2=P(5); d3=P(6); 
theta4=ab(1); d4=ab(2);
set(handles.xe_disp,'string',num2str(xe));
set(handles.ye_disp,'string',num2str(ye));
set(handles.phe_disp,'string',num2str(phe));
set(handles.theta4_disp, 'string', num2str(vpa(theta4)))
end

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
speed1= get(handles.speed, 'value');
v1 = num2str(speed1);
set(handles.speed_disp,'string',v1)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in path_tracing_2.
function path_tracing_2_Callback(hObject, eventdata, handles)
% hObject    handle to path_tracing_2 (see GCBO)
global xe ye phe theta1 theta2 theta3  theta4
grid off
hold on
phe=get(handles.slide_phe,'Value');
a11=get(handles.slide_xe,'Value');
a12=get(handles.slide_ye,'Value');
radius=2;
axis([-17 17 -17 17])
set(handles.display_status,'string','Tracing Circle')
speed = get(handles.speed, 'value');
if speed==0;
    set(handles.display_status,'string','Increase the Speed!')
end
time=0:speed:360; 
length1=length(time);
time_pause= 0.00001;
count =1 ;
for j=1:length1 
    hold on
    axis([-17 17 -17 17])
    xval(j)=a11+radius*cos(time(j)*pi/180);
    yval(j)=a12+radius*sin(time(j)*pi/180);
end
for j=1:length1
       pause(time_pause)
       hold on
       axis([-17 17 -17 17])
       xe=xval(j); ye=yval(j);
       inverse(xe,ye,phe);hold on
       plot(xval,yval,'linewidth',1,'color' ,'yellow');
       set(handles.slider_theta1,'Value',(vpa(theta4)));
set(handles.slider_theta2,'Value',vpa(theta2)+180);
set(handles.slider_theta3,'Value',vpa(theta3)+180);
v1=get(handles.slider_theta1,'Value');
v2=get(handles.slider_theta2,'Value');
v3=get((handles.slider_theta3),'Value');
v1=num2str((v1));
v2= num2str(v2);
v3= num2str(v3);
set(handles.theta1_disp, 'String',v1);
set(handles.theta2_disp, 'String',v2);
set(handles.theta3_disp, 'String',v3);
set(handles.xe_disp, 'String',num2str(xval(j))); 
set(handles.ye_disp, 'String',num2str(yval(j)));
set(handles.phe_disp, 'String',num2str(phe));

       
end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in path_tracing_3.
function path_tracing_3_Callback(hObject, eventdata, handles)
% hObject    handle to path_tracing_3 (see GCBO)
global xe ye phe theta1 theta2 theta3 theta4
grid off
hold on
axis([-17 17 -17 17])
set(handles.display_status,'string','Tracing Square')
speed = get(handles.speed, 'value');
if speed==0;
    set(handles.display_status,'string','Increase the Speed!')
end    
phe=get(handles.slide_phe,'Value');
a11=get(handles.slide_xe,'Value');
a12=get(handles.slide_ye,'Value');
tx1=0:-speed/30:-2; ty1=0; 
tx2=-2;ty2=0:speed/30:2;
tx3=-2:speed/30:2,ty3=2;
tx4=2,ty4=2:-speed/30:-2;
tx5=2:-speed/30:-2,ty5=-2;
tx6=-2,ty6=-2:speed/30:2;
length1=length(tx1);
time_pause= 0.0001;
count =1 ;
for j=1:length1 
    hold on
    axis([-17 17 -17 17])
    xval(j)=tx1(j);
    yval(j)=0;
end
for j=1:length1
       pause(time_pause)
       hold on
       axis([-17 17 -17 17])
       xe=xval(j)+a11; 
       ye=yval(j)+a12;
       inverse(xe,ye,phe);
       hold on
       plot(xval,yval,'linewidth',1,'color' ,'yellow');
       set(handles.slider_theta1,'Value',(vpa(theta4)));
set(handles.slider_theta2,'Value',vpa(theta2)+180);
set(handles.slider_theta3,'Value',vpa(theta3)+180);
v1=get(handles.slider_theta1,'Value');
v2=get(handles.slider_theta2,'Value');
v3=get((handles.slider_theta3),'Value');
v1=num2str((v1));
v2= num2str(v2);
v3= num2str(v3);
set(handles.theta1_disp, 'String',v1);
set(handles.theta2_disp, 'String',v2);
set(handles.theta3_disp, 'String',v3);
set(handles.xe_disp, 'String',num2str(xval(j))); 
set(handles.ye_disp, 'String',num2str(yval(j)));
set(handles.phe_disp, 'String',num2str(phe));

        
end
length2=length(ty2);
xval=zeros(length1,1); yval=zeros(length1,1);
for j=1:length2 
    hold on
    axis([-17 17 -17 17])
    xval(j)=tx2;
    yval(j)=ty2(j);
end
for j=1:length2
     pause(time_pause)
     hold on
     axis([-17 17 -17 17])
     xe=xval(j); 
     ye=yval(j);
     inverse(xe,ye,phe);
     hold on
     plot(xval,yval,'linewidth',1,'color' ,'yellow');
     set(handles.slider_theta1,'Value',(vpa(theta4)));
set(handles.slider_theta2,'Value',vpa(theta2)+180);
set(handles.slider_theta3,'Value',vpa(theta3)+180);
v1=get(handles.slider_theta1,'Value');
v2=get(handles.slider_theta2,'Value');
v3=get((handles.slider_theta3),'Value');
v1=num2str((v1));
v2= num2str(v2);
v3= num2str(v3);
set(handles.theta1_disp, 'String',v1);
set(handles.theta2_disp, 'String',v2);
set(handles.theta3_disp, 'String',v3);
set(handles.xe_disp, 'String',num2str(xval(j))); 
set(handles.ye_disp, 'String',num2str(yval(j)));
set(handles.phe_disp, 'String',num2str(phe));

      
end
length3=length(tx3);
xval=zeros(length1,1); yval=zeros(length1,1);
for j=1:length3 
    hold on
    axis([-17 17 -17 17])
    xval(j)=tx3(j);
    yval(j)=ty3;
end
for j=1:length3
       pause(time_pause)
       hold on
       axis([-17 17 -17 17])
       xe=xval(j); 
       ye=yval(j);
       inverse(xe,ye,phe);
       hold on
       plot(xval,yval,'linewidth',1,'color' ,'yellow');
       set(handles.slider_theta1,'Value',(vpa(theta4)));
set(handles.slider_theta2,'Value',vpa(theta2)+180);
set(handles.slider_theta3,'Value',vpa(theta3)+180);
v1=get(handles.slider_theta1,'Value');
v2=get(handles.slider_theta2,'Value');
v3=get((handles.slider_theta3),'Value');
v1=num2str((v1));
v2= num2str(v2);
v3= num2str(v3);
set(handles.theta1_disp, 'String',v1);
set(handles.theta2_disp, 'String',v2);
set(handles.theta3_disp, 'String',v3);
set(handles.xe_disp, 'String',num2str(xval(j))); 
set(handles.ye_disp, 'String',num2str(yval(j)));
set(handles.phe_disp, 'String',num2str(phe));

end

length4=length(ty4);
xval=zeros(length1,1); yval=zeros(length1,1);
for j=1:length4 
    hold on
    axis([-17 17 -17 17])
    xval(j)=tx4;
    yval(j)=ty4(j);
end
for j=1:length4
       pause(time_pause)
       hold on
       axis([-17 17 -17 17])
       xe=xval(j); 
       ye=yval(j);
       inverse(xe,ye,phe);
       hold on
       plot(xval,yval,'linewidth',1,'color' ,'yellow');     
       set(handles.slider_theta1,'Value',(vpa(theta4)));
set(handles.slider_theta2,'Value',vpa(theta2)+180);
set(handles.slider_theta3,'Value',vpa(theta3)+180);
v1=get(handles.slider_theta1,'Value');
v2=get(handles.slider_theta2,'Value');
v3=get((handles.slider_theta3),'Value');
v1=num2str((v1));
v2= num2str(v2);
v3= num2str(v3);
set(handles.theta1_disp, 'String',v1);
set(handles.theta2_disp, 'String',v2);
set(handles.theta3_disp, 'String',v3);
set(handles.xe_disp, 'String',num2str(xval(j))); 
set(handles.ye_disp, 'String',num2str(yval(j)));
set(handles.phe_disp, 'String',num2str(phe));

end

length5=length(tx5);
xval=zeros(length5,1); yval=zeros(length5,1);
for j=1:length5 
    hold on
    axis([-17 17 -17 17])
    xval(j)=tx5(j);
    yval(j)=ty5;
end
for j=1:length5
       pause(time_pause)
       hold on
       axis([-17 17 -17 17])
       xe=xval(j); 
       ye=yval(j);
       inverse(xe,ye,phe);
       hold on
       plot(xval,yval,'linewidth',1,'color' ,'yellow');  
       set(handles.slider_theta1,'Value',(vpa(theta4)));
set(handles.slider_theta2,'Value',vpa(theta2)+180);
set(handles.slider_theta3,'Value',vpa(theta3)+180);
v1=get(handles.slider_theta1,'Value');
v2=get(handles.slider_theta2,'Value');
v3=get((handles.slider_theta3),'Value');
v1=num2str((v1));
v2= num2str(v2);
v3= num2str(v3);
set(handles.theta1_disp, 'String',v1);
set(handles.theta2_disp, 'String',v2);
set(handles.theta3_disp, 'String',v3);
set(handles.xe_disp, 'String',num2str(xval(j))); 
set(handles.ye_disp, 'String',num2str(yval(j)));
set(handles.phe_disp, 'String',num2str(phe));

end


length6=length(ty6);
xval=zeros(length6,1); yval=zeros(length6,1);
for j=1:length6 
    hold on
    axis([-17 17 -17 17])
    xval(j)=tx6;
    yval(j)=ty6(j);
end
for j=1:length6
       pause(time_pause)
       hold on
       axis([-17 17 -17 17])
       xe=xval(j); 
       ye=yval(j);
       inverse(xe,ye,phe);hold on
       plot(xval,yval,'linewidth',1,'color' ,'yellow');    
       set(handles.slider_theta1,'Value',(vpa(theta4)));
set(handles.slider_theta2,'Value',vpa(theta2)+180);
set(handles.slider_theta3,'Value',vpa(theta3)+180);
v1=get(handles.slider_theta1,'Value');
v2=get(handles.slider_theta2,'Value');
v3=get((handles.slider_theta3),'Value');
v1=num2str((v1));
v2= num2str(v2);
v3= num2str(v3);
set(handles.theta1_disp, 'String',v1);
set(handles.theta2_disp, 'String',v2);
set(handles.theta3_disp, 'String',v3);
set(handles.xe_disp, 'String',num2str(xval(j))); 
set(handles.ye_disp, 'String',num2str(yval(j)));
set(handles.phe_disp, 'String',num2str(phe));

end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function lengthvalue_Callback(hObject, eventdata, handles)
% hObject    handle to lengthvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a1=get(handles.lengthvalue,'Value');
set(handles.slider_ee,'String',num2str(a1))


% --- Executes during object creation, after setting all properties.
function lengthvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lengthvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on inverse_go and none of its controls.
function inverse_go_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to inverse_go (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function Arm_length_Callback(hObject, eventdata, handles)
% hObject    handle to Arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a1=get(handles.Arm_length,'Value');
set(handles.slider_ap,'String',num2str(a1))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Arm_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cursor_callback.
function cursor_callback_Callback(hObject, eventdata, handles)
% hObject    handle to cursor_callback (see GCBO)

global theta1 theta2 theta3 theta4
global xe ye phe
[x,y] = ginput(1);
[P1,a_n]=inverse(x,y,0);
if (isempty(P1))
    set(handles.display_status,'string',...
    'Outside Limits')
else
    set(handles.display_status,'string','Present Configuration Displayed')
    
set(handles.slider_theta1,'Value',(vpa(theta4)));
set(handles.slider_theta2,'Value',vpa(theta2)+180);
set(handles.slider_theta3,'Value',vpa(theta3)+180);
v1=get(handles.slider_theta1,'Value')
v2=get(handles.slider_theta2,'Value')
v3=get((handles.slider_theta3),'Value')
v1=num2str((v1));
v2= num2str(v2);
v3= num2str(v3);
set(handles.theta1_disp, 'String',v1);
set(handles.theta2_disp, 'String',v2);
set(handles.theta3_disp, 'String',v3);
set(handles.xe_disp, 'String',num2str(x)); 
set(handles.ye_disp, 'String',num2str(y));
set(handles.phe_disp, 'String',num2str(0));

end



% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Reach.
function Reach_Callback(hObject, eventdata, handles)
% hObject    handle to Reach (see GCBO)
global reach
reach =get(handles.Reach,'Value');
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reach


% --- Executes on button press in rotate.
function rotate_Callback(hObject, eventdata, handles)
% hObject    handle to rotate (see GCBO)
global xe ye phe theta1 theta2 theta3 theta4
speed = get(handles.speed, 'value');
p=0:2:360;

length1=length(p);

for i=1:length1
    [P1,a_1] =inverse(0,0,p(i));
    pause(0.01);
    if (isempty(P1))
    set(handles.display_status,'string','Done!')
    else
    set(handles.display_status,'string','Displaying...')
    set(handles.slider_theta1,'Value',(vpa(theta4)));
    set(handles.slider_theta2,'Value',vpa(theta2)+180);
    set(handles.slider_theta3,'Value',vpa(theta3)+180);
    v1=get(handles.slider_theta1,'Value');
    v2=get(handles.slider_theta2,'Value');
    v3=get((handles.slider_theta3),'Value');
    v1=num2str((v1));
    v2= num2str(v2);
    v3= num2str(v3);
    set(handles.theta1_disp, 'String',v1);
    set(handles.theta2_disp, 'String',v2);
    set(handles.theta3_disp, 'String',v3);
    set(handles.xe_disp, 'String',num2str(0)); 
    set(handles.ye_disp, 'String',num2str(0));
    set(handles.phe_disp, 'String',num2str(p(i)));
    end
end
 


    

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in workspace1.
function workspace1_Callback(hObject, eventdata, handles)


set(handles.display_status,'string', 'Please Wait...!')
global l e d theta1 theta2 theta3 theta4 xe ye phe
manu_disp_initial;
set(handles.display_status,'string', 'Please wait...')
global l e d theta1 theta2 theta3 theta4 xe ye phe
global limit1 limit2
manu_disp_initial;
p=-limit2:5:limit2;
x=-limit1:1:limit1;
y=-limit1:1:limit1;
length1= length(x);
%length2=length(p)
%x=-10:1:10;
%y=-10:1:10;
%length1= length(x)

phi=get(handles.slider22,'Value');
for i1 =1:length1
    for i2 =1:length1
        
            
            [test1]= inverse1(x(i1),y(i2),phi);
            if(isempty(test1))
                set(handles.display_status,'string', 'Done!')
            else    
                viscircles([x(i1),y(i2)],0.1,'edgecolor','b', 'linewidth',2);
                
                hold on
        
        end
    end
end

        
    

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider22_Callback(hObject, eventdata, handles)
% hObject    handle to slider22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a1=get(handles.slider22,'Value');
set(handles.text78,'String',num2str(a1))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
