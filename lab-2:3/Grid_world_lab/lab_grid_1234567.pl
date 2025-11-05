% define posible move directions (spelt out here in full for clarity)
m(north). 
m(east). 
m(south). 
m(west).

% define valid on grid positions
on_board(p(X,Y)) :- 
    ailp_grid_size(N), 
    between(1,N,X), 
    between(1,N,Y).

% define possible steps (without bounds checking)
pos_step(p(X,Y),north,p(X,Y1)) :- Y1 is Y-1.
pos_step(p(X,Y),east,p(X1,Y)) :- X1 is X+1.
pos_step(p(X,Y),south,p(X,Y1)) :- Y1 is Y+1.
pos_step(p(X,Y),west,p(X1,Y)) :- X1 is X-1.

% define new positions (with bounds checking)
new_pos(P,D,Q) :- on_board(P), pos_step(P,D,Q), on_board(Q).

% see if spiral is complete by checking if all cells are in path
complete(L) :- forall(on_board(P),member(P,L)).

% define a clockwise turn
turn(north,east,clockwise).
turn(east,south,clockwise).
turn(south,west,clockwise).
turn(west,north,clockwise).
% define an anticlockwise turn
turn(D1,D2,anticlockwise) :- turn(D2,D1,clockwise).
% Base case: spiral complete
spiral(Ps,Qs,_) :- 
    complete(Ps), !, reverse(Ps,Qs).
    
% Recursive case: continue straight or turn
spiral([Q,P|Ps],Qs,S) :- 
    new_pos(P,D,Q), 
    (C=D ; turn(D,C,S)), 
    new_pos(Q,C,R), 
    \+ member(R,[P|Ps]), 
    spiral([R,Q,P|Ps],Qs,S).

% Wrapper predicate
spiral(Ps) :- 
    my_agent(A), 
    get_agent_position(A,P), 
    new_pos(P,_,Q), 
    spiral([Q,P],Ps,_).

