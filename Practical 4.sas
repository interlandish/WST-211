proc iml;
use data2; * data set;
read all var _ALL_ into data_matrix;
close data1;

/*call histogram(data_matrix);
print data_matrix;*/
y = data_matrix[1:10000,];
y_squared = y##2;
y_abs = abs(y);

cheby_sigma = sqrt(var(y));
markov_sigma_1 = sqrt(var(y_abs));
markov_sigma_2 = sqrt(var(y_squared));

cheby_mean = mean(y);
markov_mean_1 = mean(y_abs);
markov_mean_2 = mean(y_squared);

k = 3;
c_1 = k * markov_sigma_1;
c_2 = k * markov_sigma_2;

cheby_upper = 1 / k**2;
markov_upper_1 = markov_mean_1 / c_1;
markov_upper_2 = markov_mean_2 / c_2;

cheby_sum = 0;
markov_sum_1 = 0;
markov_sum_2 = 0;

do i = 1 to nrow(y);
	if abs(y[i] - cheby_mean) >= cheby_sigma * k then cheby_sum = cheby_sum + 1;
	if abs(y[i]) >= c_1 then markov_sum_1 = markov_sum_1 + 1;
	if y[i]**2 >= c_2 then markov_sum_2 = markov_sum_2 + 1;
end;

cheby_prob = cheby_sum / nrow(y);
markov_prob_1 = markov_sum_1 / nrow(y);
markov_prob_2 = markov_sum_2 / nrow(y);


print cheby_prob cheby_upper;
print markov_prob_1 markov_upper_1;
print markov_prob_2 markov_upper_2;

quit;
