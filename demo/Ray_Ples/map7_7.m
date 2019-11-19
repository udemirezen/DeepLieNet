%code generation
%mapping function
function X = map(X0, n)
%map generation:
    R0=[0;
        0;
        0;];
    R1=[1 1E-07 -3.85E-14;
        0 1 -7.7E-07;
        0 0 1;];
    R2=[0 0 0 0 0 0;
        0 0 0 0 0 0;
        0 0 0 0 0 0;];
    R3=[0 0 0 0 0 0 0 -7.5E-15 5.13333333333334E-21 -9.87252612500001E-28;
        0 0 0 0 0 0 0 -1.5E-07 1.54E-13 -3.95266666666667E-20;
        0 0 0 0 0 0 0 0 -1E-07 3.85E-14;];
    R4=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];
    R5=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1E-21 -1.024648625E-27 3.73497849083334E-34 -4.76843471540868E-41;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3E-14 -4.10666666666667E-20 1.87669401791667E-26 -2.88784609591042E-33;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.75E-14 -1.28333333333333E-20 2.4695026125E-27;];
    R6=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];
    R7=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.621415625E-28 2.2181534375E-34 -1.1887094395592E-40 2.93027179531394E-47 -2.78912631261125E-54;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -6.5E-21 1.11563342916667E-26 -7.20882556117014E-33 2.08658938528131E-39 -2.28857200282752E-46;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -3.5E-21 3.78239079166667E-27 -1.40974508247222E-33 1.80480564742309E-40;];

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
