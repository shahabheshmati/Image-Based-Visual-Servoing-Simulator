


figure(3)
subplot(211)
title('Contol commands velocities- Proposed IBVS')
hold on
box on
axis([0 t*dt -ubound/2 ubound/2])
%xlabel('Seconds')
ylabel('Translational')
plot((1:t)*dt,Tx(1,:)/2,'b','LineWidth',2.5)
plot((1:t)*dt,Ty(1,:)/2,'g','LineWidth',2.5)
plot((1:t)*dt,Tz(1,:)/2,'r','LineWidth',2.5)
line([0 t*dt],[0.2 0.2],'Color','k','LineStyle','-.','LineWidth',2)
line([0 t*dt],[-0.2 -0.2],'Color','k','LineStyle','-.','LineWidth',2)
legend('T_x', 'T_y','T_z')

subplot(212)
hold on
box on
ylabel('Rotational')
axis([0 t*dt -ubound/2 ubound/2])
plot((1:t)*dt,omegax(1,:)/2,'c','LineWidth',2.5)
plot((1:t)*dt,omegay(1,:)/2,'m','LineWidth',2.5)
plot((1:t)*dt,omegaz(1,:)/2,'k','LineWidth',2.5)
xlabel('Seconds')
legend('\omega_x','\omega_y','\omega_z')

line([0 t*dt],[0.2 0.2],'Color','k','LineStyle','-.','LineWidth',2)
line([0 t*dt],[-0.2 -0.2],'Color','k','LineStyle','-.','LineWidth',2)
hold off

%%%%%%%%%%%%%%%
figure(4)
hold on
grid on
box on
axis([0 t*dt -0.4*1000 0.7*1000])
xlabel('Seconds')
plot((1:t)*dt,erorimage(1,:)*1000,'r','LineWidth',2)
plot((1:t)*dt,erorimage(2,:)*1000,'r','LineStyle','-.','LineWidth',2)
plot((1:t)*dt,erorimage(3,:)*1000,'c','LineWidth',2)
plot((1:t)*dt,erorimage(4,:)*1000,'c','LineStyle','-.','LineWidth',2)
plot((1:t)*dt,erorimage(5,:)*1000,'b','LineWidth',2)
plot((1:t)*dt,erorimage(6,:)*1000,'b','LineStyle','-.','LineWidth',2)
plot((1:t)*dt,erorimage(7,:)*1000,'m','LineWidth',2)
plot((1:t)*dt,erorimage(8,:)*1000,'m','LineStyle','-.','LineWidth',2)
% plot((1:t)*dt,erorimage(9,:),'k','LineWidth',2)
% plot((1:t)*dt,erorimage(10,:),'k','LineStyle','-.','LineWidth',2)
legend('e u_1', 'e v_1','e u_2','e v_2','e u_3','e v_3','e u_4','e v_4')

hold off



%%%%%%%%%%%%%%%%%%%

figure(5)
%axis equal
%  grid on
box on
hold on

%        line([-0.5 0.5],[-0.38 -0.38],'Color','k','LineWidth',3)
%        line([0.5 0.5],[-0.38 0.38],'Color','k','LineWidth',3)
%        line([0.5 -0.5],[0.38 0.38],'Color','k','LineWidth',3)
%        line([-0.5 -0.5],[0.38 -0.38],'Color','k','LineWidth',3)
title('Image Plane')
xlabel('u', 'FontSize',15)
ylabel('v', 'FontSize',15)

% title('Image Plane in initial configuration')
%plot(udn,vdn,'gO')
axis([-0.6*1000 0.6*1000 -0.45*1000 0.45*1000])
plot(-ua(1,1)*1000,va(1,1)*1000,'r.' ,'markersize', 20)
plot(-ua(1,2)*1000,va(1,2)*1000,'c.','markersize', 20)
plot(-ua(1,3)*1000,va(1,3)*1000,'b.','markersize', 20)
plot(-ua(1,4)*1000,va(1,4)*1000,'m.','markersize', 20)


plot(-ud(1,1)*1000,vd(1,1)*1000,'r*','markersize', 15)
plot(-ud(1,2)*1000,vd(1,2)*1000,'c*','markersize', 15)
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


figure(5)
hold on
for k=1:t-1
%          line([-U(1,k) -U(1,k+1)],[U(2,k) U(2,k+1)],'Color','r','LineWidth',3) 
%           line([ -U(3,k+1)],[U(4,k) U(4,k+1)],'Color','c','LineWidth',3)
%            line([-U(5,k) -U(5,k+1)],[U(6,k) U(6,k+1)],'Color','b','LineWidth',3) 
%             line([-U(7,k) -U(7,k+1)],[U(8,k) U(8,k+1)],'Color','m','LineWidth',3) 

plot(-U(1,k)*1000,U(2,k)*1000,'r.', 'markersize', 10)
plot(-U(3,k)*1000,U(4,k)*1000,'c.','markersize', 10)
plot(-U(5,k)*1000,U(6,k)*1000,'b.','markersize', 10)
plot(-U(7,k)*1000,U(8,k)*1000,'m.','markersize', 10)
end
hold off

figure(6)
hold on; grid on; 
axis equal; 

set(gca, 'Zdir', 'reverse', 'Xdir','reverse');
trplot(rotoz(0)*rotoy(0)*rotox(0),'color','k')

plotcamera([ta(1,1),ta(2,1),ta(3,1),ang_x,ang_y,ang_z]);
plotcamera_des([td(1,1),td(2,1),td(3,1),0,0,0]);

f_3Dwfenum(Pointt);
f_scenepnt(Pointt(:,1),'r*',1);
f_scenepnt(Pointt(:,2),'c*',1);
f_scenepnt(Pointt(:,3),'b*',1 );
f_scenepnt(Pointt(:,4),'m*',1);

line([Pointt(1,1) Pointt(1,2)],[Pointt(2,1) Pointt(2,2)],[Pointt(3,1) Pointt(3,2)],'Color','k','LineWidth',1.2)
line([Pointt(1,1) Pointt(1,3)],[Pointt(2,1) Pointt(2,3)],[Pointt(3,1) Pointt(3,3)],'Color','k','LineWidth',1.2)
line([Pointt(1,3) Pointt(1,4)],[Pointt(2,3) Pointt(2,4)],[Pointt(3,3) Pointt(3,4)],'Color','k','LineWidth',1.2)
line([Pointt(1,4) Pointt(1,2)],[Pointt(2,4) Pointt(2,2)],[Pointt(3,4) Pointt(3,2)],'Color','k','LineWidth',1.2)

view(80,30)
hold off
figure(6)
hold on
for k=1:t-1
line([camera_x(1,k) camera_x(1,k+1)],[camera_y(1,k) camera_y(1,k+1)],[camera_z(1,k) camera_z(1,k+1)],'Marker','.','LineStyle','-') 
end
hold off







%%%%%%%%%%%%%%%%%%
figure(8)

subplot(421)
box on
axis([0 t*dt -400 900])
hold on
grid on
title('Errors - Performance, u')
ylabel('Feature 1')
plot((1:t)*dt,(U(1,:)-qd(1,1))*1000,'r','LineWidth',2.5)
plot((1:t)*dt,r_u1_up_t(1,:)*1000 ,'b','LineWidth',2.5)
plot((1:t)*dt,-r_u1_low_t(1,:)*1000 ,'b','LineWidth',2.5)
hold off

subplot(422)
hold on
grid on
axis([0 t*dt -300 800])
box on
title('Errors - Performance, v')
plot((1:t)*dt,(U(2,:)-qd(2,1))*1000,'r','LineWidth',2.5)
plot((1:t)*dt,r_v1_up_t(1,:)*1000 ,'b','LineWidth',2.5)
plot((1:t)*dt,-r_v1_low_t(1,:)*1000 ,'b','LineWidth',2.5)
hold off

subplot(423)
hold on
grid on
axis([0 t*dt -900 350])
box on
ylabel('Feature 2')
plot((1:t)*dt,(U(3,:)-qd(3,1))*1000,'r','LineWidth',2.5)
plot((1:t)*dt,r_u2_up_t(1,:)*1000 ,'b','LineWidth',2.5)
plot((1:t)*dt,-r_u2_low_t(1,:)*1000 ,'b','LineWidth',2.5)
hold off

subplot(424)
hold on
grid on
axis([0 t*dt -300 800])
box on
plot((1:t)*dt,(U(4,:)-qd(4,1))*1000,'r','LineWidth',2.5)
plot((1:t)*dt,r_v2_up_t(1,:) *1000,'b','LineWidth',2.5)
plot((1:t)*dt,-r_v2_low_t(1,:) *1000,'b','LineWidth',2.5)
hold off

subplot(425)
hold on
grid on
axis([0 t*dt -400 900])
box on
ylabel('Feature 3')
plot((1:t)*dt,(U(5,:)-qd(5,1))*1000,'r','LineWidth',2.5)
plot((1:t)*dt,r_u3_up_t(1,:)*1000 ,'b','LineWidth',2.5)
plot((1:t)*dt,-r_u3_low_t(1,:) *1000,'b','LineWidth',2.5)
hold off

subplot(426)
hold on
grid on
axis([0 t*dt -800 300])
box on
plot((1:t)*dt,(U(6,:)-qd(6,1))*1000,'r','LineWidth',2.5)
plot((1:t)*dt,r_v3_up_t(1,:) *1000,'b','LineWidth',2.5)
plot((1:t)*dt,-r_v3_low_t(1,:)*1000 ,'b','LineWidth',2.5)
hold off

subplot(427)
hold on
grid on
box on
axis([0 t*dt -900 400])
xlabel('Seconds')
ylabel('Feature 4')
plot((1:t)*dt,(U(7,:)-qd(7,1))*1000,'r','LineWidth',2.5)
plot((1:t)*dt,r_u4_up_t(1,:) *1000,'b','LineWidth',2.5)
plot((1:t)*dt,-r_u4_low_t(1,:) *1000,'b','LineWidth',2.5)
hold off

subplot(428)
hold on
grid on
axis([0 t*dt -750 300])
box on
xlabel('Seconds')
plot((1:t)*dt,(U(8,:)-qd(8,1))*1000,'r','LineWidth',2.5)
plot((1:t)*dt,r_v4_up_t(1,:) *1000,'b','LineWidth',2.5)
plot((1:t)*dt,-r_v4_low_t(1,:)*1000 ,'b','LineWidth',2.5)
hold off

figure(9)
subplot(211)
axis([0 t*dt -350 850])
box on
hold on
plotedit on 
tx=xlabel('Seconds');

str1 = {'$\rho_{max}(t)$'};
str2 = {'$\rho_{min}(t)$'};

str3 = {'$\rho_{\infty}$'};
str4 = {'-$\rho_{\infty}$'};
str8 = {'image coordinate error'};
text(2.5,200,str8)


annotation('textbox', [0.1 0.1 0.1 0.1], 'interpreter','latex', 'String', str1);
annotation('textbox', [0.1 0.1 0.1 0.1], 'interpreter','latex', 'String', str2);
annotation('textbox', [0.1 0.1 0.1 0.1], 'interpreter','latex', 'String', str3);
annotation('textbox', [0.1 0.1 0.1 0.1], 'interpreter','latex', 'String', str4);
t1=title('Image Errors - Performance');

plot((1:t)*dt,(U(1,:)-qd(1,1))*1000,'r','LineWidth',2.5)
plot((1:t)*dt,r_u1_up_t(1,:)*1000 ,'b','LineWidth',2.5)
plot((1:t)*dt,-r_u1_low_t(1,:)*1000 ,'b','LineWidth',2.5)

line([0 t*dt],[0.02*1000 0.02*1000],'Color','k','LineStyle','-.','LineWidth',2.0)
line([0 t*dt],[-0.02*1000 -0.02*1000],'Color','k','LineStyle','-.','LineWidth',2.0)


subplot(212)
t2=title('Image coordinate evolution - Field of View');
str5 = {'Upper bound of the coordinate image plane'};
str6 = {'Lower bound of the coordinate image plane'};
str7 = {'Image coordinate error'};
str9 = {'Desired image coordinate'};

text(2.5,600,str5)
text(2.5,-600,str6)
text(2.5,0,str7)
text(2.5,0,str9)


axis([0 t*dt -700 700])
box on
hold on
xlabel('Seconds')
plot((1:t)*dt,(U(1,:))*1000,'r','LineWidth',2.5)
line([0 t*dt],[0.5*1000 0.5*1000],'Color','k','LineStyle','-.','LineWidth',3)
line([0 t*dt],[-0.5*1000 -0.5*1000],'Color','k','LineStyle','-.','LineWidth',3)
line([0 t*dt],[-250 -250],'Color','g','LineStyle','-.','LineWidth',2)
