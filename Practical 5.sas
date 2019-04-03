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
p = { 0.5 0.3 };

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
