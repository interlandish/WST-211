* Question 1;
proc iml;
use data1; * data set;
read all var _ALL_ into data_matrix;
close data1;

k = 3;

*call histogram(data_matrix);
y = data_matrix[1:10000,];
sigma = sqrt(var(y));
mean = mean(y);

prob = 0;

do i = 1 to nrow(y);
	if abs(y[i] - mean) >= sigma * k then prob = prob + 1;
end;

final_probability = prob / nrow(y);

print prob final_probability;

quit;
