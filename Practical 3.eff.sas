proc iml;
*General Settings;
n = 10000000;
y = randfun(n, "Uniform", 0, 1);
x = J(n, 1, .);

*Question 1;
do i = 1 to n;
	if y[i] <= 0.2 then x[i] = 0;
	if y[i] > 0.2 & y[i] <= 0.7 then x[i] = 1;
	if y[i] > 0.7 then x[i] = 2;
end;
Mean1 = mean(x);
Var1 = var(x);

*Question 2;
do i = 1 to n;
	if y[i] <= 0.55 then x[i] = 0.25;
	if y[i] > 0.55 & y[i] <= 0.68 then x[i] = 0.45;
	if y[i] > 0.68 & y[i] <= 0.9 then x[i] = 0.55;
	if y[i] > 0.9 then x[i] = 0.95;
end;
Mean2 = mean(x);
Var2 = var(x);

*Question 3;
do i = 1 to n;
	if y[i] <= 0.1 then x[i] = 0;
	if y[i] > 0.1 & y[i] <= 0.5 then x[i] = 0.3;
	if y[i] > 0.5 then x[i] = y[i];
end;
Mean3 = mean(x);
Var3 = var(x);

*Question 4;
do i = 1 to n;
	x[i] = y[i]/2;
end;
Mean4 = mean(x);
Var4 = var(x);

*Question 5;
do i = 1 to n;
	x[i] = sqrt(y[i]);
end;
Mean5 = mean(x);
Var5 = var(x);

*Question 6;
do i = 1 to n;
	x[i] = 1 - log(1 - y[i]);
end;
Mean6 = mean(x);
Var6 = var(x);

print Mean1 Var1;
print Mean2 Var2;
print Mean3 Var3;
print Mean4 Var4;
print Mean5 Var5;
print Mean6 Var6;
quit;


