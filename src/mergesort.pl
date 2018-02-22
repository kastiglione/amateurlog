mergesorted(As, [], As).
mergesorted([], Bs, Bs).
mergesorted([A|As], [B|Bs], [A|Rec]) :- A =< B, mergesorted(As, [B|Bs], Rec).
mergesorted([A|As], [B|Bs], [B|Rec]) :- A > B, mergesorted([A|As], Bs, Rec).

subdivide([], []).
subdivide([A|As], [[A]|Xs]) :- subdivide(As, Xs).

combine([As|[]], As).
combine([As,Bs|Rest], Result) :- mergesorted(As, Bs, Sorted), combine([Sorted|Rest], Result).

mergesort(As, Result) :- subdivide(As, Divided), combine(Divided, Result).
