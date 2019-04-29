
% get the dimensions of array
m = input("Enter the number of rows: ");
n = input("Enter the number of columns: ");

% intialize the matrix with zeros
a = zeros(m:n);

% get the input
for i = 1:n
  for j = 1:m
    a(i, j) = input("Enter elements : ");
   end
end


% display the entered array
disp("Entered array is: ");
disp(a);