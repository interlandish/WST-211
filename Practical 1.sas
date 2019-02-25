data question1;
proc iml;
/*sets not matrices*/
 A = {1,2,3,4};
 B = {2,5,1,7};
 C = {5,3,4,6};


 AuB = union(A,B);   /* union */
 AnB = xsect(A,B);
 AnBnC = xsect(AnB,C);  /* alternatively AnBnC = (A,B,C)_;*/

 BnotA = SETDIF(B,A);  /* ODDER DOES MATTER BnotA(B,A) != AnotB(A,B */
 AnotB = setdif(A,B);  /* no need to print this one out */
 AnotBnC = xsect(AnotB , C);  /* (A - B)nC */
 

 Csqd = C##2 ; /* this is c squaed */
 AuCsqd = union(A,Csqd);  /* A union C squared */


print AuB;
print AnB;
print AnBnC;
PRINT BnotA;
PRINT AnotBnC;
PRINT Asq;
print AuCsqd;

quit;
data question2;
proc iml;

D = {0.1 ,0.2, 0.3 , 0.4 ,0.5 , 0.6 , 0.7, 0.8, 0.9};
E = {0.6,0.7,0.8,0.9,1};
F = {1.1,1.2,1.3,1.4};

DuE = union(D,E);
DnE = xsect(D,E);
EnD = xsect(E,D);
EnDuF = union(EnD,F);

PRINT DuE  DnE  EnD EnDuF ;

quit;



