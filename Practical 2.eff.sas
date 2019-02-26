proc iml;
*Question 1;
sample_space = {
				1 1,
				1 2,
				1 3,
				2 1,
				2 2,
				2 3,
				3 1,
				3 2,
				3 3
				};
print sample_space;

A = 0;
B = 0;
AUB = 0;
AnB = 0;

do i = 1 to nrow(sample_space);
	if sample_space[i, 1] = 2 then A = A + 1;
	if sample_space[i, 2] = 2 then B = B + 1;
	if sample_space[i, 1] = 2 & sample_space[i, 2] = 2 then AnB = AnB + 1;
	if sample_space[i, 1] = 2 | sample_space[i, 2] = 2 then AUB = AUB + 1;
end;

PAUB = AUB / nrow(sample_space);
PAnB = AnB / nrow(sample_space);
PA = A / nrow(sample_space);
PB = B / nrow(sample_space);

print PA PB PAUB PAnB;

if PAUB <= PA + PB then print "Inequality Holds"; else print "Inequality does not hold";
if PAUB = PA + PB - PAnB then print "Equality Holds"; else print "Equality does not hold";

quit;
proc iml;
*Question 2.1;
n = 10000000;

B1 = randfun(n, "Binomial", 0.35, 5);
MeanB1 = mean(B1);
VarB1 = var(B1);

B2x = (meanB1 * 2) / 5;

B2 = randfun(n, "Binomial", B2x, 5);
MeanB2 = mean(B2);
VarB2 = var(B2);

B3x1 = (-(-5)+sqrt((-5)**2-4*(5)*(varB1/2))) / (2*(5));
B3x2 = (-(-5)-sqrt((-5)**2-4*(5)*(varB1/2))) / (2*(5));
B3x = 0;
if B3x1 > B3x2 then B3x = B3x1; else B3x = B3x2;

B3 = randfun(n , "Binomial", B3x, 5);
MeanB3 = mean(B3);
VarB3 = var(B3);

print MeanB1 VarB1 MeanB2 VarB2 MeanB3 VarB3;

*Question 1.2;
N1 = randfun(n, "Normal", 0, 1);
MeanN1 = mean(N1);
VarN1 = var(N1);

N2 = randfun(n, "Normal", 3, 1);
MeanN2 = mean(N2);
VarN2 = var(N2);

N3 = randfun(n, "Normal", 0, 4);
MeanN3 = mean(N3);
VarN3 = var(N3);


print MeanN1 VarN1 MeanN2 VarN2 MeanN3 VarN3;

quit;
