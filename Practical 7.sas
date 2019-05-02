proc iml;
/*Question 1 */
* F10 = CDF("Gamma", 10, 2, 5);
NormalF10 = CDF("Normal", 10, 0, 6);
gammaf10 = CDF("GAMMA", 10, 2, 5);

e = 0.1;

use data1;
read all var _ALL_ into matrix_a;
close data1;

free fa;
c = ncol(matrix_a);
x = 10;
na = nrow(matrix_a);

do i = 1 to c;
	fa = fa // (ncol(loc(matrix_a[, i] < x))/na);
end;

mean = mean(fa);
var = var(fa);

print mean var;



v = ncol(loc(abs(fa-Normalf10)>0.1));

p_gam = ncol(loc(abs(fa-Gammaf10)>0.1)) / nrow(fa);
p_norm = ncol(loc(abs(fa-Normalf10)>0.1)) / nrow(fa);

print p_gam p_norm v;



quit;
