
mrobot=robotDef;
[path, pathd, pathdd,pathcoord]=cirTraj(mrobot);
pathcoord=double(pathcoord);
time=[0:8/20:8-(8/20)];

% plot desired and estimated x coordinate
 
figure(2),plot(time,pathcoord(1,:));


% plot desired and estimated y coordinate
 
figure(3),plot(time,pathcoord(2,:));

% plot desired and estimated z coordinate
 
figure(4),plot(time,pathcoord(3,:));

