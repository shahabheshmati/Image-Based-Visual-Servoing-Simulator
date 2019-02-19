


figure(3)
subplot(211)
title('Contol commands velocities- Classic IBVS')
hold on
box on
axis([0 t*dt -ubound ubound])
%xlabel('Seconds')
ylabel('Translational')
plot((1:t)*dt,Tx(1,:),'b','LineWidth',2.5)
plot((1:t)*dt,Ty(1,:),'g','LineWidth',2.5)
plot((1:t)*dt,Tz(1,:),'r','LineWidth',2.5)
line([0 t*dt],[0.2 0.2],'Color','k','LineStyle','-.','LineWidth',2)
line([0 t*dt],[-0.2 -0.2],'Color','k','LineStyle','-.','LineWidth',2)
legend('T_x', 'T_y','T_z')

subplot(212)
hold on
box on
ylabel('Rotational')
axis([0 t*dt -ubound ubound])
plot((1:t)*dt,omegax(1,:),'c','LineWidth',2.5)
plot((1:t)*dt,omegay(1,:),'m','LineWidth',2.5)
plot((1:t)*dt,omegaz(1,:),'k','LineWidth',2.5)
xlabel('Seconds')
legend('\omega_x','\omega_y','\omega_z')

line([0 t*dt],[0.2 0.2],'Color','k','LineStyle','-.','LineWidth',2)
line([0 t*dt],[-0.2 -0.2],'Color','k','LineStyle','-.','LineWidth',2)
hold off

%%%%%%%%%%%%%%%%%%%
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


%%%%%%%%%%%%%%%

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
