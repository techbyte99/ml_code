% Author: Manoj Kumar
% Roll no. 16/CS/010





printf("\n <------- Question 11 --------> \n\n");
printf("Vectorized implementation of simple matrix Operations \n\n");

printf(" 3*3 Matrix A \n\n")
A=[1,2,3;4,5,6;7,8,9];
disp(A)

printf("\n 3*3 Matrix B \n\n")
B=[11,12,13;14,15,16;17,18,19];
disp(B)

printf("\nAdding Matrix A and B\n\n")
C=A+B;
disp(C)

printf("\nSubtracting Matrix A from B\n\n")
D=B-A;
disp(D)

printf("\nMultiplying Matrix A and B\n\n")
E=A*B;
disp(E)

printf("\nTranspose of matrix A\n\n")
disp(A')
