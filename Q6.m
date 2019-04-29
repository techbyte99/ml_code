% Author: Manoj Kumar
% Roll no. 16/CS/010

printf("\n <------- Question 6 --------> \n\n");
printf("Matrix Operations \n\n");

printf(" 3*3 Matrix A \n\n")
A=[1,2,3;4,5,6;7,8,9];
disp(A)

printf("\n3*3 Matrix B \n\n")
B=[11,12,13;14,15,16;17,18,19];
disp(B)

printf("\nAdding Matrix A and B\n\n")
for i = 1:3
  for j = 1:3
    C(i,j) = A(i,j) + B(i,j);
  endfor
endfor

disp(C)

printf("\nSubtracting Matrix A from B\n\n")
for i = 1:3
  for j = 1:3
   D(i,j) = A(i,j) - B(i,j);
  endfor
endfor

disp(D)

for i = 1:3
  for j = 1:3
   E(i,j) = 0;
  endfor
endfor

printf("\nMultiplying Matrix A and B\n\n")
for i = 1:3
  for j = 1:3
    for k=1:3
    E(i,j)+=A(i,k)*B(k,j);
    endfor
  endfor
endfor
disp(E)

printf("\nDisplaying 2nd row of Matrix A\n\n")
for i=1:3
  printf("%d  ",A(2,i))
endfor
printf("\n\n")

printf("\nDisplaying third column of Matrix B\n\n")
for i=1:3
  printf("%d\n",B(i,3))
endfor
printf("\n\n")