%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                       %%
%%  Epipolar Geometry Toolbox v1.1 (EGT) %%
%%                                       %%
%%%%%%%% DII- University of Siena %%%%%%%%%
% 
% f_3Dwfenum(P,col,m);
%
% Syntax:
% ------
%     P = 3D corrdinates of feature points (in w.f.)
%   col = color of text with wich points will be labelled
%     m = how far the write to thw points?
% 
% Descr: 
% -----  
%     This function plots the label with number of feature points near the
%     point itself.
%    
% Author:
%    Gian Luca Mariottini
% Last update:
%    Nov., 2005
function f_3Dwfenum(P,col,m);
if nargin==0
    display('EGT error: the function "f_3Dwfenum" need at least one input');
elseif nargin==1,
    col='k';
    m=0;
elseif nargin==2,
    m=0;
elseif nargin>3;
    display('EGT warning: high number of inputs in "f_3Dwfenum"!');
end;
for i=1:length(P(1,:)),
    tx=strcat(num2str(i));
    text(P(1,i)+m,P(2,i)+m,P(3,i)+m,tx,'Color',col);
end;