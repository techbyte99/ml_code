% Author: Manoj Kumar
% Roll no. 16/CS/010


% use the dataframe package 
pkg load dataframe;

df = dataframe('data/admission.csv');

features = df(:, [1:end-1]);
labels = df(:, end);

disp(size(features));

# Dataset
features = features.array();
labels = labels.array();

% two layer neural network
global z1 = 0;
global z2 = 0;
global a1 = 0;

function [g] = sigmoid(z)
  g = zeros(size(z));
  g = arrayfun(@(x) 1/(1+e^-x), z);
endfunction

function [gPrime] = sigmoidPrime(z)
  gPrime = zeros(size(z));
  gPrime = arrayfun(@(x) x*(1-x), z);
endfunction

function [yHat] = forward(X, w1, w2)
  global z1;
  global z2;
  global a1;
  
  z1 = X * w1;
  a1 = sigmoid(z1);
  
  z2 = a1 * w2;
  yHat = sigmoid(z2);
endfunction

function [J] = costFuction(X, y, w1, w2)
  y_hat = forward(X, w1, w2);
  
  J = 0.5 * sum((y - y_hat) .^ 2);
endfunction

function [dW1, dW2] = costFunctionPrime(X, y, w1, w2)
  global z1;
  global z2;
  global a1;
  
  y_hat = forward(X, w1, w2);
  
  delta2 = -(y - y_hat) .* sigmoidPrime(z2);
  dW2 = a1' * delta2;
  
  delta1 = (delta2 * w2') .* sigmoidPrime(z1);
  dW1 = X' * delta1; 
endfunction

function [cost_history, w1, w2] = fit_NN(X, y, lr, epochs, w1, w2)
  cost_history = zeros(epochs);
  
  for i=1:epochs
    Error = costFuction(X, y, w1, w2);
    cost_history(i) = Error;
    
    #if (mod(i-1, 10) == 0)
    printf("Iteration: %d, Error rate: %d\n", i, Error);
    #endif
      
    [dJdW1, dJdW2] = costFunctionPrime(X, y, w1, w2);
    
    w1 = w1 - lr * dJdW1;
    w2 = w2 - lr * dJdW2;
  endfor
endfunction

function [y_pred] = predict(X, w1, w2)
  y_pred = forward(X, w1, w2);
endfunction

# --- Neural Network --- #

# m ->  Number of data-points & n-> Number of Features
m = size(features, 1);

# Train-Test Split
train_size = int32(m * 0.80);

X_train = features(1:train_size, :);
y_train = labels(1:train_size);

X_test = features(train_size+1:m, :);
y_test = labels(train_size+1:m);

# Initiating weight matrices
input_layer = size(features, 2);
hidden_layer = 16;
output_layer = 1;

w1 = randn(input_layer, hidden_layer);
w2 = randn(hidden_layer, output_layer);

# Initialize Variables
learning_rate = 0.0001;
epochs = 10;

# Neural Network
[hist, W1, W2] = fit_NN(X_train, y_train, learning_rate, epochs, w1, w2);

printf("\nTesting Cost: %d\n", costFuction(X_test, y_test, W1, W2));
