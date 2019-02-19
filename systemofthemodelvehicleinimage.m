function dy = systemofthemodelvehicleinimage(t,y)
dy = zeros(6,1);    % a column vector

global uappwl vappwl wappwl pappwl qappwl rappwl
 
u=uappwl;
v=vappwl;
w=wappwl;
p=pappwl;
q=qappwl;
r=rappwl;

phi=y(4);
th=y(5);
psi=y(6);

dy(1)= (u*cos(th)*cos(psi)+v*(cos(psi)*sin(th)*sin(phi)-sin(psi)*cos(phi))+w*(sin(psi)*sin(phi)+cos(psi)*cos(phi)*sin(th)));

dy(2)=(u*cos(th)*sin(psi)+v*(cos(psi)*cos(phi)+sin(phi)*sin(th)*sin(psi))+w*(sin(psi)*sin(th)*cos(phi)-cos(psi)*sin(phi)));

dy(3)= (-u*sin(th)+v*cos(th)*sin(phi)+w*cos(th)*cos(phi));

dy(4)= (p+q*sin(phi)*tan(th)+r*cos(th)*tan(th));

dy(5)= (q*cos(phi)-r*sin(phi));

dy(6)=(q*(sin(phi)/cos(th))+r*(cos(phi)/cos(th)));

