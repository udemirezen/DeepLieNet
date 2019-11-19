%code generation
%mapping function
function X = map(X0, n)
%map generation:
    R0=[0;
        0;
        0;];
    R1=[1 1E-17 -3.85E-34;
        0 1 -7.7E-17;
        0 0 1;];
    R2=[0 0 0 0 0 0;
        0 0 0 0 0 0;
        0 0 0 0 0 0;];
    R3=[0 0 0 0 0 0 0 -7.5E-35 4.9896E-51 -9.241087625E-68;
        0 0 0 0 0 0 0 -1.5E-17 1.54E-33 -3.924998E-50;
        0 0 0 0 0 0 0 0 -1E-17 3.85E-34;];
    R4=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];
    R5=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.72E-52 -9.45646625E-68 3.26340024159722E-84 -3.90166766086319E-101;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3E-34 -4.04558E-50 1.81516335E-66 -2.72283858379653E-83;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.75E-34 -1.26177333333333E-50 2.3759726375E-67;];
    R6=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];
    R7=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.491478125E-68 1.91402937152778E-84 -9.55410407447222E-101 2.17472922589719E-117 -1.89348664612991E-134;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -6.3915E-51 1.070186425E-66 -6.71171765553819E-83 1.87414164118324E-99 -1.96956042178101E-116;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -3.43933333333333E-51 3.612503125E-67 -1.30146103801389E-83 1.59985768002691E-100;];

    X = zeros(length(X0), n+1);
    X(:,1) = X0;
    for i=1:n
        X(:, i+1) = mfcalc(X(:,i), R0, R1, R2, R3, R4, R5, R6, R7);
    end
X = X(:, 2:n+1);
end


%one-tune solution
function X = mfcalc(X0, R0, R1, R2, R3, R4, R5, R6, R7)
%initial state:
    x0=X0(1);
    x1=X0(2);
    x2=X0(3);
%calculation of kronecker pows:
    X1=[x0;x1;x2];
    X2=[x0*x0;x0*x1;x0*x2;x1*x1;x1*x2;x2*x2];
    X3=[x0*x0*x0;x0*x0*x1;x0*x0*x2;x0*x1*x1;x0*x1*x2;x0*x2*x2;x1*x1*x1;x1*x1*x2;x1*x2*x2;x2*x2*x2];
    X4=[x0*x0*x0*x0;x0*x0*x0*x1;x0*x0*x0*x2;x0*x0*x1*x1;x0*x0*x1*x2;x0*x0*x2*x2;x0*x1*x1*x1;x0*x1*x1*x2;x0*x1*x2*x2;x0*x2*x2*x2;x1*x1*x1*x1;x1*x1*x1*x2;x1*x1*x2*x2;x1*x2*x2*x2;x2*x2*x2*x2];
    X5=[x0*x0*x0*x0*x0;x0*x0*x0*x0*x1;x0*x0*x0*x0*x2;x0*x0*x0*x1*x1;x0*x0*x0*x1*x2;x0*x0*x0*x2*x2;x0*x0*x1*x1*x1;x0*x0*x1*x1*x2;x0*x0*x1*x2*x2;x0*x0*x2*x2*x2;x0*x1*x1*x1*x1;x0*x1*x1*x1*x2;x0*x1*x1*x2*x2;x0*x1*x2*x2*x2;x0*x2*x2*x2*x2;x1*x1*x1*x1*x1;x1*x1*x1*x1*x2;x1*x1*x1*x2*x2;x1*x1*x2*x2*x2;x1*x2*x2*x2*x2;x2*x2*x2*x2*x2];
    X6=[x0*x0*x0*x0*x0*x0;x0*x0*x0*x0*x0*x1;x0*x0*x0*x0*x0*x2;x0*x0*x0*x0*x1*x1;x0*x0*x0*x0*x1*x2;x0*x0*x0*x0*x2*x2;x0*x0*x0*x1*x1*x1;x0*x0*x0*x1*x1*x2;x0*x0*x0*x1*x2*x2;x0*x0*x0*x2*x2*x2;x0*x0*x1*x1*x1*x1;x0*x0*x1*x1*x1*x2;x0*x0*x1*x1*x2*x2;x0*x0*x1*x2*x2*x2;x0*x0*x2*x2*x2*x2;x0*x1*x1*x1*x1*x1;x0*x1*x1*x1*x1*x2;x0*x1*x1*x1*x2*x2;x0*x1*x1*x2*x2*x2;x0*x1*x2*x2*x2*x2;x0*x2*x2*x2*x2*x2;x1*x1*x1*x1*x1*x1;x1*x1*x1*x1*x1*x2;x1*x1*x1*x1*x2*x2;x1*x1*x1*x2*x2*x2;x1*x1*x2*x2*x2*x2;x1*x2*x2*x2*x2*x2;x2*x2*x2*x2*x2*x2];
    X7=[x0*x0*x0*x0*x0*x0*x0;x0*x0*x0*x0*x0*x0*x1;x0*x0*x0*x0*x0*x0*x2;x0*x0*x0*x0*x0*x1*x1;x0*x0*x0*x0*x0*x1*x2;x0*x0*x0*x0*x0*x2*x2;x0*x0*x0*x0*x1*x1*x1;x0*x0*x0*x0*x1*x1*x2;x0*x0*x0*x0*x1*x2*x2;x0*x0*x0*x0*x2*x2*x2;x0*x0*x0*x1*x1*x1*x1;x0*x0*x0*x1*x1*x1*x2;x0*x0*x0*x1*x1*x2*x2;x0*x0*x0*x1*x2*x2*x2;x0*x0*x0*x2*x2*x2*x2;x0*x0*x1*x1*x1*x1*x1;x0*x0*x1*x1*x1*x1*x2;x0*x0*x1*x1*x1*x2*x2;x0*x0*x1*x1*x2*x2*x2;x0*x0*x1*x2*x2*x2*x2;x0*x0*x2*x2*x2*x2*x2;x0*x1*x1*x1*x1*x1*x1;x0*x1*x1*x1*x1*x1*x2;x0*x1*x1*x1*x1*x2*x2;x0*x1*x1*x1*x2*x2*x2;x0*x1*x1*x2*x2*x2*x2;x0*x1*x2*x2*x2*x2*x2;x0*x2*x2*x2*x2*x2*x2;x1*x1*x1*x1*x1*x1*x1;x1*x1*x1*x1*x1*x1*x2;x1*x1*x1*x1*x1*x2*x2;x1*x1*x1*x1*x2*x2*x2;x1*x1*x1*x2*x2*x2*x2;x1*x1*x2*x2*x2*x2*x2;x1*x2*x2*x2*x2*x2*x2;x2*x2*x2*x2*x2*x2*x2];
%solution:
    X=R0+R1*X1+R2*X2+R3*X3+R4*X4+R5*X5+R6*X6+R7*X7;
end
