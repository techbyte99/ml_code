% Author: Manoj Kumar
% Roll no. 16/CS/010




pkg load dataframe;

# Load CSV file and create a dataframe
df = dataframe('data/admission.csv');

# Extract Columns from the dataframe
features = df(:, ["University_Ranking";"SOP"; "LOR"; "CGPA"]);
target = df(:, ["Chance_of_Admit"]);

# Dataset
features = features.array();
target = target.array();

# m ->  Number of data-points & n-> Number of Features
m = size(features, 1);
n = size(features, 2);

# Weights
weights = ones(n, 1);

# Train-Test Split
train_size = int32(m * 0.80);

X_train = features(1:train_size, :);
y_train = target(1:train_size);

X_test = features(train_size+1:m, :);
y_test = target(train_size+1:m);

% sigmoid function 
function [g] = sigm(z)
  g = zeros(size(z));
  % apply function to all elements in z
  g = arrayfun(@(x) 1/(1+e^-x), z);
endfunction

% function to predict stuff
function [y_hat] = predict(X, W)  
  p = zeros(size(X, 1), 1);
  
  % do the  activation
  y_hat = sigm(X * W);
  p = arrayfun(@(x) ifelse(x >= 0.5, 1, 0), y_hat);
endfunction



function [J] = cost_function(X, y, W, lambda)
  J = 0;
  m = length(y);
  
  h = sigm(X * W);
  J = 1/m * sum(-y .* log(h)  - (1 - y) .* log(1 - h)) + (lambda / (2 * m)) * sum(W(1:end).^2);
endfunction


function [W] = update_weights(X, y, W, lambda, lr)
  m = size(y, 1);
  dW = zeros(size(W));

  y_hat = predict(X, W);
  dW = (1/m * (X' * (y_hat - y))) + (lambda / m) * W;
  
  W = W - (lr * dW);
endfunction

function [cost_history, new_weights] = train(X, y, W, lambda, lr, epochs)
  cost_history = [];
  
  for i=1:epochs
    cost_it = cost_function(X, y, W, lambda);
    W = update_weights(X, y, W, lambda, lr);
    
    cost_history(i) = cost_it;
    
    printf("Iteration: %d   Required Cost: %f \n", i, cost_it);
  endfor
  
  new_weights = W;
endfunction

# Initialize Variables
lambda = 1;
learning_rate = 0.001;
epochs = 20;

[hist, weights] = train(X_train, y_train, weights, lambda, learning_rate, epochs);

printf("\nTraining Cost: %f \n", cost_function(X_train, y_train, weights, lambda));
printf("Testing Cost: %f \n", cost_function(X_test, y_test, weights, lambda));