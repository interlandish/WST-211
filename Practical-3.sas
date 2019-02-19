

/* Question 1 */
proc iml;
y = randfun(n, "Uniform", 0, 1);
x = J(n, 1, .);
do i = 1 to n;
	if y[i] < 0.2 then x[i] = 0;
	if y[i] >= 0.2 & y[i] < 0.7 then x[i] = 1;
	if y[i] > 0.7 then x[i] = 2;
end;

print y x;
meanX = mean(x);
varianceX = var(x);

print meanX varianceX;

quit;

/* question 2 */
proc iml;

n = 100;
y = randfun(n, "Uniform", 0, 1);
x = J(n, 1, .);
x = J(n, 1, .);
do i = 1 to n;
	if y[i] < 0.55 then x[i] = 0.25;
	if y[i] >= 0.55 & y[i] < 0.68 then x[i] = 0.45;
	if y[i] >= 0.68 & y[i] < 0.9 then x[i] = 0.55;
	if y[i] >= 0.9 then x[i] = 0.95;
end;

print y x;

meanX = mean(x);
varianceX = var(x);

print meanX varianceX;

quit;

/* Question 3 */
proc iml;
n = 100;
y = randfun(n, "Uniform", 0, 1);
x = J(n, 1, .);

do i = 1 to n;
	if y[i] < 0.1 then x[i] = 0;
	if y[i] >= 0.1 & y[i] < 0.5 then x[i] = 0.3;
	if y[i] >= 0.5 then x[i] = y[i];
end;
print y x;

meanX = mean(x);
varianceX = var(x);

print meanX varianceX;

quit;


/* Question 4 */
proc iml;
n = 100;
y = randfun(n, "Uniform", 0, 1);
x = J(n, 1, .);
do i = 1 to n;
	x[i] = y[i] / 2;
end;
print y x;

meanX = mean(x);
varianceX = var(x);

print meanX varianceX;
quit;

/* Question 5 */
proc iml;
n = 100;
y = randfun(n, "Uniform", 0, 1);
x = J(n, 1, .);

do i = 1 to n;
	x[i] = sqrt(y[i]);
end;

print y x;

meanX = mean(x);
varianceX = var(x);

print meanX varianceX;
quit;


/* Question 6 */
proc iml;
n = 100;
y = randfun(n, "Uniform", 0, 1);
x = J(n, 1, .);

do i = 1 to n;
	x[i] = -ln(-y[i]) + 1;
end;

print y x;
quit;
