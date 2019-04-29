% Author: Manoj Kumar
% Roll no. 16/CS/010


arr = [1, 2,3; 4,6,7; 9,10,12];
disp("\nSize of matrix is :") ,disp(size(arr));

% size/length of a particular row/columns
disp("\nSize of 2nd row is :") ,disp(size(arr(2,1:end)));
disp("\nSize of 2nd column is :") ,disp(size(arr(1:end,2)));

% Loading data from a text file
disp("\nLoading data from a text file\n")
filename = 'file.txt';
fid = fopen(filename, 'r');
[x,count] = fscanf(fid, '%f', [10, Inf])
fclose(fid);

% Store matrix data to a text file
save NewFile.txt arr;