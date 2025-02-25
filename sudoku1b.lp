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

subgrid(X, Y, 1) :- row(X), col(Y), X <= subgrid_size, Y <= subgrid_size.
subgrid(X, Y, 2) :- row(X), col(Y), X <= subgrid_size, Y > subgrid_size.
subgrid(X, Y, 3) :- row(X), col(Y), X > subgrid_size, Y <= subgrid_size.
subgrid(X, Y, 4) :- row(X), col(Y), X > subgrid_size, Y > subgrid_size.

%putting the example into the loaded field
sudoku(X, Y, N) :- initial(X, Y, N).
%each cell in the grid contains exactly one number.
1{ sudoku(X, Y, N) : num(N) } 1 :- row(X), col(Y).
%enumber appears exactly once in each row.
1{ sudoku(X, Y, N) : col(Y) } 1 :- row(X), num(N).
%each number appears exactly once in each column.
1{ sudoku(X, Y, N) : row(X) }1  :- col(Y), num(N).

%1{ sudoku(X, Y, N) : subgrid(X, Y, Label) } 1 :- num(N), subgridlabel(Label).
#show subgrid/3.
#show sudoku/3.

