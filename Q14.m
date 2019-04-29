% Author: Manoj Kumar
% Roll no. 16/CS/010


pkg load dataframe;

# Load CSV file and create a dataframe
df = dataframe('data/admission.csv');

# Extract Columns from the dataframe
features = df(:, ["University_Ranking";"SOP"; "LOR"; "CGPA"]);
target = df(:, ["Chance_of_Admission"]);

# Dataset
features = features.array();
target = target.array();

% m =  Number of data-points
% n = Number of features
m = size(features, 1);
n = size(features, 2);

# Weights
weights = ones(n, 1);

# Train-Test Split
train_size = int32(m * 0.70);

X_train = features(1:train_size, :);
y_train = target(1:train_size);

X_test = features(train_size+1:m, :);
y_test = target(train_size+1:m);


% activation function
function [g] = sigm(z)
  g = zeros(size(z));
  g = arrayfun(@(x) 1/(1+e^-x), z);
endfunction

function [y_hat] = predict(X, W)  
  p = zeros(size(X, 1), 1);
  
  y_hat = sigm(X * W);
  p = arrayfun(@(x) ifelse(x >= 0.5, 1, 0), y_hat);
endfunction

function [J] = cost_function(X, y, W)
  h = sigm(X * W);
  J = 0;
  m = length(y);
  
  J = 1/m * sum(-y .* log(h)  - (1 - y) .* log(1 - h));
endfunction

function [W] = update_weights(X, y, W, lr)
  m = size(y, 1);
  
  y_hat = predict(X, W);
 
  dW = 1/m * (X' * (y_hat - y));
  W = W - (lr * dW);
endfunction

function [cost_history, new_weights] = train(X, y, W, lr, epochs)
  cost_history = [];
  
  for i=1:epochs
    cost_ = cost_function(X, y, W);
    W = update_weights(X, y, W, lr);
    
    cost_history(i) = cost_;
    
    printf("Iteration: %d   Required  Cost: %f \n", i, cost_);
  endfor
  
  new_weights = W;
endfunction

# Initialize Variables
learning_rate = 0.001;
epochs = 15;

[hist, weights] = train(X_train, y_train, weights, learning_rate, epochs);

printf("\nTraining Cost: %f \n", cost_function(X_train, y_train, weights));
printf("Testing Cost: %f \n", cost_function(X_test, y_test, weights));