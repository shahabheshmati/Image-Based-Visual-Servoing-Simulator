%%ppimg
function [control,r_u1_up_t,r_u1_low_t,r_v1_up_t,r_v1_low_t,r_u2_up_t,r_u2_low_t,r_v2_up_t,r_v2_low_t,r_u3_up_t,r_u3_low_t,r_v3_up_t,r_v3_low_t,r_u4_up_t,r_u4_low_t,r_v4_up_t,r_v4_low_t]=PPIMG4(dt,qd,q,control,ubound,wbound,lamda,z,umax,vmax,K,t)
    
J1=[ -lamda/z(1,1),      0,        q(1,1)/z(1,1),    (q(1,1)*q(2,1))/lamda,    -(lamda^2+q(1,1)^2)/lamda,  q(2,1);
         0,       -lamda/z(1,1),    q(2,1)/z(1,1),   (lamda^2+q(2,1)^2)/lamda,    -(q(1,1)*q(2,1))/lamda,    -q(1,1)];
     
J2=[ -lamda/z(2,1),      0,        q(3,1)/z(1,1),    (q(3,1)*q(4,1))/lamda,    -(lamda^2+q(3,1)^2)/lamda,  q(4,1);
         0,       -lamda/z(2,1),    q(4,1)/z(2,1),   (lamda^2+q(4,1)^2)/lamda,    -(q(3,1)*q(4,1))/lamda,    -q(3,1)];

J3=[ -lamda/z(3,1),      0,        q(5,1)/z(1,1),    (q(5,1)*q(6,1))/lamda,    -(lamda^2+q(5,1)^2)/lamda,  q(6,1);
         0,       -lamda/z(3,1),    q(6,1)/z(3,1),   (lamda^2+q(6,1)^2)/lamda,    -(q(5,1)*q(6,1))/lamda,    -q(5,1)];
     
     
J4=[ -lamda/z(4,1),      0,        q(7,1)/z(1,1),    (q(7,1)*q(8,1))/lamda,    -(lamda^2+q(7,1)^2)/lamda,  q(8,1);
         0,       -lamda/z(4,1),    q(8,1)/z(4,1),   (lamda^2+q(8,1)^2)/lamda,    -(q(7,1)*q(8,1))/lamda,    -q(7,1)];
  J=[J1;J2;J3;J4];
  
  
  
  
umin=-umax;
vmin=-vmax;



r_u1_up_0=umax-qd(1,1);
r_v1_up_0=vmax-qd(2,1);
                              % first point
r_u1_low_0=qd(1,1)-umin;
r_v1_low_0=qd(2,1)-vmin;


r_u2_up_0=umax-qd(3,1);
r_v2_up_0=vmax-qd(4,1);
                             %second point
r_u2_low_0=qd(3,1)-umin;
r_v2_low_0=qd(4,1)-vmin;


r_u3_up_0=umax-qd(5,1);
r_v3_up_0=vmax-qd(6,1);
                           % third point
r_u3_low_0=qd(5,1)-umin;
r_v3_low_0=qd(6,1)-vmin;

r_u4_up_0=umax-qd(7,1);
r_v4_up_0=vmax-qd(8,1);

r_u4_low_0=qd(7,1)-umin;
r_v4_low_0=qd(8,1)-vmin;
     
     
r_inf=0.001;

l=0.1;



r_u1_up_t = (r_u1_up_0  -  r_inf)*exp(-l*t*dt) +  r_inf;
r_u1_low_t = (r_u1_low_0  -  r_inf)*exp(-l*t*dt)  +  r_inf;

r_v1_up_t = (r_v1_up_0  -  r_inf)*exp(-l*t*dt) +  r_inf;
r_v1_low_t = (r_v1_low_0  -  r_inf)*exp(-l*t*dt)  +  r_inf;


r_u2_up_t = (r_u2_up_0  -  r_inf)*exp(-l*t*dt) +  r_inf;
r_u2_low_t = (r_u2_low_0  -  r_inf)*exp(-l*t*dt)  +  r_inf;

r_v2_up_t = (r_v2_up_0  -  r_inf)*exp(-l*t*dt) +  r_inf;
r_v2_low_t = (r_v2_low_0  -  r_inf)*exp(-l*t*dt)  +  r_inf;


r_u3_up_t = (r_u3_up_0  -  r_inf)*exp(-l*t*dt) +  r_inf;
r_u3_low_t = (r_u3_low_0  -  r_inf)*exp(-l*t*dt)  +  r_inf;

r_v3_up_t = (r_v3_up_0  -  r_inf)*exp(-l*t*dt) +  r_inf;
r_v3_low_t = (r_v3_low_0  -  r_inf)*exp(-l*t*dt)  +  r_inf;

r_u4_up_t = (r_u4_up_0  -  r_inf)*exp(-l*t*dt) +  r_inf;
r_u4_low_t = (r_u4_low_0  -  r_inf)*exp(-l*t*dt)  +  r_inf;

r_v4_up_t = (r_v4_up_0  -  r_inf)*exp(-l*t*dt) +  r_inf;
r_v4_low_t = (r_v4_low_0  -  r_inf)*exp(-l*t*dt)  +  r_inf;






j_u1 =   ((q(1,1)-qd(1,1))  -  ((r_u1_up_t - r_u1_low_t )/2) ) / (( r_u1_up_t + r_u1_low_t  )/2);
j_v1 =   ((q(2,1)-qd(2,1))  -  ((r_v1_up_t - r_v1_low_t )/2) ) / (( r_v1_up_t + r_v1_low_t  )/2);     

j_u2 =   ((q(3,1)-qd(3,1))  -  ((r_u2_up_t - r_u2_low_t )/2) ) / (( r_u2_up_t + r_u2_low_t  )/2);
j_v2 =   ((q(4,1)-qd(4,1))  -  ((r_v2_up_t - r_v2_low_t )/2) ) / (( r_v2_up_t + r_v2_low_t  )/2);  

j_u3 =   ((q(5,1)-qd(5,1))  -  ((r_u3_up_t - r_u3_low_t )/2) ) / (( r_u3_up_t + r_u3_low_t  )/2);
j_v3 =   ((q(6,1)-qd(6,1))  -  ((r_v3_up_t - r_v3_low_t )/2) ) / (( r_v3_up_t + r_v3_low_t  )/2);  

j_u4 =   ((q(7,1)-qd(7,1))  -  ((r_u4_up_t - r_u4_low_t )/2) ) / (( r_u4_up_t + r_u4_low_t  )/2);
j_v4 =   ((q(8,1)-qd(8,1))  -  ((r_v4_up_t - r_v4_low_t )/2) ) / (( r_v4_up_t + r_v4_low_t  )/2);  


% % 
e_u1 = real(log ((  (1+j_u1)/(1-j_u1)  ) *(r_u1_up_t/r_u1_low_t)   )  );
e_v1 = real(log( ( (1+j_v1)/(1-j_v1)) *(r_v1_up_t/r_v1_low_t)  ));

e_u2 = real(log(  ((1+j_u2)/(1-j_u2)) *(r_u2_up_t/r_u2_low_t)    ));
e_v2 = real(log(  ((1+j_v2)/(1-j_v2)) *(r_v2_up_t/r_v2_low_t)   ));

e_u3 = real(log(  ((1+j_u3)/(1-j_u3)) *(r_u3_up_t/r_u3_low_t)   ));
e_v3 = real(log(  ((1+j_v3)/(1-j_v3)) *(r_v3_up_t/r_v3_low_t)   ));

e_u4 = real(log(  ((1+j_u4)/(1-j_u4)) *(r_u4_up_t/r_u4_low_t)   ));
e_v4 = real(log(  ((1+j_v4)/(1-j_v4)) *(r_v4_up_t/r_v4_low_t)   ));

% e_u1 = j_u1;
% e_v1 = j_v1;
% 
% e_u2 = j_u2;
% e_v2 = j_v2;
% 
% e_u3 = j_u3;
% e_v3 = j_v3;
% 
% e_u4 = j_u4;
% e_v4 = j_v4;


% figure(3)
% subplot(811)
% hold on
% plot(t*dt,q(1,1)-qd(1,1),'*r')
% plot(t*dt,r_u1_up_t ,'*')
% plot(t*dt,-r_u1_low_t ,'*')
% 
% 
% subplot(812)
% hold on
% plot(t*dt,q(2,1)-qd(2,1),'*r')
% plot(t*dt,r_v1_up_t ,'*')
% plot(t*dt,-r_v1_low_t ,'*')
% 
% subplot(813)
% hold on
% plot(t*dt,q(3,1)-qd(3,1),'*r')
% plot(t*dt,r_u2_up_t ,'*')
% plot(t*dt,-r_u2_low_t ,'*')
% 
% subplot(814)
% hold on
% plot(t*dt,q(4,1)-qd(4,1),'*r')
% plot(t*dt,r_v2_up_t ,'*')
% plot(t*dt,-r_v2_low_t ,'*')
% 
% subplot(815)
% hold on
% plot(t*dt,q(5,1)-qd(5,1),'*r')
% plot(t*dt,r_u3_up_t ,'*')
% plot(t*dt,-r_u3_low_t ,'*')
% 
% subplot(816)
% hold on
% plot(t*dt,q(6,1)-qd(6,1),'*r')
% plot(t*dt,r_v3_up_t ,'*')
% plot(t*dt,-r_v3_low_t ,'*')
% 
% subplot(817)
% hold on
% plot(t*dt,q(7,1)-qd(7,1),'*r')
% plot(t*dt,r_u4_up_t ,'*')
% plot(t*dt,-r_u4_low_t ,'*')
% 
% subplot(818)
% hold on
% plot(t*dt,q(8,1)-qd(8,1),'*r')
% plot(t*dt,r_v4_up_t ,'*')
% plot(t*dt,-r_v4_low_t ,'*')

     
control=(-diag([1*K K K K 1*K 1*K]))*pinv(J)*[e_u1,e_v1,e_u2,e_v2,e_u3,e_v3,e_u4,e_v4]';  
%control=-control;
     
     
     
     
   


     
         for ii=1
     for n=1:3
         if control(n,ii)>=ubound
             control(n,ii)=ubound;
              elseif control(n,ii)<= -ubound
                   control(n,ii)=-ubound;
                   else
                control(n,ii)=control(n,ii);
         end
     end
     
     for n=4:6
         if control(n,ii)>=wbound
             control(n,ii)=wbound;
              elseif control(n,ii)<= -wbound
                   control(n,ii)=-wbound;
                   else
                control(n,ii)=control(n,ii);
         end
     end
         end     
    
% figure(4)
% subplot(611)
% hold on
% plot(t*dt,control(1),'*')
% subplot(612)
% hold on
% plot(t*dt,control(2),'*')
% subplot(613)
% hold on
% plot(t*dt,control(3),'*')
% subplot(614)
% hold on
% plot(t*dt,control(4),'*')
% subplot(615)
% hold on
% plot(t*dt,control(5),'*')
% subplot(616)
% hold on
% plot(t*dt,control(6),'*')



end

