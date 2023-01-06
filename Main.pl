:- include("tda-functions_20668934K_BarriaRosas").
:- include("tda-image_20668934K_BarriaRosas").
:- include("tda-pix_20668934K_BarriaRosas").
:- include("tda-tools_20668934K_BarriaRosas").

% ----------------- Script de pruebas -------------------
% 
% Para la ejecucion del programa, se debe hacer las consultas desde este archivo,
% debido a que para separar los TDA de mejor manera, se creo un programa modular que
% importa los modulos de los otros archivos .pl a este.
%
% A continuacion hay ejemplos de uso para comprobar la funcionalidad del programa, se debe copiar
% la linea entera desde donde comienza el llamado, hasta el ., tambien, hay más funciones de pruebas
% al final de este script de pruebas, estos ultimos son los dados en el docs del enunciado del
% proyecto realizado
%
% --------- Pruebas para el TDA Image ---------------
%
% Crear una imagen de tipo pixbit:
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I).
%
% Crear una imagen de tipo pixrgb:
% pixrgb( 0, 0, 1, 3, 4, 10, PA), pixrgb( 0, 1, 0, 3, 4, 20, PB), pixrgb( 1, 0, 0, 3, 4, 30, PC), pixrgb( 1, 1, 1, 3, 2, 4, PD), image( 2, 2, [PA, PB, PC, PD], I).
%
% Crear una imagen de tipo pixhex:
% pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I).
%
% --------- Pruebas para TDA de pertenencia -------------
%
% ----- Comprobar que una imagen es de tipo pixbit:
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).
% resultado: imagen
% 
% pixrgb( 0, 0, 1, 3, 4, 10, PA), pixrgb( 0, 1, 0, 3, 4, 20, PB), pixrgb( 1, 0, 0, 3, 4, 30, PC), pixrgb( 1, 1, 1, 3, 2, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).
% resultado: false
%
%
% ------ Comprobar que una imagen es de tipo pixrgb:
%
% pixrgb( 0, 0, 1, 3, 4, 10, PA), pixrgb( 0, 1, 0, 3, 4, 20, PB), pixrgb( 1, 0, 0, 3, 4, 30, PC), pixrgb( 1, 1, 1, 3, 2, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
% resultado: imagen
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
% resultado: false
%
% ------ Comprobar que una imagen es de tipo pixhex:
%
% pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).
% resultado: imagen
%
% pixrgb( 0, 0, 1, 3, 4, 10, PA), pixrgb( 0, 1, 0, 3, 4, 20, PB), pixrgb( 1, 0, 0, 3, 4, 30, PC), pixrgb( 1, 1, 1, 3, 2, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).
% resultado: false
%
% ------- Comprobar si una imagen esta comprimida:
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsCompressed( I ).
% resultado: false
%
% pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsCompressed( I ).
% resultado: false
%
% ----------- Pruebas para TDA de flips -----------
%
% ----------- flipH
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH( I , I2 ).
% resultado: imagen invertida horizontalmente
%
% pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH( I, I2 ).
% resultado: imagen invertida horizontalmente
%
% pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH( I, I2 ).
% resultado: imagen invertida horizontalmente	
%
% ------------ flipV
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV( I, I2 ).
% resultado: imagen invertida verticalmente
%
% pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV( I, I2 ).
% resultado: imagen invertida verticalmente
%
% pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV( I, I2 ).
% resultado: imagen invertida verticalmente
%
%
% ------------- Pruebas para TDA crop ------------
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop( I,0,0,0,1, I2 ).
% resultado: imagen recortada a la mitad horizontalmente
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop( I,0,0,1,1, I2 ).
% resultado: ningun corte
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop( I,0,0,0,0, I2 ).
% resultado: cuarto de imagen
%
% -------------- Pruebas para TDA rgb to hex ----------
%
% pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1), imageRGBToHex( I1, I2).
% resultado: imagen convertida a pixhex
%
% pixrgb( 0, 0, 255, 255, 255, 10, P1), pixrgb( 0, 1, 201, 201, 210, 20, P2), pixrgb( 1, 0, 230, 230, 230, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1), imageRGBToHex( I1, I2).
% resultado: imagen convertida a pixhex
%
% pixrgb( 0, 0, 0, 0, 0, 10, P1), pixrgb( 0, 1, 0, 0, 0, 20, P2), pixrgb( 1, 0, 0, 0, 0, 30, P3), pixrgb( 1, 1, 0, 0, 0, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1), imageRGBToHex( I1, I2).
% resultado: imagen convertida a pixhex
%
% ---------------- Pruebas para tda histograma ----------
% cabe aclarar que el histograma muestra la cantidad de colores de una imagen,
% de la siguiente forma: [color]-[cantidad]
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToHistogram( I, Histograma).
%
% pixhex( 0, 0, "ababab", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ffffff", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToHistogram( I, Histogram).
% 
% pixrgb( 0, 0, 1, 3, 4, 10, PA), pixrgb( 0, 1, 0, 3, 4, 20, PB), pixrgb( 1, 0, 0, 3, 4, 30, PC), pixrgb( 1, 1, 1, 3, 2, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToHistogram( I, Histogram).
%
%
% --------------- Pruebas para TDA Rotate90 ------------------
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90( I, I2).
% resultado: imagen rotada 90 grados  a la derecha
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90( I, I2), imageRotate90( I2, I3).
% resultado: imagen rotada 180 grados
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90( I, I2), imageRotate90( I2, I3), imageRotate90( I3, I4).
% resultado: imagen rotada 270 grados a la derecha ( o 90 grados a la izquierda)
%
% --------------- Pruebas para Change Pixel ----------------
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I1), pixbit( 0, 1, 1, 40, PB_modificado), imageChangePixel(I1, PB_modificado, I2).
% resultado: imagen con el pixel PB modificado
%
% pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I1), pixrgb( 0, 1, 54, 54, 54, 20, P2_modificado), imageChangePixel(I1, P2_modificado, I2).
% resultado: imagen con el pixel P2 modificado
%
% pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I1), pixhex( 0, 1, "666666", 20, PB_modificado), imageChangePixel(I1, PB_modificado, I2).
% resultado: imagen con el pixel PB modificado
%
% --------------- Pruebas para TDA invert color rgb -------------
%
% pixrgb( 0, 1, 20, 20, 20, 20, PA), imageInvertColorRGB(PA, PA_mod).
% resultado: imagen con los valores RGB invertidos(235,235,235)
%
% pixrgb( 0, 1, 40, 40, 40, 20, PA), imageInvertColorRGB(PA, PA_mod).
% resultado: imagen con los valores RGB invertidos(215,215,215)
%
% pixrgb( 0, 1, 0, 0, 0, 20, PA), imageInvertColorRGB(PA, PA_mod).
% resultado: imagen con los valores RGB invertidos(255,255,255)
%
% ---------------- Pruebas para TDA imagen to String -------------
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToString(I, Str), display(Str).
% resultado: String con los valores de las imagenes
% 
% pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I), imageToString(I, Str), display(Str).
% resultado: String con los valores de las imagenes
%
% pixhex( 0, 0, "101001", 10, PA), pixhex( 0, 1, "101001", 20, PB), pixhex( 1, 0, "ababab", 30, PC), pixhex( 1, 1, "ffffff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToString(I, Str), display(Str).
% resultado: String con los valores de las imagenes
%
%
% ----------------- Pruebas propuestas en el Docs ------------------
%
% Probar que se puede generar una imagen pixbit
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap(I), imageToString(I, Str),write(Str).
%
% Probar que imageIsBitMap detecta cuando se tiene una imagen en hex o en rgb.
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).
%
% Estos casos deben dar false:
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).
% pixrgb( 0, 0, 200, 200, 200, 10, PA), pixrgb( 0, 1, 200, 200, 200, 20, PB), pixrgb( 1, 0, 190, 190, 190, 30, PC), pixrgb( 1, 1, 190, 190, 190, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).
%
% Probar que se puede generar una imagen pixhex
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToString(I, Str),write(Str).
%
% Probar que imageIsHexmap detecta cuando se tiene una imagen en bit o en rgb.
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).
%
% Estos casos deben dar false:
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).
% pixrgb( 0, 0, 200, 200, 200, 10, PA), pixrgb( 0, 1, 200, 200, 200, 20, PB), pixrgb( 1, 0, 190, 190, 190, 30, PC), pixrgb( 1, 1, 190, 190, 190, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).
%
% Probar que se puede generar una imagen pixrgb
% pixrgb( 0, 0, 255, 0, 0, 10, PA), pixrgb( 0, 1, 255, 0, 0, 20, PB), pixrgb( 1, 0, 0, 0, 255, 30, PC), pixrgbbit( 1, 1, 0, 0, 255, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToString(I, Str),write(Str).
%
% Probar que imageIsPixmap detecta cuando se tiene una imagen en hex o en bit.
% pixrgb( 0, 0, 200, 200, 200, 10, PA), pixrgb( 0, 1, 200, 200, 200, 20, PB), pixrgb( 1, 0, 190, 190,190, 30, PC), pixrgb( 1, 1, 190, 190, 190, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
%
% Estos casos deben dar false:
%
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
%
% Convierte una imagen RGB a HEX y comprueba con los predicados de pertenencia, luego convierte a string y muestra por pantalla:
% pixrgb( 0, 0, 200, 200, 200, 10, PA), pixrgb( 0, 1, 200, 200, 200, 20, PB), pixrgb( 1, 0, 190, 190,190, 30, PC), pixrgb( 1, 1, 190, 190, 190, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ), imageRGBToHex(I, I2), imageIsHexmap(I2), imageToString(I2, Str), write(Str).
%
% Comprime una imagen, luego descomprime y debe resultar la misma imagen original:
% pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCompress(I, I2), imageDecompress(I2, I3).
% En el ejemplo anterior “I” debería ser igual a “I3”
%
% Si se rota una imagen 4 veces en 90°, debería resultar la imagen original:
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90(I, I2), imageRotate90(I2, I3), imageRotate90(I3, I4), imageRotate90(I4, I5).
% En el ejemplo anterior “I” debería ser igual a “I5”
%
% Si se rota una imagen en 90° que tiene el mismo color y profundidad en todos sus píxeles, entonces la imagen resultante debería ser la misma imagen original.
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90(I, I2).
% En el ejemplo anterior “I” debería ser igual a “I2”
%
% Si se hace imageFlipV dos veces de una imagen, debería resultar la imagen original:
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV(I, I2), imageFlipV(I2, I3).
% En el ejemplo anterior “I” debería ser igual a “I3”
%
% Si se hace imageFlipH dos veces de una imagen, debería resultar la imagen original:
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH(I, I2), imageFlipH(I2, I3).
% En el ejemplo anterior “I” debería ser igual a “I3”
%
% Si se hace imageFlipH a una imagen que tiene el mismo color y profundidad en todos sus pixeles, entonces la imagen resultante debería ser la misma imagen original.
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH(I, I2).
% En el ejemplo anterior “I” debería ser igual a “I2”
%
% Se crea una imagen de 3x3 pixeles y se corta en una de 2x2 con solo la esquina inferior izquierda:
% pixhex( 0, 0, "#FF0000", 10, PA), pixhex( 0, 1, "#FF0000", 20, PB), pixhex( 1, 0, "#0000FF", 30, PC), pixhex( 1, 1, "#0000FF", 4, PD), pixhex( 1, 1, "#0000FF", 4, PE), pixhex( 1, 2, "#0000FF", 4, PF), pixhex( 2, 0, "#0000FF", 4, PG), pixhex( 2, 1, "#0000FF", 4, PH), pixhex( 2, 2, "#0000FF", 4, PI), image( 3, 3, [PA, PB, PC, PD, PE, PF, PG, PH, PI], I), imageCrop( I, 1, 1, 2, 2, I2), pixhex( 0, 0, "#0000FF", 4, PE2), pixhex( 0, 1, "#0000FF", 4, PF2), pixhex( 1, 0, "#0000FF", 4, PH2), pixhex( 1, 1, "#0000FF", 4, PI2), image( 2, 2, [PE2, PF2, PH2, PI2], I3).
% En el ejemplo anterior, “I2” debería ser una imagen con los mismos pixeles y dimensiones que “I3”
%
% Toma el píxel de la posición (0,1) que en la imagen original tiene los valores RGB (20, 20, 20) y lo reemplaza por otro píxel con valor RGB (54, 54, 54).
% pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I1), pixrgb( 0, 1, 54, 54, 54, 20, P2_modificado), imageChangePixel(I1, P2_modificado, I2).
%
% ----------- NO IMPLEMENTADO -----------------
% Se construye imagen de 2x2 con los primeros 2 pixeles con profundidad 10 y los otros 2 con profundidad de 30, entonces al consultar “imageDepthLayers” se debería obtener una lista con dos imágenes.
% pixrgb( 0, 0, 33, 33, 33, 10, PA), pixrgb( 0, 1, 44, 44, 44, 10, PB), pixrgb( 1, 0, 55, 55, 55, 30, PC), pixrgb( 1, 1, 66, 66, 66, 30, PD), image( 2, 2, [PA, PB, PC, PD], I), imageDepthLayers (I, [PRIMERA, SEGUNDA]), pixrgb( 0, 0, 33, 33, 33, 10, PA2), pixrgb( 0, 1, 44, 44, 44, 10, PB2), pixrgb( 1, 0, 255, 255, 255, 10, PC2), pixrgb( 1, 1, 255, 255, 255, 10, PD2), image( 2, 2, [PA2, PB2, PC2, PD2], I2), pixrgb( 0, 0, 255, 255, 255, 30, PA3), pixrgb( 0, 1, 255, 255, 255, 30, PB3), pixrgb( 1, 0, 55, 55, 55, 30, PC3), pixrgb( 1, 1, 66, 66, 66, 30, PD3), image( 2, 2, [PA3, PB3, PC3, PD3], I3).
% En el ejemplo anterior, “I2” debería ser una imagen con los mismos pixeles y dimensiones que “PRIMERA”. “I3” debería ser una imagen con los mismos pixeles y dimensiones que “SEGUNDA”.
% ----------------------------------------------
