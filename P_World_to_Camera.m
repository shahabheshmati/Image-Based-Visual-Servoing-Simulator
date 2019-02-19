


function [xc,yc,zc]=P_World_to_Camera(U,H,K,adjplot);

if nargin==3,
    plottatutto=0;
elseif nargin==4,
    plottatutto=adjplot;
end;

      R=H([1:3],[1:3]); %Matrice rotazione riferita alla rotaz. del robot su se stesso (roll-pitch-yaw)
      t=H([1:3],4); %vettore traslazione riferito al sistema wf.
      
      %Control U as homogeneous
      if length(U(:,1))==3, %not homogeneous
          Uo=[U;ones(1,length(U(1,:)))];
      else
          Uo=U;
      end
      
      %Points must be firstly transformed in the egt frame
      for i=1:length(Uo(1,:)),
          Uoegt([1:4],i)=[Uo([1:3],i) ; 1];
      end

      Rw2i=R';
      tw2i=-Rw2i*t;
      projpnt=[Rw2i tw2i]*Uoegt;
      for i=1:length(projpnt(1,:)),
          pointincamera(1,i)=projpnt(1,i);
          pointincamera(2,i)=projpnt(2,i);
          pointincamera(3,i)=projpnt(3,i);
      end;
      xc=pointincamera(1,:);  
      yc=pointincamera(2,:);  
      zc=pointincamera(3,:);  
         
          
          