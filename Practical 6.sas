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


*Alternative ;

proc iml;

start function(x, theta);
	if x >= 0 then
		fx = (1 / theta) * exp(-x / theta);
	else 
		fx = 0;
	return fx;
finish;



do j = 1 to 3;

	grid_sizes = { 1 0.1 0.01 };
	vector = (0:(100/grid_sizes[j]) )/ (1 /grid_sizes[j]);
	current_grid = grid_sizes[j];
	area_1 = 0;
	area_2 = 0;
	total_area = 0;

	do i = 1 to (ncol(vector) - 1);
		 width = vector[2] - vector[1];
		 midpoint = (vector[i] + vector[i+1]) / 2;
		 area_1 = area_1 + (width * function(midpoint, 2)); 
		 area_2 = area_2 + (width * function(midpoint, 3)); 
	end;
	* area_1 = function(1, 2);
	* area_2 = function(1, 3);
	total_area = area_1 * area_2;
	print  "Grid Size" current_grid total_area;
end;
