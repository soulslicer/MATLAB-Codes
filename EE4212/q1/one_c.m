clear ; close all; clc
pts = importdata('pts.txt');
pts_prime = importdata('pts_prime.txt');

A=[];
b=[];

for i=1:200,
    
    if (i+3) <= 200,
    A=[
     A;
     pts(i,:),1, 0,0,0,0 0,0,0,0;
     0,0,0,0, pts(i,:),1, 0,0,0,0;
     0,0,0,0, 0,0,0,0, pts(i,:),1;
    ];

    b=[
     b;
     pts_prime(i,1);
     pts_prime(i,2);
     pts_prime(i,3);
    ];
    end;

end;

%x=(A'*A)\(A'*b);

[U,S,V]=svd(A);
s=diag(S);
disp('singular values:'), disp(s')
bt=U'*b;
y=bt(1:12)./s;
x=V*y;

    