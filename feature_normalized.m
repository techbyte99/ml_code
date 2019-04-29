function [X_norm] = feature_normalized(X)
  X_norm = X;
  
  mu = zeros(1, size(X, 2));
  sigma = zeros(1, size(X, 2));
  
  mu = mean(X);
  sigma = std(X);
  
  for i = 1:size(X, 2)
    X_norm(:, i) = (X(:, i) - mu(i)) / sigma(i);
  endfor
endfunction