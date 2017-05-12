function  E=jointcontrol(mrobot,q,qd,qdd,GenQ)

T=linspace(0,8,20);

  KD=[2 4 20 100];
 KP=(KD.*KD)/4;
 
 CF=1;
 R=0.003;
 J=0.01;
 B=0;
 
 %y(1)=x(2)
%  y(2)=-CF*Kp(el)/(R*J)*x(1)+ (R*B +CF^2 +CF*KD(el))/ (R*J)*x(2)...
%      +CF*Kp(el)*Th/(R*J) + CF*KP(el)/(R*J)*Thd+ D/J;
     

 for i=1:20
     disp(i);
    for j=1:4
     f = @(t,x)[x(2);-CF*KP(j)/(R*J)*x(1) - (R*B +CF^2 +CF*KD(j))/ (R*J)*x(2) + CF*KP(j)*q(i,j)/(R*J) + CF*KP(j)/(R*J)*qd(i,j) - GenQ(i,j)/J]; 
       if (i==1)
         [t,x]=ode45(f,[T(i) T(i+1)],[ q(20,j);qd(20,j)]);
         last=length(t);
         E(i,j)=x(last,1);
       end
       if(i<20 && i~=1)
         [t,x]=ode45(f,[T(i) T(i+1)],[ q(i-1,j);qd(i-1,j)]);
         last=length(t);
         E(i,j)=x(last,1);
       end
       if(i==20)
         E(20,j)=E(1,j);
    
       end
    end

 end

