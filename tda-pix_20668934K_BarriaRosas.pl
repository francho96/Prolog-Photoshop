% ------------- constructor Pixeles ---------------

% pixbit
% Dominio: Pixbit
% Recorrido: Lista
% Permite darle formato a un pixel de tipo Pixbit
pixbit(X, Y, Bit, Depth, [X, Y, Bit, Depth]).

% pixrgb
% Dominio: Pixrgb
% Recorrido: Lista
% Permite darle formato a un pixel de tipo Pixrgb
pixrgb(X, Y, R, G, B, Depth, [X, Y, R, G, B, Depth]).

% pixhex
% Dominio: Pixhex
% Recorrido: Lista
% Permite darle formato a un pixel de tipo Pixhex
pixhex(X, Y,Hex, Depth, [X, Y, Hex, Depth]).

% ------------- funciones de pertenencia -----------------

% imageIsBitmap
% Dominio: image
% Recorrido: Booleano
% Permite saber si la imagen proporcionada es de formato Pixbit
imageIsBitmap(Image) :- image(_,_,Pixels, Image), pixisbit(Pixels).

pixisbit([]).
pixisbit([Pixbit|Next]):- pixbit(X,Y,Bit,D,Pixbit), (Bit == 0; Bit == 1), number(X), number(Y), number(D), pixisbit(Next).

% imageIsPixmap
% Dominio: image
% Recorrido: Booleano
% Permite saber si la imagen proporcionada es de formato PixRGB
% example: pixrgb( 0, 0, 1, 3, 4, 10, PA), pixrgb( 0, 1, 0, 3, 4, 20, PB), pixrgb( 1, 0, 0, 3, 4, 30, PC), pixrgb( 1, 1, 1, 3, 2, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
imageIsPixmap(Image) :- image(_,_,Pixels, Image), pixisrgb(Pixels).

pixisrgb([]).
pixisrgb([Pixrgb|Next]):- pixrgb(X,Y,R,G,B,D,Pixrgb), R >= 0, R < 256, G >= 0, G < 256, B >= 0, B < 256, number(X), number(Y), number(D), pixisrgb(Next).

% imageIsHexmap
% Dominio: image
% Recorrido: Booleano
% Permite saber si la imagen proporcionada es de formato PixHex
% example: pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).
imageIsHexmap(Image) :- image(_,_,Pixels, Image), pixishex(Pixels).

pixishex([]).
pixishex([Pixhex|Next]):- pixhex(X,Y,Hex,D,Pixhex), string(Hex), number(X), number(Y), number(D), pixishex(Next).

% imageIsCompressed
% Dominio: image
% Recorrido: Booleano
% Permite saber si la imagen proporcionada esta comprimida
% example: pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsCompressed( I ).
imageIsCompressed(Image):-
    image(Largo, Ancho, Pixels, Image),
    Dimension is Largo*Ancho,
    isCompressed(Pixels, Contador),
    (   (   Contador > Dimension) ->  image(Largo, Ancho, Pixels, Image)).

isCompressed([],0).
isCompressed([_|Next], Contador):-
    isCompressed(Next, Contadorup), Contador is Contadorup+1.

