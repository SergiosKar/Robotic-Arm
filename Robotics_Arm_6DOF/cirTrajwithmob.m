function [path pathd pathdd,pathcoord]=cirTrajwithmob(mrobot,vepath)




N=20;
t=linspace(0,2*pi,N);
z1=zeros(1,20);
theta=pi/4;
radius=8;
offset=6;
x=radius*cos(t)+offset;
y=radius*sin(t)*cos(theta)+offset;
z=-radius*sin(t)*sin(theta)+offset;
% plot3(x,y,z);
%   hold on;
%  scatter3(x,y,z);
 
cir=[x; y; z];


Qp3 = linspace(0, 2*pi, N);

t1=zeros(1,N);t2=zeros(1,N);t3=zeros(1,N);d4=zeros(1,N);
Q=zeros(N,4);

vepathnew(1,:)=vepath(1,:);
vepathnew(2,:)=vepath(2,:);
vepathnew(3,:)=vepath(3,:);
vepathnew(4,:)=vepath(4,:);
 k=5;
for i=5:51
  m=mod(i,3);
  if(m==0)
  vepathnew(k,:)=vepath(i,:);
  k=k+1;
  
  end
 
end
 

for i=1:N

  
  xo=vepathnew(i,1);  
  yo=vepathnew(i,2);  
    
 t1(i)=atan2(y(i)+yo,x(i)+xo);
 if(t1(i)<0)
     t1(i)=t1(i)+2*pi;
 end
 
 
 d4(i)=sqrt((x(i)+xo)*(x(i)+xo)+(y(i)+yo)*(y(i)+yo)+(z(i))*(z(i)));
 t2(i)=atan2(sqrt((x(i)+xo)*(x(i)+xo)+(y(i)+yo)*(y(i)+yo)),(z(i)));
 if(t2(i)<0)
     t2(i)=t2(i)+2*pi;
 end
 
 r32=-sin(t2(i))*sin(Qp3(i));
 t3(i)=asin(r32/(-sin(t2(i))));
 Q(i,:)=[t1(i) t2(i) t3(i) d4(i)];
 
end
qdp=zeros(N,4);
qdp(2:N-1,:)=2*pi*1e-3*ones(N-2,4);

for i=1:N-1
    [q,qd,qdd] = jtraj(Q(i,:),Q(i+1,:),2,qdp(i,:),qdp(i+1,:));
    path(i,:)=q(1,:);
    pathd(i,:)=qd(1,:);  
    pathdd(i,:)=qdd(1,:);
end
    path(N,:)=path(1,:);
    pathd(N,:)=pathd(1,:);  
    pathdd(N,:)=pathdd(1,:);

for i=1:N
    
    K=mrobot.fkine(path(i,:));
    pathcoord(:,i)=[K(1,4) K(2,4) K(3,4)];

end


end
