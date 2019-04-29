% Author: Manoj Kumar
% Roll no. 16/CS/010



# Create Matrix with linspace
m = [linspace(15, 25, 5); linspace(18, 23, 5); linspace(30, 50, 5)]
 
printf("Absolute values of the matrix\n");
disp(abs(m));
 
printf("Negative of elements in a matrix\n")
display(-1*m);
 
printf("Removing specific rows\n")
display(m(1:2, :));
 
printf("Removing specific columns\n")
display(m(:, 3));
 
printf("Sum of all elements : %f\n", sum(sum(m)));
 
printf("Maximum element of the matrix %d\n", max(max(m)));
printf("Minimum element of the matrix %d\n", min(min(m)));