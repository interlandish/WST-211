data plotdata;
do i = 0 to 1;
	x1 = i;
	x2 = i;
	fx = x1*x2;
end;
run;

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
proc iml;
start multiomial(n, x1, x2, p1, p1);
x3 = n - x1 - x2;

if x3 > 0 then do;
p3 = 1 - p1 -p2;
fx = (fact(n) * (p1**x1)*(p2**x2)*(p3**x3))/(fact(x1)*fact(x2)*fact(x3));
end;
else fx = 0;
return fx;
finish;

n = 100;
p = {0.5 0.3 0.2};

axis = 0:n;
print axis;

free plotmatrix;

do i = 1 to n+1;
	do j = 1 to n+1;
	plotmatrix = plotmatrix// (multinomial(n, axis[i], axis[j], p[1], p[2],) || axis[i] || axois[j])
	end;
end;

print plotmatrix;

c = {fx x1 x2};

create plotdata from plotmatrix(x=x);
append from plotmatrx;
close plotdata;

samplesize = 1000;
x = {X1 X2 X3};
x = RandMultinomial(samplesize, n, p);

create mn from x[c=c];
append from x;
close MN;
