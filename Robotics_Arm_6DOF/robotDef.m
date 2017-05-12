function mrobot=robotDef

syms th1 th2 th3 d4;
%//////////robot  d-h////////////
L(1) = Link([th1 0 0 -pi/2 0]);
L(2) = Link([th2 0 0  pi/2 0]); 
L(3) = Link([th3 0 0 0 0]);
L(4) = Link([0 d4 0 0 1]);

m    = 1; 
M    = [  m     m     m    m];
r1  = [0 0 0];
r2=[0 0 0];
r3=[0 0 0];
r4=[0 0 d4/2];
r=0.3;
I1=[0.25*m*r*r  0.25*m*r*r  0.5*m*r*r 0 0 0 ];
I2=[0 0 0  0 0 0 ];
I3=[0.25*m*r*r  0.25*m*r*r  0.5*m*r*r  0 0 0 ];
I4=[m*0.833*(r*r+d4*d4)  m*0.833*(r*r+d4*d4) m*0.833*2*r*r 0 0 0 ];


 L(1).I=I1;
 L(2).I=I2;
 L(3).I=I3;
 L(4).I=I4;

L(1).m=M(1);
L(2).m=M(2);
L(3).m=M(3);
L(4).m=M(4);

 L(1).r=r1;
 L(2).r=r2;
 L(3).r=r3;
 L(4).r=r4;
 
 L(1).Jm =1e-6;
L(2).Jm =  1e-6;
L(3).Jm =  1e-6;
L(4).Jm =  1e-6;

L(1).G =  0;
L(2).G =  0;
L(3).G =  0;
L(4).G =  0;

L(1).B =  1e-3;
L(2).B =  1e-3;
L(3).B =  1e-3;
L(4).B =  13-3;

mrobot = SerialLink(L);
mrobot.name = 'mrobot ';
end
