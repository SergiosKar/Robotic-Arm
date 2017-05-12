startup_rvc;  
mrobot=robotDef;
syms th1 th2 th3 d4 th1d th2d th3d d4d th1dd th2dd th3dd d4dd;
 qn=[ th1 th2 th3 d4];
 qd=[th1d th2d th3d d4d ];
qdd=[th1dd th2dd th3dd d4dd ];
 Q=invdynamics(mrobot,qn,qd,qdd);