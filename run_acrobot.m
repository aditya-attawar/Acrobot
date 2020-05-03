
S = odeset;
S.AbsTol = 1e-9;
S.RelTol = 1e-9;

Xinit = [2*pi/3,pi/6,0,0];

[tout,xout] = ode45(@ode1,[0,10],Xinit,S);

xout(:,1);

out = animate(tout,xout);

