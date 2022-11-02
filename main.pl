pixbit(X, Y, Bit, Depth, [X, Y, Bit, Depth]).
pixrgb(X, Y, R, G, B, Depth, [X, Y, R, G, B, Depth]).
pixhex(X, Y,Hex, Depth, [X, Y, Hex, Depth]).

pixisbit([X, Y, Bit, Depth]) :-  Bit < 2, Bit >= 0, number(X), number(Y), number(Depth).
pixisrgb(X, Y, R, G, B, Depth, Name) :- number(X), number(Y), R >= 0, R < 256, G >= 0, G < 256, B >= 0, B < 256, number(Depth), var(Name).
pixishex(X, Y, Hex, Depth, Name) :- number(X), number(Y), string(Hex), number(Depth), var(Name).

imageIsBitmap([]).
imageIsBitmap([A,B,[X|T]]) :- pixisbit(X), imageIsBitmap([A,B,T]).


image(Largo, Ancho, Pix, [Largo, Ancho, Pix]).

