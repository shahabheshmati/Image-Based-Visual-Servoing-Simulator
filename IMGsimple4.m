
function [control]=IMGsimple4(dt,qd,q,control,ubound,wbound,lamda,z,umax,vmax,K)
    
J1=[ -lamda/z(1,1),      0,        q(1,1)/z(1,1),    (q(1,1)*q(2,1))/lamda,    -(lamda^2+q(1,1)^2)/lamda,  q(2,1);
         0,       -lamda/z(1,1),    q(2,1)/z(1,1),   (lamda^2+q(2,1)^2)/lamda,    -(q(1,1)*q(2,1))/lamda,    -q(1,1)];
     
J2=[ -lamda/z(2,1),      0,        q(3,1)/z(1,1),    (q(3,1)*q(4,1))/lamda,    -(lamda^2+q(3,1)^2)/lamda,  q(4,1);
         0,       -lamda/z(2,1),    q(4,1)/z(2,1),   (lamda^2+q(4,1)^2)/lamda,    -(q(3,1)*q(4,1))/lamda,    -q(3,1)];

J3=[ -lamda/z(3,1),      0,        q(5,1)/z(1,1),    (q(5,1)*q(6,1))/lamda,    -(lamda^2+q(5,1)^2)/lamda,  q(6,1);
         0,       -lamda/z(3,1),    q(6,1)/z(3,1),   (lamda^2+q(6,1)^2)/lamda,    -(q(5,1)*q(6,1))/lamda,    -q(5,1)];
     
     
J4=[ -lamda/z(4,1),      0,        q(7,1)/z(1,1),    (q(7,1)*q(8,1))/lamda,    -(lamda^2+q(7,1)^2)/lamda,  q(8,1);
         0,       -lamda/z(4,1),    q(8,1)/z(4,1),   (lamda^2+q(8,1)^2)/lamda,    -(q(7,1)*q(8,1))/lamda,    -q(7,1)];
     
er=qd-q;
     
     J=[J1;J2;J3;J4];
     
     
     control=K*pinv(J)*er;
     
     
     
     
     
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

end