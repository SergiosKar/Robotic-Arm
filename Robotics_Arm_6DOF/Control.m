mrobot=robotDef;
[path, pathd, pathdd,pathcoord]=cirTraj(mrobot);
pathcoord=double(pathcoord);
time=[0:8/20:8-(8/20)];

for i=1:20
    T=mrobot.fkine(qreal(i,:));
    realcoord(:,i)=[T(1,4) T(2,4) T(3,4)]';
     
end
% plot desired and estimated path
figure(1),plot3(realcoord(1,:),realcoord(2,:),realcoord(3,:),'blue');
 hold on;
 figure(1),plot3(pathcoord(1,:),pathcoord(2,:),pathcoord(3,:),'red');
 hold on;
 figure(1),scatter3(realcoord(1,:),realcoord(2,:),realcoord(3,:),'blue');
 hold on;
 figure(1),scatter3(pathcoord(1,:),pathcoord(2,:),pathcoord(3,:),'red');
 hold on;
% plot desired and estimated x coordinate
 
figure(2),plot(time,realcoord(1,:));
hold on;
plot(time,pathcoord(1,:));


% plot desired and estimated y coordinate
 
figure(3),plot(time,realcoord(2,:));
hold on;
plot(time,pathcoord(2,:));

% plot desired and estimated z coordinate
 
figure(4),plot(time,realcoord(3,:));
hold on;
plot(time,pathcoord(3,:));





 