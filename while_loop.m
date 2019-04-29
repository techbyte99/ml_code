
a = linspace(34, 100, 10);

i = 1;
sum = 0;
while (i <= 10)
  sum = sum + a(i);
  i++;
endwhile

disp("A =");
disp(a);

disp("The sum of elements in A is: ");
disp(sum);