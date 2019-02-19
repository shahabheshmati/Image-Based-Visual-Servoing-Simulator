clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%% Initialing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Zflag=1;           % 1 = with z,, 0 = z desired 
PPC_control_flag=0;  % PPIBVS or simple IBVS?? 1=PP , 0= conventional
KIB=1;   % gain for simple image based
KPPt=10; % gain for PPIBVS
t = 0;  %initialization of time
dplot=t; % plot step
tloop=500; % time of simulation
ubound=0.2; % velocity saturation for translation 
wbound=0.2; %  saturation for angular velocities 
dt = 0.033; %sampling time
control=zeros(1,6)';
umax=0.5; 
vmax=0.38;
%% Camera position in the 3D space

%3.1) Actual Camera (initial position)
ang_x=-0.4;%20*pi/180;
ang_y=-0.0;%-10*pi/180;
ang_z=-0.33;%10*pi/180;
ta=[-1.37 1.3 -0.00]';

Ha = transl(ta(1,1),ta(2,1),ta(3,1))*rpy2tr(ang_z,ang_y,ang_x,'zyx');
xxx=ta(1,1);
yy=ta(2,1);
zz=ta(3,1);

%3.2) Desired Camera (target position)
Rd=rotoz(0)*rotoy(0)*rotox(0);
td=[-0.4 0 0]';
Hd = transl(td(1,1),td(2,1),td(3,1))*rpy2tr(0,0,0,'zyx');

%%
% feature coordinates in 3D space (the inertial frame is located at the object center)
Pointt=[0,   0 ,    0   ,0;
0.1, -0.1,  0.1 ,-0.1;
0.1  ,0.1,  -0.1 ,-0.1];

% 2) Internal Camera parameters
lamda=1;
u0=0;
v0=0;
Ka=[lamda 0 u0;
0 lamda v0;
0 0  1];
Kd=Ka;


Raa=rotoz(-pi/2)*rotoy(0)*rotox(-pi/2);
rr=[Raa(1,1:3),0;
Raa(2,1:3),0;
Raa(3,1:3),0;
0,0,0,1];



%%      
%4) Plot of cameras and 3D space
figure(1);     
hold on; grid on; 
axis([-1.6 0.3 -0.2 1.4  -0.4 0.3])
axis equal; 
set(gca, 'Zdir', 'reverse', 'Xdir','reverse');
trplot(rotoz(0)*rotoy(0)*rotox(0),'color','k')
plotcamera([ta(1,1),ta(2,1),ta(3,1),ang_x,ang_y,ang_z]);
plotcamera_des([td(1,1),td(2,1),td(3,1),0,0,0]);
f_3Dwfenum(Pointt);
f_scenepnt(Pointt(:,1),'r*',1);
f_scenepnt(Pointt(:,2),'g*',1);
f_scenepnt(Pointt(:,3),'b*',1);
f_scenepnt(Pointt(:,4),'m*',1);
line([Pointt(1,1) Pointt(1,2)],[Pointt(2,1) Pointt(2,2)],[Pointt(3,1) Pointt(3,2)],'Color','k','LineWidth',1.2)
line([Pointt(1,1) Pointt(1,3)],[Pointt(2,1) Pointt(2,3)],[Pointt(3,1) Pointt(3,3)],'Color','k','LineWidth',1.2)
line([Pointt(1,3) Pointt(1,4)],[Pointt(2,3) Pointt(2,4)],[Pointt(3,3) Pointt(3,4)],'Color','k','LineWidth',1.2)
line([Pointt(1,4) Pointt(1,2)],[Pointt(2,4) Pointt(2,2)],[Pointt(3,4) Pointt(3,2)],'Color','k','LineWidth',1.2)
view(80,30)
hold off
%%

%6) Perspective Projection of Scene points
[ud,vd]=f_perspproj(Pointt,Hd*rr,Kd);
[ua,va]=f_perspproj(Pointt,Ha*rr,Ka);

Ud=[ud;
vd];
Ua=[ua;
va];

%%
figure(2) %image plane plot

grid on
hold on
box on
xlabel('u', 'FontSize',15)
ylabel('v', 'FontSize',15)
title('Image Plane')
axis([-0.6*1000 0.6*1000 -0.45*1000 0.45*1000])
plot(-ua(1,1)*1000,va(1,1)*1000,'r.' ,'markersize', 20)
plot(-ua(1,2)*1000,va(1,2)*1000,'g.','markersize', 20)
plot(-ua(1,3)*1000,va(1,3)*1000,'b.','markersize', 20)
plot(-ua(1,4)*1000,va(1,4)*1000,'m.','markersize', 20)


plot(-ud(1,1)*1000,vd(1,1)*1000,'r*','markersize', 15)
plot(-ud(1,2)*1000,vd(1,2)*1000,'g*','markersize', 15)
plot(-ud(1,3)*1000,vd(1,3)*1000,'b*','markersize', 15)
plot(-ud(1,4)*1000,vd(1,4)*1000,'m*','markersize', 15)

line([-ua(1,1)*1000 -ua(1,2)*1000],[va(1,1)*1000 va(1,2)*1000],'Color','b','LineWidth',0.7)
line([-ua(1,2)*1000 -ua(1,4)*1000],[va(1,2)*1000 va(1,4)*1000],'Color','b','LineWidth',0.7)
line([-ua(1,4)*1000 -ua(1,3)*1000],[va(1,4)*1000 va(1,3)*1000],'Color','b','LineWidth',0.7)
line([-ua(1,3)*1000 -ua(1,1)*1000],[va(1,3)*1000 va(1,1)*1000],'Color','b','LineWidth',0.7)

line([-ud(1,1)*1000 -ud(1,2)*1000],[vd(1,1)*1000 vd(1,2)*1000],'Color','g','LineWidth',2)
line([-ud(1,2)*1000 -ud(1,4)*1000],[vd(1,2)*1000 vd(1,4)*1000],'Color','g','LineWidth',2)
line([-ud(1,4)*1000 -ud(1,3)*1000],[vd(1,4)*1000 vd(1,3)*1000],'Color','g','LineWidth',2)
line([-ud(1,3)*1000 -ud(1,1)*1000],[vd(1,3)*1000 vd(1,1)*1000],'Color','g','LineWidth',2)

line([-0.5*1000  0.5*1000],[0.38*1000 0.38*1000],'Color','k','LineWidth',4)
line([0.5*1000 0.5*1000],[0.38*1000 -0.38*1000],'Color','k','LineWidth',4)
line([-0.5*1000  0.5*1000],[-0.38*1000 -0.38*1000],'Color','k','LineWidth',4)
line([-0.5*1000  -0.5*1000],[0.38*1000 -0.38*1000],'Color','k','LineWidth',4)
hold off
%%



[xd,yd,zd]=P_World_to_Camera(Pointt,Hd*rr,Kd); % wrt to the camera frame
PointCameraD=[xd;yd;zd];
% qd=[PointCameraD(1:3,1);PointCameraD(1:3,2);PointCameraD(1:3,3);PointCameraD(1:3,4)];
qd=[Ud(1:2,1);Ud(1:2,2);Ud(1:2,3);Ud(1:2,4)];

[xa,ya,za]=P_World_to_Camera(Pointt,Ha*rr,Ka);
PointCameraA=[xa;ya;za];

if  Zflag==1
z=[PointCameraA(3,1);PointCameraA(3,2);PointCameraA(3,3);PointCameraA(3,4)];
else
z=[PointCameraD(3,1);PointCameraD(3,2);PointCameraD(3,3);PointCameraD(3,4)];
end 

q=[Ua(1:2,1);Ua(1:2,2);Ua(1:2,3);Ua(1:2,4)];






%%


while t <= tloop %number of iterations

[rx ry rz]= GetEulerAngles(Ha(1:3,1:3));
TIKTAK= tic;

qer(:,1) = q(:,t+1)-qd;
erorimage(:,t+1)=qer(:,1);


if  PPC_control_flag==1
KPP=(KPPt/(t+1)); % edw mporoume na rithmiosoume to kerdos kathws proxwraei na mmeiwnetai (anti miden na mpei t.
[control,r_u1_up_t(t+1),r_u1_low_t(t+1),r_v1_up_t(t+1),r_v1_low_t(t+1),r_u2_up_t(t+1),r_u2_low_t(t+1),r_v2_up_t(t+1),r_v2_low_t(t+1),r_u3_up_t(t+1),r_u3_low_t(t+1),r_v3_up_t(t+1),r_v3_low_t(t+1),r_u4_up_t(t+1),r_u4_low_t(t+1),r_v4_up_t(t+1),r_v4_low_t(t+1)]=PPIMG4(dt,qd,q(:,t+1),control,ubound,wbound,lamda,z,umax,vmax,KPP,t);
else
[control]=IMGsimple4(dt,qd,q(:,t+1),control,ubound,wbound,lamda,z,umax,vmax,KIB); %simple image based controller
end 


 ELAPSED = num2str(toc(TIKTAK)); % sec
disp(['<< Elapsed Time = ' ELAPSED ' sec >>'])

Rw2i=rr(1:3,1:3);
tw2i=-Rw2i*ta;

controlnew(4:6,1)=Rw2i*control(4:6,1); % Control input wrt inertial frame 
controlnew(1:3,1)=Rw2i*control(1:3,1); 

state= model(xxx,yy,zz,rx,ry,rz,controlnew,dt); %Running the dynamic model of the system using ode15s
    
Ha= transl(state(1,1),state(2,1),state(3,1))*rpy2tr(state(6,1),state(5,1),state(4,1),'zyx');
     
[uas,vas]=f_perspproj(Pointt,Ha*rr,Ka);
Ua=[uas;vas];
U(:,t+1)=[Ua(:,1);Ua(:,2);Ua(:,3);Ua(:,4)];
        

figure(1)
hold on
if t-tloop==0
plotcamera_des([state(1,1),state(2,1),state(3,1),state(4,1),state(5,1),state(6,1)]);
end
line([xxx state(1,1)],[yy state(2,1)],[zz state(3,1)],'Marker','.','LineStyle','-')
hold off
xxx= state(1,1);
yy= state(2,1);
zz= state(3,1);
rx= state(4,1);
ry= state(5,1);
rz= state(6,1);
camera_x(t+1)=state(1,1);
camera_y(t+1)=state(2,1);
camera_z(t+1)=state(3,1);
camera_wx(t+1)=state(4,1);
camera_wy(t+1)=state(5,1);
camera_wz(t+1)=state(6,1);

[xa,ya,za]=P_World_to_Camera(Pointt,Ha*rr,Ka);
PointCameraA=[xa;ya;za];
tau=1;
if Zflag ==1
z=[PointCameraA(3,1);PointCameraA(3,2);PointCameraA(3,3);PointCameraA(3,4)];
else
z=[PointCameraD(3,1);PointCameraD(3,2);PointCameraD(3,3);PointCameraD(3,4)];
end
q(:,t+tau+1)=[Ua(1:2,1);Ua(1:2,2);Ua(1:2,3);Ua(1:2,4)];




figure(2)
% axis equal

hold on
title('Image Plane during Motion of camera')
plot(-uas(1,1)*1000,vas(1,1)*1000,'r.', 'markersize', 10)
plot(-uas(1,2)*1000,vas(1,2)*1000,'g.','markersize', 10)
plot(-uas(1,3)*1000,vas(1,3)*1000,'b.','markersize', 10)
plot(-uas(1,4)*1000,vas(1,4)*1000,'m.','markersize', 10)
if t-dplot==14
line([-uas(1,1)*1000 -uas(1,2)*1000],[vas(1,1)*1000 vas(1,2)*1000],'Color','b','LineWidth',0.7)
line([-uas(1,2)*1000 -uas(1,4)*1000],[vas(1,2)*1000 vas(1,4)*1000],'Color','b','LineWidth',0.7)
line([-uas(1,4)*1000 -uas(1,3)*1000],[vas(1,4)*1000 vas(1,3)*1000],'Color','b','LineWidth',0.7)
line([-uas(1,3)*1000 -uas(1,1)*1000],[vas(1,3)*1000 vas(1,1)*1000],'Color','b','LineWidth',0.7)
dplot=t;
end      
hold off


%   Store control inputs for plotting:
Tx(t+1)         = control(1,1);
Ty(t+1)         = control(2,1);
Tz(t+1)         = control(3,1);
omegax(t+1)     = control(4,1);
omegay(t+1)     = control(5,1);
omegaz(t+1)     = control(6,1);

t = t + 1;
end;    


if  PPC_control_flag==1
 plot_PPC;
else
plot_IBVS
end 








