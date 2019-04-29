% Author: Manoj Kumar
% Roll no. 16/CS/010

pkg load dataframe;

# Load CSV file and create a dataframe
df = dataframe('data/Boston_Housing.csv');

# Extract Columns from the dataframe
features = df(:, ["CRIM"; "INDUS"; 'RM'; 'AGE'; 'TAX']);
target = df(:, ['PRICE']); # PRICE :- Median Value of Owner-Occupied homes in $1000's

# Simple Linear Regression
# y_hat = W * X

# Dataset
features = features.array();
target = target.array();

# Normalized Features
features = feature_normalized(features);

# Bias Term
bias = ones(size(features, 1), 1);
features = cat(2, features, bias);

n = size(features, 1);
m = size(features, 2);

# Train-Test Split
train_size = int32(n * 0.80);

X_train = features(1:train_size, :);
y_train = target(1:train_size);

X_test = features(train_size+1:n, :);
y_test = target(train_size+1:n);

# Weight and Bias
global W;
W = ones(m, 1);

# Predict Function
function [y_hat] = predict(X)
  global W;
  y_hat = X * W;
endfunction

# Cost Function
function [cost] = cost_function(X, y)
  N = size(X, 1);
  cost = 0;
  
  y_hat = predict(X);
  cost = sum((y_hat - y).^2) / (2 * N);
endfunction

# Gradient Function i.e Update Weight and Bias
function gradientDescent(X, y, lr)
  global W;
  
  N = size(y, 1);
  
  y_hat = predict(X);
  error = y_hat - y;
  dW = sum(error .* X)' / N;
  
  W = W - (lr * dW);
endfunction

# Train function
function [cost_history] = train(X, y, lr, epochs)
  cost_history = [];
  
  for i=1:epochs
    cost_ = cost_function(X, y);
    cost_history(i) = cost_;
    
    gradientDescent(X, y, lr);
    
    printf("Iteration: %d     Required Cost : %f \n", i, cost_);
  endfor
endfunction

# Initialize Variables
learning_rate = 0.2;
epochs = 30;

# Fit Simple Linear Regression
hist = train(X_train, y_train, learning_rate, epochs);

# Costs after Training LR Model
printf("\nTraining Cost: %f \n", cost_function(X_train, y_train));
printf("Testing Cost: %f\n", cost_function(X_test, y_test));