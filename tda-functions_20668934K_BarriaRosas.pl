
% --------- Flips -----------

% imageFlipH
% Dominio: image X image
% Recorrido: image
% Permite invertir una imagen Horizontalmente
% example: pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH( I , I2 ).
imageFlipH(Image, Image2):-
    image(Largo, Ancho, Pixels, Image),
    Anchoaux is Ancho-1, 
    (   imageIsBitmap(Image) ->  flipHBit(Anchoaux, Pixels, NewPixels),
    (   image(Largo, Ancho, NewPixels, Image2),!) ;
    (   imageIsHexmap(Image) ->  flipHHex(Anchoaux, Pixels, NewPixels),
    (   image(Largo, Ancho, NewPixels, Image2),!) ;
	(	imageIsPixmap(Image) ->  flipHRGB(Anchoaux, Pixels, NewPixels),
    (   image(Largo, Ancho, NewPixels, Image2),!)))).
    
% Auxiliar en caso de que la imagen sea Pixbit
flipHBit(_, [], []).
flipHBit(Ancho, [Current|Next], [NewCurrent|NewNext]):-
    pixbit(X,Y,Bit,D,Current),
    NewY is Ancho-Y,
    pixbit(X, NewY, Bit,D, NewCurrent),
    flipHBit(Ancho, Next, NewNext).

% Auxiliar en caso de que la imagen sea PixRGB
flipHRGB(_, [], []).
flipHRGB(Ancho, [Current|Next], [NewCurrent|NewNext]):-
    pixrgb(X,Y,R,G,B,D,Current),
    NewY is Ancho-Y,
    pixrgb(X, NewY, R,G,B,D, NewCurrent),
    flipHRGB(Ancho, Next, NewNext).

% Auxiliar en caso de que la imagen sea PixHex
flipHHex(_, [], []).
flipHHex(Ancho, [Current|Next], [NewCurrent|NewNext]):-
    pixhex(X,Y, Hex,D,Current),
    NewY is Ancho-Y,
    pixhex(X, NewY, Hex,D, NewCurrent),
    flipHHex(Ancho, Next, NewNext).

% imageFlipV
% Dominio: image X image
% Recorrido: image
% Permite invertir una imagen Horizontalmente
% Example: pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV( I, I2 ).
imageFlipV(Image, Image2):-
    image(Largo, Ancho, Pixels, Image),
    Largoaux is Largo-1, 
    (   imageIsBitmap(Image) ->  flipVBit(Largoaux, Pixels, NewPixels),
    (   image(Largo, Ancho, NewPixels, Image2),!) ;
    (   imageIsHexmap(Image) ->  flipVHex(Largoaux, Pixels, NewPixels),
    (   image(Largo, Ancho, NewPixels, Image2),!) ;
	(	imageIsPixmap(Image) ->  flipVRGB(Largoaux, Pixels, NewPixels),
    (   image(Largo, Ancho, NewPixels, Image2),!)))).
    
% Auxiliar en caso de que la imagen sea Pixbit
flipVBit(_, [], []).
flipVBit(Largo, [Current|Next], [NewCurrent|NewNext]):-
    pixbit(X,Y,Bit,D,Current),
    NewX is Largo-X,
    pixbit(NewX, Y, Bit,D, NewCurrent),
    flipVBit(Largo, Next, NewNext).

% Auxiliar en caso de que la imagen sea PixRGB
flipVRGB(_, [], []).
flipVRGB(Largo, [Current|Next], [NewCurrent|NewNext]):-
    pixrgb(X,Y,R,G,B,D,Current),
    NewX is Largo-X,
    pixrgb(NewX, Y, R,G,B,D, NewCurrent),
    flipVRGB(Largo, Next, NewNext).

% Auxiliar en caso de que la imagen sea PixHex
flipVHex(_, [], []).
flipVHex(Largo, [Current|Next], [NewCurrent|NewNext]):-
    pixhex(X,Y, Hex,D,Current),
    NewX is Largo-X,
    pixhex(NewX, Y, Hex,D, NewCurrent),
    flipVHex(Largo, Next, NewNext).

% ------------ Crop -------------------

% imageCrop
% Dominio: image X x1 X y1 X x2 X y2 X image
% Recorrido: image modificada
% Permite recortar una imagen segun los parametros dados
% example: pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop( I,0,0,0,1, I2 ).

imageCrop(Image, X1, Y1, X2, Y2, Image2):-
    image(_, _, Pixels, Image),
    NewLargo is Y2-Y1+1,
    NewAncho is X2-X1+1,
    (   imageIsBitmap(Image) ->  cropBit(X1, Y1, X2, Y2, Pixels, NewPixels),
    (   image(NewLargo, NewAncho, NewPixels, Image2),!) ;
    (   imageIsHexmap(Image) ->  cropHex(X1, Y1, X2, Y2, Pixels, NewPixels),
    (   image(NewLargo, NewAncho, NewPixels, Image2),!) ;
    (   imageIsPixmap(Image) ->  cropRGB(X1, Y1, X2, Y2, Pixels, NewPixels),
    (   image(NewLargo, NewAncho, NewPixels, Image2),!)))).

cropBit(_, _, _, _, [], []).
cropBit(X1, Y1, X2, Y2, [Current|Next], [NewCurrent|NewNext]):-
    pixbit(X,Y,Bit,D,Current),
    (   (   X >= X1, Y >= Y1) ->  (   (   X =< X2, Y =< Y2 ) ->  pixbit(X, Y, Bit, D, NewCurrent),
                                      cropBit(X1, Y1, X2, Y2, Next, NewNext); 
                                  cropBit(X1, Y1, X2, Y2, Next, NewNext)); 
    cropBit(X1, Y1, X2, Y2, Next, NewNext)).

cropRGB(_, _, _, _, [], []).
cropRGB(X1, Y1, X2, Y2, [Current|Next], [NewCurrent|NewNext]):-
    pixrgb(X,Y,R,G,B,D,Current),
    (   (   X >= X1, Y >= Y1) ->  (   (   X =< X2, Y =< Y2 ) ->  pixrgb(X, Y, R,G,B, D, NewCurrent),
                                      cropRGB(X1, Y1, X2, Y2, Next, NewNext); 
                                  cropRGB(X1, Y1, X2, Y2, Next, NewNext)); 
    cropRGB(X1, Y1, X2, Y2, Next, NewNext)).

cropHex(_, _, _, _, [], []).
cropHex(X1, Y1, X2, Y2, [Current|Next], [NewCurrent|NewNext]):-
    pixhex(X,Y,Hex,D,Current),
    (   (   X >= X1, Y >= Y1) ->  (   (   X =< X2, Y =< Y2 ) ->  pixhex(X, Y, Hex, D, NewCurrent),
                                      cropHex(X1, Y1, X2, Y2, Next, NewNext); 
                                  cropHex(X1, Y1, X2, Y2, Next, NewNext)); 
    cropHex(X1, Y1, X2, Y2, Next, NewNext)).

% ---------- RGB to Hex ------------

% imageRGBToHex
% Dominio: image[RGB] X image[Hex]
% Recorrido: image
% Permite transformar una imagen de tipo pixrgb a pixhex
% example: pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1), imageRGBToHex( I1, I2).
imageRGBToHex(Image, Image2):-
   image(Largo, Ancho, Pixels, Image),
   toHex(Pixels, NewPixels), image(Largo, Ancho, NewPixels, Image2).

toHex([],[]).
toHex([Current|Next], [NewCurrent|NewNext]):-
    pixrgb(X,Y,R,G,B,D,Current), hex_bytes(Hex, [R,G,B]),
    pixhex(X,Y, Hex, D, NewCurrent), toHex(Next, NewNext).


% --------- Histograma -------------

% imageToHistogram
% Dominio: Image
% Recorrido: Lista con colores presentes, de forma [color]-[cantidad]
% example: pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToHistogram( I, Histograma).
% example2: pixhex( 0, 0, "adasd", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToHistogram( I, Histogram).
% example3: pixrgb( 0, 0, 1, 3, 4, 10, PA), pixrgb( 0, 1, 0, 3, 4, 20, PB), pixrgb( 1, 0, 0, 3, 4, 30, PC), pixrgb( 1, 1, 1, 3, 2, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToHistogram( I, Histogram).
imageToHistogram(Image, Histogram):-
    image(_,_, Pixels, Image),
    (   imageIsBitmap(Image) ->  bithistogram(Pixels, [], Result),
    (   insertsort(Result, Sorted),	clumped(Sorted, Final), histograma(Final, Histogram),!);
    (   imageIsHexmap(Image) ->  hexhistogram(Pixels, [], Result),
    (   clumped(Result, Final), histograma(Final, Histogram),!);
	( 	imageIsPixmap(Image) ->  pixhistogram(Pixels, [], Result),
    (   clumped(Result, Final), histograma(Final, Histogram),!)))).
        
histograma(Lista, Lista).

hexhistogram([],List,Final):- histograma(List, Final).
hexhistogram([Current|Next], List, Final):-
    pixhex(_,_,Hex,_,Current),
    append([Hex], List, Newlist),
    hexhistogram(Next, Newlist, Final).

bithistogram([], List, Final):- histograma(List, Final).
bithistogram([Current|Next], List, Final):-
    pixbit(_,_,Bit,_,Current),
    append([Bit], List, Newlist),
    bithistogram(Next, Newlist, Final).

pixhistogram([], List, Final):- histograma(List, Final).
pixhistogram([Current|Next], List, Final):-
    pixrgb(_,_,R,G,B,_,Current),
    append([[R,G,B]], List, Newlist),
    pixhistogram(Next, Newlist, Final).

% ---------  Rotate 90  -------------

% imageRotate90
% Dominio: image X image
% Recorrido: image rotada
% Permite rotar una imagen 90 grados a la derecha
% Example: pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90( I, I2).
% example2: pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90( I, I2).
% example3: pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90(I, I2), imageRotate90(I2, I3), imageRotate90(I3, I4), imageRotate90(I4, I5).
imageRotate90(Image, Image2):-
    image(Largo, Ancho, Pixels, Image),
    Largoaux is Largo-1,
    Anchoaux is Ancho-1,
    (   imageIsBitmap(Image) ->  rotateBit(Largoaux, Anchoaux, Pixels, NewPixels),
    (   image(Ancho, Largo, NewPixels, Image2),!);
    (   imageIsHexmap(Image) ->  rotateHex(Largoaux, Anchoaux, Pixels, NewPixels),
    (   image(Ancho, Largo, NewPixels, Image2),!);
    (   imageIsPixmap(Image) ->  rotateRGB(Largoaux, Anchoaux, Pixels, NewPixels),
    (   image(Ancho, Largo, NewPixels, Image2),!)))).
    

rotateBit(_, _, [], []).
rotateBit(Largo, Ancho, [Current|Next], [NewCurrent|NewNext]):-
    pixbit(X,Y,Bit,D,Current),
    (   (   X == Y , X == 0) ->  NewX is Largo+X,  pixbit(NewX, Y, Bit,D, NewCurrent), rotateBit(Largo, Ancho, Next, NewNext);
	(   (   X == Largo , Y == Ancho) ->  NewX is 0,  pixbit(NewX, Y, Bit,D, NewCurrent), rotateBit(Largo, Ancho, Next, NewNext);
    (   (   X >= Y , X == Ancho) ->  NewY is Ancho+Y, pixbit(X, NewY, Bit,D, NewCurrent), rotateBit(Largo, Ancho, Next, NewNext);
    (   (   X == Y, X == Largo) ->  NewX is 0, pixbit(NewX, Y, Bit,D, NewCurrent), rotateBit(Largo, Ancho, Next, NewNext);
    (   (   X =< Y, Y == Ancho) ->  NewX is 0, NewY is 0, pixbit(NewX, NewY, Bit,D, NewCurrent), rotateBit(Largo, Ancho, Next, NewNext)))))),
    pixbit(NewX, NewY, Bit,D, NewCurrent),
    rotateBit(Largo, Ancho, Next, NewNext).

rotateRGB(_, _, [], []).
rotateRGB(Largo, Ancho, [Current|Next], [NewCurrent|NewNext]):-
    pixrgb(X,Y,R,G,B,D,Current),
    (   (   X == Y , X == 0) ->  NewX is Largo+X,  pixrgb(NewX, Y, R, G, B,D, NewCurrent), rotateRGB(Largo, Ancho, Next, NewNext);
	(   (   X == Largo , Y == Ancho) ->  NewX is 0,  pixrgb(NewX, Y, R, G, B,D, NewCurrent), rotateRGB(Largo, Ancho, Next, NewNext);
    (   (   X >= Y , X == Ancho) ->  NewY is Ancho+Y, pixrgb(X, NewY, R, G, B,D, NewCurrent), rotateRGB(Largo, Ancho, Next, NewNext);
    (   (   X == Y, X == Largo) ->  NewX is 0, pixrgb(NewX, Y, R, G, B,D, NewCurrent), rotateRGB(Largo, Ancho, Next, NewNext);
    (   (   X =< Y, Y == Ancho) ->  NewX is 0, NewY is 0, pixrgb(NewX, NewY, R, G, B,D, NewCurrent), rotateRGB(Largo, Ancho, Next, NewNext)))))),
    pixrgb(NewX, NewY, R, G, B, D, NewCurrent),
    rotateRGB(Largo, Ancho, Next, NewNext).

rotateHex(_, _, [], []).
rotateHex(Largo, Ancho, [Current|Next], [NewCurrent|NewNext]):-
    pixhex(X,Y,Hex,D,Current),
    (   (   X == Y , X == 0) ->  NewX is Largo+X,  pixhex(NewX, Y, Hex,D, NewCurrent), rotateHex(Largo, Ancho, Next, NewNext);
	(   (   X == Largo , Y == Ancho) ->  NewX is 0,  pixhex(NewX, Y, Hex,D, NewCurrent), rotateHex(Largo, Ancho, Next, NewNext);
    (   (   X >= Y , X == Ancho) ->  NewY is Ancho+Y, pixhex(X, NewY, Hex,D, NewCurrent), rotateHex(Largo, Ancho, Next, NewNext);
    (   (   X == Y, X == Largo) ->  NewX is 0, pixhex(NewX, Y, Hex,D, NewCurrent), rotateHex(Largo, Ancho, Next, NewNext);
    (   (   X =< Y, Y == Ancho) ->  NewX is 0, NewY is 0, pixhex(NewX, NewY, Hex,D, NewCurrent), rotateHex(Largo, Ancho, Next, NewNext)))))),
    pixhex(NewX, NewY, Hex,D, NewCurrent),
    rotateHex(Largo, Ancho, Next, NewNext).

% --------------- Change Pixel -------------

% imageChangePixel
% Dominio: image X pixel X image
% Recorrido: image modificada
% Permite modificar un pixel de una imagen
% Example: pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I1), pixbit( 0, 1, 1, 40, PB_modificado), imageChangePixel(I1, PB_modificado, I2).
% Example2: pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I1), pixrgb( 0, 1, 54, 54, 54, 20, P2_modificado), imageChangePixel(I1, P2_modificado, I2).
% Example3: pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I1), pixhex( 0, 1, "666666", 20, PB_modificado), imageChangePixel(I1, PB_modificado, I2).
imageChangePixel(Image, Mod, Image2):-
    image(Largo, Ancho, Pixels, Image),
    (   imageIsBitmap(Image) ->  pixbit(ModX,ModY, ModBit, ModD, Mod), changeBit(ModX,ModY, ModBit, ModD, Pixels, NewPixels), 
    (   image(Largo, Ancho, NewPixels, Image2),!);
    (   imageIsHexmap(Image) ->  pixhex(ModX,ModY, ModHex, ModD, Mod), changeHex(ModX,ModY, ModHex, ModD, Pixels, NewPixels), 
    (   image(Largo, Ancho, NewPixels, Image2),!) ;
	(	imageIsPixmap(Image) ->  pixrgb(ModX,ModY, ModR, ModG, ModB, ModD, Mod), changeRGB(ModX,ModY, ModR, ModG, ModB, ModD, Pixels, NewPixels), 
    (   image(Largo, Ancho, NewPixels, Image2),!)))).
   
% Auxiliar en caso de que la imagen sea de tipo Pixbit
changeBit(_,_,_,_,[],[]).
changeBit(ModX, ModY, ModBit, ModD, [Current|Next], [NewCurrent|NewNext]):-
    pixbit(X, Y, Bit, D, Current),
    (   (   X == ModX, Y == ModY ) ->  pixbit(X,Y, ModBit, ModD, NewCurrent), changeBit(ModX, ModY, ModBit, ModD, Next, NewNext);
   pixbit(X,Y,Bit,D, NewCurrent), changeBit(ModX, ModY, ModBit, ModD, Next, NewNext) ).

% Auxiliar en caso de que la imagen sea de tipo PixHex
changeHex(_,_,_,_,[],[]).
changeHex(ModX, ModY, ModHex, ModD, [Current|Next], [NewCurrent|NewNext]):-
    pixhex(X, Y, Hex, D, Current),
    (   (   X == ModX, Y == ModY ) ->  pixhex(X,Y, ModHex, ModD, NewCurrent), changeHex(ModX, ModY, ModHex, ModD, Next, NewNext);
   pixhex(X,Y,Hex,D, NewCurrent), changeHex(ModX, ModY, ModHex, ModD, Next, NewNext) ).

% Auxiliar en caso de que la imagen sea de tipo PixRGB
changeRGB(_,_,_,_,_,_,[],[]).
changeRGB(ModX, ModY, ModR, ModG, ModB, ModD, [Current|Next], [NewCurrent|NewNext]):-
    pixrgb(X, Y, R,G,B, D, Current),
    (   (   X == ModX, Y == ModY ) ->  pixrgb(X,Y, ModR, ModG, ModB, ModD, NewCurrent), changeRGB(ModX, ModY, ModR, ModG, ModB, ModD, Next, NewNext);
   pixrgb(X,Y,R,G,B,D, NewCurrent), changeRGB(ModX, ModY, ModR, ModG, ModB, ModD, Next, NewNext) ).
   
% -------------- invertir RGB ------------

% imageInvertColorRGB
% Dominio: Pixrgb
% Recorrido: Pixrgb invertido
% Permite invertir los colores RGB de una imagen de tipo PixRGB
% Example1: pixrgb( 0, 1, 20, 20, 20, 20, PA), imageInvertColorRGB(PA, PA_mod).
% Example2: pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I1), imageInvertColorRGB(P2, P2_modificado), imageChangePixel(I1, P2_modificado, I2).
imageInvertColorRGB(Pixin, Pixout):-
    pixrgb(X,Y,R,G,B,D,Pixin),
    NewR is 255-R,
    NewG is 255-G,
    NewB is 255-B,
    pixrgb(X,Y,NewR,NewG,NewB,D,Pixout).

% --------------- imagen a string ---------------

% imageToString
% Dominio: Image
% Recorrido: String
% Permite pasar una imagen de formato image a String
% example1: pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToString(I, Str), display(Str).

imageToString(Image, Str):-
    image(_,Ancho, Pixels, Image),
    (   imageIsBitmap(Image) ->  bittostring(Pixels, 0, Ancho, Result), atomic_list_concat(Result, Str), write(Str);
	(   imageIsPixmap(Image) ->  rgbtostring(Pixels, 0, Ancho, Result), atomic_list_concat(Result, Str), write(Str);
    (   imageIsHexmap(Image) ->  hextostring(Pixels, 0, Ancho, Result), atomic_list_concat(Result, Str), write(Str)))).
	
bittostring([], _,_,[]).
bittostring([Current|Next], Contador, Ancho, [List|NewList]):-
    pixbit( _, _, Bit, _, Current),
    Contador1 is Contador + 1,
    (   (   Contador1 = Ancho )  ->  atom_concat(Bit, '\n', List), bittostring(Next, 0, Ancho, NewList);
    								 atom_concat(Bit, '\t', List), bittostring(Next, Contador1, Ancho, NewList)).

rgbtostring([], _,_,[]).
rgbtostring([Current|Next], Contador, Ancho, [List|NewList]):-
    pixrgb( _, _, R, G, B, _, Current),
    atom_concat(R, " ", Raux),
    atom_concat(G, " ", Gaux),
    atom_concat(B, " ", Baux),
    atom_concat(Raux, Gaux, Rgbaux),
    atom_concat(Rgbaux, Baux, Rgb),
    Contador1 is Contador + 1,
    (   (   Contador1 = Ancho )  ->  atom_concat(Rgb, '\n', List), rgbtostring(Next, 0, Ancho, NewList);
   									 atom_concat(Rgb, '\t', List), rgbtostring(Next, Contador1, Ancho, NewList)).

hextostring([], _,_,[]).
hextostring([Current|Next], Contador, Ancho, [List|NewList]):-
    pixhex( _, _, Hex, _, Current),
    Contador1 is Contador + 1,
    (   (   Contador1 = Ancho )  ->  atom_concat(Hex, '\n', List), hextostring(Next, 0, Ancho, NewList);
   									 atom_concat(Hex, '\t', List), hextostring(Next, Contador1, Ancho, NewList)).


