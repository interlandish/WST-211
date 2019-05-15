proc iml;

start f1(y2);
	if(y2 > 0) & y2 < 1 then f = y2;
	if 1 <= y2 & y2 < 2 then f = 2 - y2;
	else f = 0;
	return f;
finish;

start f_x1x2(x1, x2);
	if x1 > 0 & x1 < 1 & x2 > 0 & x2 < 1 then f = 1;
	else f = 0;
	return f;
finish;


y2 = 1.8;
check = f1(y2);

intvec01 = t(80:y2*100)/100;

intvec = intvec01;

h = intvec[2] - intvec[1];
int1 = 0;

do i = 2 to nrow(intvec);
	y1 = (intvec[i] + intvec[i - 1])/2;
	int1 = int1 + h*f_x1x2(y1, y2 - y1);
end;
print int1;




start f_gam(x1, x2, alpha1, alpha2, theta);

if(x1 > 0 & x2 > 0) then 
	f = pdf("gamma", x1, alpha1, theta) * pdf("gamma", x2, alpha2, theta);
	else f = 0;
	return f;
finish;

newAlpha = 2 + 3;
theta = 1;
meany = newAlpha * theta;
MEDIAN = QUANTILE("GAMMA", 0.5, newAlpha, theta);


y2 = meany;

check1 = pdf("Gamma", y2, newAlpha, theta);
print check1;


intvec01 = t(0:y2*100)/100;
intvec = intvec01;

h = intvec[2] - intvec[1];
int1 = 0;

do i = 2 to nrow(intvec);
y1 = (intvec[i] + intvec[i - 1])/2;
int1 = int1 + h * f_gam(y1, y2-y1, 2, 3, 1);
end;
print int1;





