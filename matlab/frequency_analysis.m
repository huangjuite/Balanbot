k1 = -1*(b(1)+b(2))*(2*a(1)+1)/a(1)+1;
k2 = -1*(2*a(1)+1)*(b(1)+b(2))+a(1);

A1 = [0 1 0 0];
A2 = [b(4)/k1 -1*((b(1)+b(2))*a(4)/a(1)+b(3))/k1 0 ((b(1)+b(2))*a(3)/a(1)+b(3))/k1];
A3 = [0 0 0 1];
A4 = [-1*(2*a(1)+1)*b(4)/k2 ((2*a(1)+1)*b(3)+a(4))/k2 0 -1*((2*a(1)+1)*b(3)+a(3))/k2];

B2 = (-b(5)-(b(1)+b(2))*a(5)/a(1))/k1;
B4 = (a(5)+(2*a(1)+1)*b(5))/k2;
A = [A1;A2;A3;A4];
B = [0;B2;0;B4];
C = [1 0 0 0;0 0 1 0];
D = [0;0];

[t1,t2] = ss2tf(A,B,C,D);

%PID for phi
pP=5;
pI=0;
pD=10;
n1=100;

%PID for theta
tP=0.1;
tI=0.03;
tD=0.3;
n2=100;

pcontroller=tf(pP,1)+tf(pI,[1,0])+tf([pD*n1,0],[1,n1]);
tcontroller=tf(tP,1)+tf(tI,[1,0])+tf([tD*n2,0],[1,n2]);
sys2=tf(t1(1,:),t2)
asys2 = sys2*pcontroller;
figure(1)
rlocus(asys2)
