%code generation
%mapping function
function X = map(X0, n)
%map generation:
    R0=[0;
        0;
        0;];
    R1=[1 5E-05 -9.625E-09;
        0 1 -0.000385;
        0 0 1;];
    R2=[0 0 0 0 0 0;
        0 0 0 0 0 0;
        0 0 0 0 0 0;];
    R3=[0 0 0 0 0 0 0 -1.875E-09 6.41666666666667E-13 -6.17604166666667E-17;
        0 0 0 0 0 0 0 -7.5E-05 3.85E-08 -4.94083333333333E-12;
        0 0 0 0 0 0 0 0 -5E-05 9.625E-09;];
    R4=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];
    R5=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.25E-13 -6.41666666666667E-17 1.17338782892795E-20 -7.52838521155274E-25;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.5E-09 -5.13333333333334E-12 1.17344791666667E-15 -9.0355123009527E-20;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.375E-09 -1.60416666666667E-12 1.54401041666667E-16;];
    R6=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];
    R7=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1.015625E-17 6.97745810112847E-21 -1.88057217321398E-24 2.33665804914808E-28 -1.12385674007227E-32;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -8.125E-13 6.978125E-16 -2.25730538161133E-19 3.27323526644339E-23 -1.80015450853439E-27;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -4.375E-13 2.36614583333333E-16 -4.41579941052517E-20 2.83336868077919E-24;];

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
