
 sl_drivepoint;
 xg=[2,2];
%  
vepath=out.find('yout');
plot(vepath(:,1),vepath(:,2));
xlabel('x (m)');
ylabel('y (m)');
 
 
 
  [newpath newpathd newpathdd newpathcoord]=cirTrajwithmob(mrobot,vepath);
  newpathcoord=double(newpathcoord);
  
  time=[0:8/20:8-(8/20)];
  plot(time,newpathcoord(1,:),'red');hold on;
 
 
 qreal=jointcontrol(mrobot,newpath,newpathd,newpathdd,GenQ);

for i=1:20
T=mrobot.fkine(qreal(i,:));
realcoord(:,i)=[T(1,4) T(2,4) T(3,4)]';

end
 
