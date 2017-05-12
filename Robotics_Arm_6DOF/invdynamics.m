function Q=invdynamics(mrobot,q,qd,qdd)

%check for singularities 
  G = mrobot.gravload(q); %gravity 
 
  M = mrobot.inertia(q); %inertia matrix
   
  C = mrobot.coriolis(q, qd);%coriols  
  
  
  Q=M * qdd' + C * qd' + G'; %euler-Lagrange
 Q = mrobot.rne(q, qd, qdd);


   
 end
