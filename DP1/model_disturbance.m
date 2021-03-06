%% ENGG 5403 Linear System Theory and Design Design Probelm (the UAV parameters with noise and disturbance)
%% LIU Kangcheng     SID:1155113950
clear;
clc;
A=  [0 0 1 0 0 0 0.0009 0 0;
     0 0 0 0.9992 0 0 -0.0389 0 0;
     0 0 -0.0302 -0.0056 -0.0003 585.1165 11.4448 -59.529 0;
     0 0 0 -0.0707 267.7499 -0.0003 0 0 0;
     0 0 0 -1 -3.3607 2.2223 0 0 0;
     0 0 -1 0 2.4483 -3.3607 0 0 0;
     0 0 0.0579 0.0108 0.0049 0.0037 -21.9557 114.2 0;
     0 0 0 0 0 0 -1 0 0;
     0 0 0 0.0389 0 0 0.9992 0 0];
 B=[0 0 0;
    0 0 0;
    0 0 43.3635;
    0 0 0;
    0.2026 2.5878 0;
    2.5878 -0.0663 0;
    0 0 -83.1883;
    0 0 -3.8500;
    0 0 0];
C=[1 0 0 0 0 0 0 0 0;
   0 1 0 0 0 0 0 0 0;
   0 0 1 0 0 0 0 0 0;
   0 0 0 1 0 0 0 0 0;
   0 0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 0 0 1];
D=zeros(6,6);
E=[0 0 0;
   0 0 0;
   -0.0001 0.1756 -0.0395;
   0 0.0003 0.0338;
   0 0 0;
   0 0 0;
   -0.0002 -0.3396 0.6424;
   0 0 0;
   0 0 0];
Ql=eye(9);
Rl=eye(3);
Qe=eye(9);
Re=eye(6);
ge=eye(9);
[K,S,e1] = lqr(A,B,Ql,Rl);
[L,P,e2] = lqr(A',C',Qe,Re);
[l,p,e3] = lqe(A,ge,C,Qe,Re);
M=A-B*K-l*C;
