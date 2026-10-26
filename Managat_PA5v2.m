%% A. TRANSPOSE OPERATIONS
R = [5 -2  0  7;
    1  3 -4  2;
    6  0  8 -1];

Z = [2+3*i, -1+4*i,  5-2*i;
    -3+i,     6,     2+5*i];

transpose(R)
R'
R.'

transpose(Z)
Z'
Z.'

%% Answers to Guide Questions:
% a. Which operations give identical results for the real matrix R?
%     > All three of them have identical results; transpose(R), R', and R.'
%
% b. Which two operations give identical results for the complex matrix Z?
%     > transpose(Z) and Z.' have identical results.
%
% c. What additional operation is performed by the apostrophe operator ' when the matrix contains complex entries?
%     > The Z' is a complex-conjugate transpose, where it swaps the rows and columns and takes the complex conjugate of the entries.


%% B. TWO METHODS FOR A LINEAR SYSTEM
A = [ 2 -1  3  2;
    1  4 -2  1;
    3  2  1 -1;
    -2  3  4  2];

b = [16; -7; 6; 7];

x_inv = inv(A) * b

x_cramer = arrayfun(@(i) det([A(:,1:i-1), b, A(:,i+1:end)]) / det(A), 1:4)'

det_A = det(A)

norm_diff = norm(x_inv - x_cramer)

norm_residual = norm(A * x_inv - b)