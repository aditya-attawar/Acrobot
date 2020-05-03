clear all
clc

syms q1 q2 l1 l2 g J1 J2 M1 M2

GC = {q1,q2};

th1 = q1;
th2 = q1 + q2;

x1 = l1*sin(th1);
x1cm = (l1*sin(th1))/2;
x2 = x1 + l2*sin(th2);
x2cm = x1 + (l2*sin(th2))/2;

y1 = -l1*cos(th1);
y1cm = (-l1*cos(th1))/2;
y2 = y1 - l2*cos(th2);
y2cm = y1 - (l2*cos(th2))/2;

dq1 = fulldiff(q1,GC);
dq2 = fulldiff(q2,GC);
dx1 = fulldiff(x1,GC);
dx1cm = fulldiff(x1cm,GC);
dx2 = fulldiff(x2,GC);
dx2cm = fulldiff(x2cm,GC);
dy1 = fulldiff(y1,GC);
dy1cm = fulldiff(y1cm,GC);
dy2 = fulldiff(y2,GC);
dy2cm = fulldiff(y2cm,GC);

dth1 = dq1;
dth2 = dq1 + dq2;


for n=1:length(GC)
    dGC{n} = fulldiff(GC{n},GC);
    d2GC{n} = fulldiff(dGC{n},GC);
end

T =  0.5*M2*(dx2cm^2 + dy2cm^2) + 0.5*J1*dth1^2 ...
         + 0.5*J2*dth2^2;
V = 0.5*M1*g*y1cm + 0.5*M2*g*y2cm;

L = T - V;

for n=1:length(GC)
    LHS{n} = fulldiff(diff(L,dGC{n}),GC) - diff(L,GC{n});
end

for n=1:length(GC)
    LHS{n} = simplify(expand(LHS{n}));
end

for n=1:2
    for m=1:2
        D(m,n) = jacobian(LHS{m},d2GC{n});
    end
end

d2q1 = 0; d2q2 = 0;

for m=1:2
    C(m,1) = simplify(eval(LHS{m}));  
end

D
C
