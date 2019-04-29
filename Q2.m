% Author: Manoj Kumar
% Roll no. 16/CS/010


% two matrices
a = linspace(0, 30, 5);
b = linspace(0, 25, 5);

% matrices display
disp("a = ");
disp(a);
disp("b = ");
disp(b);

% AND
c = a & b;
disp("a & b");
disp(c);

%  OR
c = a | b;
disp("a | b");
disp(c);

%  EQUALS
c = a == b;
disp("a == b");
disp(c);

% NOT
disp("!a");
disp(!a);

%  XOR
disp("a XOR b");
disp(xor(a, b));