clear ; close all; clc
sonarmap = importdata('sonarmap.mat');

A=[];
b=[];

xarr = [];
yarr = [];
rarr = [];
tarr = [];

rejectcount = 0;
for i=1:size(sonarmap,1),
    
    rejectcount = rejectcount+1;
    if rejectcount<10,
        continue
    end
    if rejectcount==10,
        rejectcount = 0;
    end
    
    x = sonarmap(i,1) - 196;
    y = 479 - sonarmap(i,2);
    r = sonarmap(i,3);
    t = cosd(sonarmap(i,4));
    
    xarr = [xarr x];
    yarr = [yarr y];
    rarr = [rarr r];
    tarr = [tarr t];
    
    A=[
     A;
     x.^2 x*y y.^2 x y 1
     %x.^2 y.^2
    ];

    b=[
     b;
     r.^2
    ];

    %Ax^2+Bxy+Cy^2+Dx+Ey+F=0 

end;

estimated=(A'*A)\(A'*b);

% Compute Error
rejectcount = 0;
recompute = sqrt(A*estimated);
errdata = [];
m = 0;
for i=1:size(sonarmap,1),
    
    rejectcount = rejectcount+1;
    if rejectcount<10,
        continue
    end
    if rejectcount==10,
        rejectcount = 0;
        m = m + 1;
    end
    
    x = sonarmap(i,1) - 196;
    y = 479 - sonarmap(i,2);
    r = sonarmap(i,3);
    
    err = recompute(m) - r;
    errdata = [errdata err]; 
end

figure(1);
plot3(xarr,yarr,rarr)
figure(2);
plot(errdata)
norm(errdata).^2
% [U,S,V]=svd(A);
% s=diag(S);
% disp('singular values:'), disp(s')
% bt=U'*b;
% y=bt(1:12)./s;
% x=V*y;