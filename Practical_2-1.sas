proc iml;

sample = randfun(100, "binomial", 0.35, 5);
print sample;
meanb1 = mean(sample);
varb1 = var(sample);

quit;
