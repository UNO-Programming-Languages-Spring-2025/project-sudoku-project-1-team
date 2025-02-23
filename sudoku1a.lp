% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)


% Your implementation please...
% Sudoku Solver for 4x4 grid

% Define the domains for rows, columns, and numbers
#const size=4.
row(1..size).
col(1..size).
num(1..size).
#const subgrid_size=2.
subgridlabel(1..subgrid_size*subgrid_size).

subgrid(X, Y, Label) :- Label = 1+((X - 1) / subgrid_size) * subgrid_size + ((Y - 1) / subgrid_size) , row(X), col(Y).


1 { sodoku(X, Y, N) : num(N) } 1 :- row(X), col(Y).
1 { sodoku(X, Y, N) : col(Y) } 1 :- row(X), num(N).
1 { sodoku(X, Y, N) : row(X) } 1 :- col(Y), num(N).
%1 { sodoku(X, Y, N) : subgrid(X, Y, Label) } 1 :- num(N), subgridlabel(Label).
sodoku(X, Y, N) :- initial(X, Y, N).

#show sodoku/3.

