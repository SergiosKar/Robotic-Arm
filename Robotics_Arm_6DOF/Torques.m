 startup_rvc;  
mrobot=robotDef;
syms th1 th2 th3 d4 th1d th2d th3d d4d th1dd th2dd th3dd d4dd;
 qn=[ th1 th2 th3 d4];
 qd=[th1d th2d th3d d4d ];
qdd=[th1dd th2dd th3dd d4dd ];
 Q=invdynamics(mrobot,qn,qd,qdd);
  time=[0:8/20:8-(8/20)];
  plot(time,GenQ(:,1),'yellow');
  hold on;
  plot(time,GenQ(:,2),'blue');
  hold on;
  plot(time,GenQ(:,3),'green');
  hold on;
  plot(time,GenQ(:,4),'red');
  ylabel('Torques (N*cm)');
  xlabel('Time (s)')