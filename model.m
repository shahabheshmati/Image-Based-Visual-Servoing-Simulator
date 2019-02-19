

function [state]=model(x,y,z,phi,th,psi,control,dt)
  global uappwl vappwl wappwl pappwl qappwl rappwl

uappwl=control(1,1);
vappwl=control(2,1);
wappwl=control(3,1);
pappwl=control(4,1);
qappwl=control(5,1);
rappwl=control(6,1);






[T,Y] = ode15s(@systemofthemodelvehicleinimage,[0 dt],[x,y,z,phi,th,psi]);

state(1,1)= Y(end,1);

state(2,1)= Y(end,2);

state(3,1)= Y(end,3);
state(4,1)= Y(end,4);

state(5,1)= Y(end,5);

state(6,1)=Y(end,6);


end






