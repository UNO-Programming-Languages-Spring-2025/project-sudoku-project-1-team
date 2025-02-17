% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)


% Your implementation please...
row(1..4).
col(1..4).
num(1..4).
subgridsize(2).
subgridlabel(1..4).
subgrid1(X,Y,1):- row(X),row(Y), X <= 2, Y <= 2.
subgrid1(X,Y,2):- row(X),row(Y), X <= 2, Y > 2.
subgrid1(X,Y,3):- row(X),row(Y), X > 2, Y <= 2.
subgrid1(X,Y,4):- row(X),row(Y), X > 2, Y > 2.


%intial (x,y,value)
% Ensure each number appears exactly once in each row
1 { cell(X, Y, N) : col(Y) } 1 :- row(X), num(N).
1 { cell(X, Y, N) : row(X) } 1 :- col(X), num(N).
#show sudoku/3.
