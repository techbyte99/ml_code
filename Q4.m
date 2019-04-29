% Author: Manoj Kumar
% Roll no. 16/CS/010


arr=[1,2,3,4,5];
disp(arr)

printf("\nsingle dimensional array of all zeros - zero1 \n\n")
zero = zeros(1,5);
disp(zero)

printf("\nsingle dimensional array of all ones - one1 \n\n")
one = ones(1,5);
disp(one)

printf("\nsingle dimensional array of random values b/w 0 to 20 - rand1 \n\n")
rand1 = 20*rand(1,1);
disp(rand1)

printf("multi dimensional array (Matrix) - matrix \n\n")
matrix=[1,2,3;4,5,6;7,8,9];
disp(matrix)

printf("\n multi dimensional array of all zeros - zeroMat \n\n")
zeroMat = zeros(4,5);
disp(zeroMat)

printf("\nmulti dimensional array of all ones - oneMat \n\n")
oneMat = ones(4,5);
disp(oneMat)

printf("\nmulti dimensional array of random values b/w 0 to 20 - randMat \n\n")
randMat = 20*rand(1,1);
disp(randMat)

printf("\nIdentity Matrix - Identity \n\n")
Identity = eye(5);
disp(Identity)

printf("\nDiagonal Matrix - Diagonal \n\n")
x=[1,2,3,4,5];
Diagonal = diag(x);
disp(Diagonal)