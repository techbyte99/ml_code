% Author: Manoj Kumar
% Roll no. 16/CS/010




subplot(2,1,1);
x = linspace(0,10);
y1 = cos(x);
plot(x,y1)
xlabel("x");
ylabel("cos(x)");
title("Plot of cos");
 
subplot(2,1,2); 
y2 = sin(x);
plot(x,y2)
xlabel("x");
ylabel("sin(x)");
title("plot of sin");