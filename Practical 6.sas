proc iml;

start fx(x, theta);
    fx = (1 / theta) * exp(- (x / theta) );
    return fx;
finish;

vector = (0:500) / 100;
area_1 = 0;
area_2 = 0;


do i = 1 to (ncol(vector) - 1);
    midpoint = (vector[i] + vector[i + 1]) / 2;
	grid_size = vector[2] - vector[1];
    area_1 = area_1 + (grid_size * fx(midpoint, 2));
	* area_2 = area_2 + (grid_size * fx(midpoint, 3));
	
end;
area_2 = fx(1, 3);
final_area = area_1 * area_2;
print final_area;
quit;
