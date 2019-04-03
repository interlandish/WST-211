/* Question 1 */
proc iml;

start multinomial(n, x1, x2, p1, p2);
x3 = n - x1 - x2;

if x3 > 0 then do;
	p3 = 1 - p1 -p2;
	fx = (fact(n) * (p1**x1) * (p2**x2) * (p3**x3))/
			(fact(x1) * fact(x2) * fact(x3));
end;
else;
	fx = 0;

return fx;
finish;

n = 100;
p = { 0.5 0.3 0.2 };

axis = 0:n;
print axis;

free plotmatrix;

do i = 1 to n+1;
	do j = 1 to n+1;
		plotmatrix = plotmatrix // (multinomial(n, axis[i], axis[j], p[1], p[2]) || axis[i] || axis[j]);
	end;
end;

c = {fx x1 x2};

create plotdata from plotmatrix[c = c];
append from plotmatrix;
close plotdata;

sample_size = 1000;
c = { X1 X2 X3 };
x = RandMultinomial(sample_size, n, p);
create MN from x[c=c];
append from x;
close MN;

proc template;
define statgraph layoutoverlay3d;
	begingraph;
		entrytitle "Multinomial Density Plot of X1 and X2";
		layout overlay3d / tilt=10 rotate=54
				walldisplay=none cube=false;
				surfaceplotparm x=x1 y=x2 z=fx /
			surfacecolorgradient=fx;
		endlayout;
	endgraph;
end;
run;
proc sgrender data=plotdata template=layoutoverlay3d;
run;


quit;
ods graphics on;
proc kde data=MN;
bivar x1 x2 / bwm=1.5 plots=ContourScatter;
bivar x1 x3 / bwm=1.5 plots=ContourScatter;
bivar x2 x3 / bwm=1.5 plots=ContourScatter;
run;

/* Question 2 */
proc iml;
start hyper( population_n, x1, x2, x3, m1, m2);
	m3 = m1 - m2;
	do i = 1 to 100;
		fx = ( (fact(m1))/(fact(x1) * fact(n - x1))
			(fact(m2))/(fact(x2) * fact(n - x2))
			(fact(m3))/(fact(x3) * fact(n - x3)))
			/ (fact(population_n))/(fact(i) * fact(population_n - i));
	end;
return fx;
finish;

N = 100;
m = { 50 30 20 };

axis = 1:N;
print axis;

free plotdata_2;

do i = 1 to N;
	do j = 1 to N;
		do k = 1 to N;
			plotmatrix_2 = plotmatrix_2 // ( hyper(N, axis[i], axis[j], axis[k], m[1], m[2]) || axis[i] || axis[j] || axis[k]);
		end;
	end;
end;

print plotdata_2


proc iml;
start hyper( population_n, x1, x2, x3, m1, m2);
	m3 = m1 - m2;
	do i = 1 to 100;
		fx = ( (fact(m1))/(fact(x1) * fact(m1 - x1))*
			(fact(m2))/(fact(x2) * fact(m2 - x2))*
			(fact(m3))/(fact(x3) * fact(m3 - x3)))
			/ (fact(population_n))/(fact(i) * fact(population_n - i));
	end;
return fx;
finish;

N = 100;
m = { 50 30 20 };

axis = 1:N;

free plotmatrix_2;

do i = 1 to N;
	do j = 1 to N;
		plotmatrix_2 = plotmatrix_2 // ( hyper(N, axis[i], axis[j], axis[k], m[1], m[2]) || axis[i] || axis[j] || axis[k]);
	end;
end;

print plotmatrix_2;

quit;
