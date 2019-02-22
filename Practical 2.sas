/* Question 1 */
proc iml;
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
AOB = 0;
AAB = 0;
A = 0;
B = 0;
probAOB = 0;
probAAB = 0;
probA = 0;
probB = 0;

do i = 1 to 9;
	if sample_space[i, 1] = 2 then A = A + 1;
	if sample_space[i, 2] = 2 then B = B + 1;
	if (sample_space[i, 1] = 2 & sample_space[i, 2] = 2) then AAB = AAB + 1;
	if (sample_space[i, 1] = 2 | sample_space[i, 2] = 2) then AOB = AOB + 1;
end;
probAAB = AAB / nrow(sample_space);
probAOB = AOB / nrow(sample_space);
probA = A / nrow(sample_space);
probB = B / nrow(sample_space);
print sample_space;
print probAAB probAOB probA probB;

if probAOB <= (probA + probB) then print ('Inequality Holds'); else print('Inequality does not hold');
if probAOB = (probA + probB - probAAB) then print ('Equality Holds'); else print('Equality does not hold');

quit;

/* Question 2 */

proc iml;
B1 = randfun(100000000, "binomial", 0.35, 5);
meanb1 = mean(B1);
expectedb1 = 5 * 0.35;
varb1 = var(b1);

b2X = (meanb1 * 2) / 5;
B2 = randfun(100000000, "Binomial", b2X, 5);
meanb2 = mean(b2);
expectedb2 = 5 * b2x;
varb2 = var(b2);

halfVarB1 = varb1/2;

b3x1 = ( 1 + sqrt(1 - 4 * (halfVarB1/5) ) ) / (2);
b3x2 = ( 1 - sqrt(1 - 4 * (halfVarB1/5) ) ) / (3);
b3x = 0;
print b3x1 b3x2;
if b3x1 > b3x2 then b3x = b3x1; else b3x = b3x2;
B3 = randfun(100000000, "Binomial", b3x, 5);
meanb3 = mean(b3);
expectedb3 = 5 * b3x;
varb3 = var(B3);

print meanb1 expectedb1 varb1 meanb2 expectedb2 varb2 meanb3 expectedb3 varb3;
print b2x b3x;


quit;
