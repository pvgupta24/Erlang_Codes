%%%-------------------------------------------------------------------
%%% @author Praveen Gupta
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. May 2017 04:08
%%%-------------------------------------------------------------------
-module(complexCalc).
-import(math,[atan/1,cos/1,sin/1,sqrt/1]).
-author("Praveen Gupta").

%% API
-export([add/4,subtract/4,multiply/4,divide/4,arg/1,argInv/1,absolute/1,print/1]).


add(A,B,X,Y)->[A+X,B+Y].

subtract(A,B,X,Y)->add(A,B,-X,-Y).

multiply(A,B,X,Y)->[A*X-B*Y,A*Y+B*X].

divide(A,B,X,Y)->
  Z=multiply(A,B,X,hd(subtract(0,0,Y,Y))),
  Mod=hd(multiply(X,Y,X,hd(subtract(0,0,Y,Y)))),
  [hd(Z)/Mod,hd(tl(Z))/Mod].


arg([R|I])->atan(hd(I)/R)*57.2958.

argInv(X)->[cos(X),sin(X)].

absolute([R|I])->sqrt(hd(multiply(R,hd(I),R,-hd(I)))).

print([R|I])->io:format("~p + ~pi  ~n",[R,hd(I)]).





%---------------------------------------------------------------------------%