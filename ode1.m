function dx = ode1(t,X)



q1 = X(1); q2 = X(2);
dq1 = X(3); dq2 = X(4);
params

D = [ M2*l1^2 + M2*cos(q2)*l1*l2 + (M2*l2^2)/4 + J1 + J2,            (M2*l2^2)/4 + (M2*l1*cos(q2)*l2)/2 + J2;
     (M2*l2^2)/4 + (M2*l1*cos(q2)*l2)/2 + J2,                        (M2*l2^2)/4 + J2];

C = [(M2*g*l2*sin(q1 + q2))/4 + (M1*g*l1*sin(q1))/4 + (M2*g*l1*sin(q1))/2 - (M2*dq2^2*l1*l2*sin(q2))/2 - M2*dq1*dq2*l1*l2*sin(q2);
                                                                              (M2*l2*(2*l1*sin(q2)*dq1^2 + g*sin(q1 + q2)))/4];

U = [0;0];

d2X = D\(-C+U);

dx = [X(3);X(4);d2X];

end