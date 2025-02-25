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

subgrid(X, Y, Label) :- 
    Label = 1 + ((X - 1) / subgrid_size) * subgrid_size + ((Y - 1) / subgrid_size), 
    row(X), col(Y).

%cell in the grid contains exactly one number.
1 { sudoku(X, Y, N) : num(N) } 1 :- row(X), col(Y).

% number appears exactly once in each row.
1 { sudoku(X, Y, N) : col(Y) } 1 :- row(X), num(N).

% number appears exactly once in each column.
1 { sudoku(X, Y, N) : row(X) } 1 :- col(Y), num(N).

%subgrid checking meaning no number is repeated in the grid
1 { sudoku(X, Y, N) : subgrid(X, Y, Label) } 1 :- num(N), subgridlabel(Label).

% last minute overwritting values with the intial placements
sudoku(X, Y, N) :- initial(X, Y, N).

#show sudoku/3.
