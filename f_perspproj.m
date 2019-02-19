function [u,v]=f_perspproj(U,H,K,adjplot);

if nargin==3,
    plottatutto=0;
elseif nargin==4,
    plottatutto=adjplot;
end;

      R=H([1:3],[1:3]); 
      t=H([1:3],4); 
      
  
      if length(U(:,1))==3, 
          Uo=[U;ones(1,length(U(1,:)))];
      else
          Uo=U;
      end
      
  
      for i=1:length(Uo(1,:)),
          Uoegt([1:4],i)=[Uo([1:3],i) ; 1];
      end

      Rw2i=R';
      tw2i=-Rw2i*t;
      projpnt=K*[Rw2i tw2i]*Uoegt;
      for i=1:length(projpnt(1,:)),
          projpntnorm(1,i)=projpnt(1,i)/projpnt(3,i);
          projpntnorm(2,i)=projpnt(2,i)/projpnt(3,i);
          projpntnorm(3,i)=projpnt(3,i)/projpnt(3,i);
      end;
      u=projpntnorm(1,:);
      v=projpntnorm(2,:);
      

      if plottatutto==2,
          Pc=[Rw2i tw2i]*Uoegt;
          Pcm=R;
          for i=1:length(U(1,:)),
              plot3([t(1) U(1,i)],[t(2) U(2,i)],[t(3) U(3,i)],'r:');
          end;    
      end;    
          
          
