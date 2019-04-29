% Author: Manoj Kumar
% Roll no. 16/CS/010

pkg load dataframe;

# Load CSV file and create a dataframe
df = dataframe('data/Boston_Housing.csv');

# Extract Columns from the dataframe
features = df(:, ['INDUS']); # RM :- Average Number of Rooms 
target = df(:, ['PRICE']); # PRICE :- Median Value of Owner-Occupied homes in $1000's

# Simple Linear Regression
# y_hat = m * X + c

# Dataset
features = features.array();
target = target.array();

# Normalized Features
features = feature_normalized(features);

global n = size(features, 1);

# Train-Test Split
train_size = int32(n * 0.80);

X_train = features(1:train_size, :);
y_train = target(1:train_size);

X_test = features(train_size+1:n, :);
y_test = target(train_size+1:n);

# Weight and Bias
global m;
global c;
m = 0;
c = 1;

# Predict Function
function [y_hat] = predict(X)
  global m;
  global c;
  
  y_hat = m * X + c;
endfunction

# Cost Function
function [cost] = cost_function(X, y)
  cost = 0;
  N = size(X, 1);

  y_hat = predict(X);
  sq_error = (y_hat - y) .^ 2;
  
  cost = sum(sq_error) / (2 * N);
endfunction

# Gradient Function i.e Update Weight and Bias
function gradientDescent(X, y, lr)
  global m;
  global c;
  
  N = size(X, 1);
  
  dm = 0;
  dc = 0;
  
  for i = 1:N
    dm += (-X(i)) * (y(i) - predict(X(i)));
    dc += (-1) * (y(i)- predict(X(i)));
  endfor
  
  dm = dm / N;
  dc = dc / N;
    
  m -= lr * dm;
  c = -lr * dc;
endfunction

# Train function
function [cost_history] = train(X, y, lr, epochs)
  cost_history = [];
  
  for i=1:epochs
    cost_ = 0.0;
    
    cost_ = cost_function(X, y);
    cost_history(i) = cost_;
    
    gradientDescent(X, y, lr);
    
    printf("Iter: %d    Cost: %f \n", i, cost_);
  endfor
endfunction


# Initialize Variables
learning_rate = 0.5;
epochs = 30;

# Fit Simple Linear Regression
hist = train(X_train, y_train, learning_rate, epochs);

# Final Weight and Bias
printf("\nm: %f   c: %f\n", m, c);

# Costs
printf("\nTraining Cost: %f\n", cost_function(X_train, y_train));
printf("Testing Cost: %f\n", cost_function(X_test, y_test));