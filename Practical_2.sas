proc iml;


first_number = J(3, 1, .);
second_number = J(3, 1, .);
final_number = J(3, 1, .);
do index = 1 to 3;
	first_number[index] = floor(randfun(1, "uniform", 1, 4));
	second_number[index] = floor(randfun(1, "uniform", 1, 4));
	final_number[index] = first_number[index] + second_number[index];
end;
sample_space = {1	1,
				1	2,
				1	3,
				2	1,
				2	2,
				2	3,
				3	1,
				3	2,
				3	3
				};
c = sample_space[2, 2];
print sample_space c;
quit;


proc iml;

sample_space = {
				1	1, 
				1	2,
				1	3,
				2	1,
				2	2,
				2	3,
				3	1,
				3	2,
				3	3
				};

do i = 0 to 3;
	do j = 1 to 3;
	s = s // (i || j);
	end;
end;

connta = 0;
countb = 0;
countaorb = 0;
countaandb = 0;
do m = 1 to nrow(s);
if s[m, 1] = 2 then counta = counta + 1;
if s[m, 2] = 2 then countb = countb = countb + 1;
if (s[m, 2] = 2 | s[m, 1] = 2 ) then countaorb = countaorb +1;
if( s[m, 1] = 2 & s[m, 2] = 2) then countaandb = countaandb + 1;

pa = counta / nrows(s);
pb = countb / nrows(s);
paorb = countaorb / nrows(s);
paandb = countaandb / nrows(s);



quit;
