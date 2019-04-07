* Question 1;
proc iml;

* Defining Multinomial Function;
start multinomial(n, x1, x2, p1, p2);
	x3 = n - x1 - x2;
	p3 = 1 - p1 - p2;

	if x3 > 0 then do;
		numerator = fact(n) * ( p1 ** x1 ) * ( p2 ** x2 ) * ( p3 ** x3);
		denominator = fact(x1) * fact(x2) * fact(x3);
		fx = numerator / denominator;
	end;
	else;
		fx = 0;

	return fx;
finish;

* Parameter List;
n = 100;
p = { 0.5 0.3 0.2 };

axis = 0:n;

free plot_matrix;

do i = 1 to n + 1;
	do j = 1 to n + 1;
		plot_matrix = plot_matrix // ( multinomial(n, axis[i], axis[j], p[1], p[2]) || axis[i] || axis[j] );
	end;
end;

column_names = { fx x1 x2 };

create plot_data from plot_matrix[c = column_names];
append from plot_matrix;
close plot_data;

sample_size = 1000;

x = RandMultinomial( sample_size, n, p);

column_names = { X1 X2 X3 };
create multinomial_data from x[c = column_names];
append from x;
close multinomial_data;

* Creating Density Plot Template;
proc template;
	define statgraph density_plot_template;
		begingraph;
			entrytitle "Multinomial Desntiy Plot of X1 and X2";
			layout overlay3d / tilt = 10 rotate = 54 walldisplay = none cube = false;
			surfaceplotparam x = x1 y = x2 z = fx /	surfacecolorgradient = fx;
			endlayout;
		endgraph;
	end;
run;

* Display Density Plot;
proc sgrender data = plot_data template= density_plot_template;
run;

ods graphics on;
proc kde data = multinomial_data;
bivar x1 x3 / bwm = 1.5 plots = ContourScatter;
bivar x1 x3 / bwm=1.5 plots=ContourScatter;
bivar x2 x3 / bwm=1.5 plots=ContourScatter;
run;

quit;

/* Question 2 */
proc iml;

start extended_hyper(population, sample, x1, x2, m1, m2);
	x3 = sample - x1 - x2;
	m3 = population - m1 - m2;
	if x3 > 0 then do;
		comb_1 = fact(m1) / ( fact(x1) * fact( m1 - x1 ));
		comb_2 = fact(m2) / ( fact(x2) * fact( m2 - x2 ));
		comb_3 = fact(m3) / ( fact(x3) * fact( m3 - x3 ));
		comb_4 = fact(population) / ( fact(sample) * fact( population - sample ));
		fx = (comb_1 * comb_2 * comb_3) / (comb_4);
	end;
	else;
		fx = 0;
	return fx;
finish;

population = 100;
m = { 50 30 20 };
sample = 10;
axis = 0:sample;

free plot_matrix_2;

do i = 1 to sample + 1;
	do j = 1 to sample + 1;
		plot_matrix_2 = plot_matrix_2 // ( extended_hyper(population, sample, axis[i], axis[j], m[1], m[2]) || axis[i] || axis[j] );
	end;
end;

* Question 3;
proc iml;

start func_1(x1, x2);
	if x1 <= 1 & x1 >= 0 & x2 >= 0 & x2 <= 1 then do;
		* fx =  x1**2 * x2**2;
		fx = (1/2) * exp(x1/2) * (1/3) * exp(x2/3);
	end;
	else;
		fx = 0;
	return fx;
finish;

free plot_1;

do i = 0 to 1 by 0.1;
	do j = 0 to 1 by 0.1;
		plot_1 = plot_1 // ( func_1(i, j) || i || j );
	end;
end;

columns = { fx x1 x2 };

create data_1 from plot_1[c = columns];
append from plot_1;
close data_1;

proc template;
define statgraph template_1;
	begingraph;
		entrytitle "Plot or question 3.1";
		layout overlay3d / tilt = 10 rotate = 54 cube = false walldisplay = none;
		surfaceplotparm x = x1 y = x2 z = fx / surfacecolorgradient = fx;
		endlayout;
	endgraph;
end;
run;

proc sgrender data = data_1 template = template_1;
run;

* print plot_matrix_2;
column_names = { fx x1 x2 };

create plot_data_2 from plot_matrix_2[c = column_names];
append from plot_matrix_2;
close plot_data_2;

proc template;
define statgraph density_plot_2;
	begingraph;
		entrytitle "Extended Hypergeometric Density Plot of X1 and X2";
		layout overlay3d / tilt = 10 rotate = 54 walldisplay = none cube = false;
		surfaceplotparm x = x1 y = x2 z = fx / surfacecolorgradient = fx;
		endlayout;
	endgraph;
end;
run;

proc sgrender data = plot_data_2 template = density_plot_2;
run;

quit;
