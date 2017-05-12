function [path pathd pathdd,pathcoord]=cirTraj(mrobot)



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

for i=1:N
      
 t1(i)=atan2(y(i),x(i));
 if(t1(i)<0)
     t1(i)=t1(i)+2*pi;
 end
 
 
 d4(i)=sqrt(x(i)*x(i)+y(i)*y(i)+z(i)*z(i));
 t2(i)=atan2(sqrt(x(i)*x(i)+y(i)*y(i)),(z(i)));
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
%      hold on;
  mrobot.plot(path,'workspace',[-20 20 -20 20 -20 20]);

% t=[0:8/N:8-(8/N)];
% plot(t,coord(3,:));
% hold on;
% plot(t,cir(3,:));


end
