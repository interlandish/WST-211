proc iml;

A = {1, 2, 3, 4};
B = {2, 5, 1, 7};
C = {5, 3, 4, 6};

*Question 1.1;
AUB = union(A, B);
*Question 1.2;
AnB = xsect(A, B);
AnBnC = xsect(AnB, C);
*Question 1.3;
BnotA = setdif(B, A);
*Question 1.4;
AnotB = setdif(A, B);
AnotBnC = xsect(AnotB, C);
*Question 1.5;
CSquared = C##2;
AUCSquared = union(A, CSquared);
print AUB;
print AnBnC;
print BnotA;
print AnotBnC;
print AUCSquared;
quit;
proc iml;

*Question 2;

D = do(0.1, 0.9, 0.1);
E = do(0.6, 1.1, 0.1);
F = do(1.1, 1.4, 0.1);

*Question 2.1;
DUE = union(D, E);
*Question 2.2;
DnE = xsect(D, E);
*Question 2.3;
DnEUF = union(DnE, F);
 
print D;

quit;
