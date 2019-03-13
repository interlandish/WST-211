proc iml;
use data3; * data set;
read all var _ALL_ into data_matrix;
close data1;

/*call histogram(data_matrix);
print data_matrix;*/

num_values = nrow(data_matrix);
print num_values;
y = data_matrix[1:num_values,];
y_squared = y##2;
y_abs = abs(y);

cheby_sigma = sqrt(var(y));
markov_sigma = sqrt(var(y));

cheby_mean = mean(y);
markov_mean_1 = mean(y_abs);
markov_mean_2 = mean(y_squared);

k = 1;
c = k * markov_sigma;

cheby_upper = 1 / k**2;
markov_upper_1 = markov_mean_1 / c;
markov_upper_2 = markov_mean_2 / c;

cheby_sum = 0;
markov_sum_1 = 0;
markov_sum_2 = 0;

do i = 1 to nrow(y);
	if abs(y[i] - cheby_mean) >= cheby_sigma * k then cheby_sum = cheby_sum + 1;
	if abs(y[i]) >= c then markov_sum_1 = markov_sum_1 + 1;
	if y[i]**2 >= c then markov_sum_2 = markov_sum_2 + 1;
end;

cheby_prob = cheby_sum / nrow(y);
markov_prob_1 = markov_sum_1 / nrow(y);
markov_prob_2 = markov_sum_2 / nrow(y);


print cheby_prob cheby_upper;
print markov_prob_1 markov_upper_1;
print markov_prob_2 markov_upper_2;

quit;
