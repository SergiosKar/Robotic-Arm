startup_rvc;  
mrobot=robotDef;

[path, pathd, pathdd,pathcoord]=cirTraj(mrobot);
pathcoord=double(pathcoord);
time=[0:8/20:8-(8/20)];
% plot theta 1
figure(1),plot(time,(180/pi)*path(:,1));
ylabel('theta 1 degrees');

% plot theta 2
figure(2),plot(time,(180/pi)*path(:,2));
ylabel('theta 2 degrees');


% plot theta 3
figure(3),plot(time,(180/pi)*path(:,3));
ylabel('theta 3 degrees');


% plot d4
figure(4),plot(time,path(:,4));
ylabel('d4 cm');