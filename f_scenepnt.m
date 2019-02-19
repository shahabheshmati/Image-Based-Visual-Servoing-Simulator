%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                       %%
%%  Epipolar Geometry Toolbox v1.3 (EGT) %%
%%                                       %%
%%%%%%%% DII- University of Siena %%%%%%%%%
%
% f_scenepnt(U,color,plott);
%
% Descr: 
% -----  This EGT Matlab function plots in a Matlab figure a set of 3D points U=[X;Y;Z] (column
%        vectors respectively) expressed in the world reference frame (see manual). 
% 
% Syntax:
% ------
%      U = "matrix of points in EGT world reference frame scene" 
%              P=[x_1 , x_2 , ... , x_n; 
%                 y_1 , y_2 , ... , y_n; 
%                 z_1 , z_2 , ... , z_n]; 
%      color = "color and shape of represented points"
%      plott = "boolean variable [0,1] to make the plot visible in figure fig"
%
% Example:
% -------
%
%      clear all; close all;
%      X = [-5, 5,  5, -5,-5, 5, 5 , -5, 10];     
%      Z = [ 5, 5, 15, 15, 5, 5,15 , 15, 10];     
%      Y = [15,15, 15, 15,25,25, 25, 25, 30];     
%      P = [X;Y;Z];      
%      figure(1); hold on; grid on; axis equal; view(-37,20);
%      f_3Dwf('b',4);    
%      f_scenepnt(P,'r*',1); f_3Dwfenum(P,'k',.5);
%
% Gian Luca Mariottini - January 2005

function f_scenepnt(P,color,plotta);

%Per disomogeneizzare i punti
if length(P(1,:))==4, %allora è in forma omogenea...
    Pno=P([1:3],:);
else
    Pno=P;
end;
scene_pnts=Pno;
                                    
   if (nargin ==1),
       color='r*';
       plotta=1;
   elseif (nargin==2),
       plotta=1;
   elseif (nargin>3)
       display('EGT warning : tto much inputs for f_scenepnt!');
   end    
   if (plotta>1)|(plotta<0),
       disp('EGT ERROR: Third input value must be in {0,1}')
   end;
   
   if plotta==1,
       plot3(scene_pnts(1,:),scene_pnts(2,:),scene_pnts(3,:),color);
   end;

