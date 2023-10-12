function [excitacionesFinal,excTotal,faLaxpati] = fDistribucionCorrienteLaxpati(CN,nulos,d1,d2)
% Función encargada de buscar las excitaciones necesarias para cumplir con
% los nulos ingresados.
% Parámetros de entrada son: 
%     CN -------------------------------------------> Cantidad de los nulos del diagrama.
%     nulos ----------------------------------------> Coordenadas de los nulos (Eje Theta y Phi)

% Retorna los valores de:
%     excitacionesFinal ----------------------------> Excitaciones necesarias para el
%                                                     Arreglo de Antenas.
%     faLaxpati ------------------------------------> Factor de Arreglo sin
%                                                     Normalizar

tam = size(nulos);
dimN = tam(1);

if CN <= 3
    %NO se hace convolución
    if dimN == 1
        nulos(2,1) = nulos(1,1);
        nulos(2,2) = nulos(1,2);
        nulos(3,1) = nulos(1,1);
        nulos(3,2) = nulos(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        excitacionesFinal = Excitaciones;
        excTotal = Excitaciones;
        faLaxpati = fc;
    elseif dimN == 2
        nulos(3,1) = nulos(1,1);
        nulos(3,2) = nulos(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        excitacionesFinal = Excitaciones;
        excTotal = Excitaciones;
        faLaxpati = fc;
    else 
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        excitacionesFinal = Excitaciones;
        excTotal = Excitaciones;
        faLaxpati = fc;
    end
elseif CN > 3 && CN <=6
    %Se hace 1 convolución
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    factorA1 = fc;
    valoresA1 = Excitaciones;
    excA1 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    nuloExtra1 = [];
    nuloExtra2 = [];
    nuloExtra1(1,1) = nulos(1,1);
    nuloExtra1(1,2) = nulos(1,2);
    nuloExtra2(1,1) = nulos(2,1);
    nuloExtra2(1,2) = nulos(2,2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    restante = dimN - 3;
    if restante == 1
        nulos(2,1) = nuloExtra1(1,1);
        nulos(2,2) = nuloExtra1(1,2);
        nulos(3,1) = nuloExtra2(1,1);
        nulos(3,2) = nuloExtra2(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA2 = Excitaciones;
        excTotal = [valoresA1; valoresA2];
        factorA2 = fc;
        excA2 =  [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(excA1,excA2);
        faLaxpati = factorA1.*factorA2;
    elseif restante == 2
        nulos(3,1) = nuloExtra1(1,1);
        nulos(3,2) = nuloExtra1(1,2);
        [Excitaciones,fc] =fArregloCanonico(nulos,d1,d2);
        valoresA2 = Excitaciones;
        excTotal = [valoresA1; valoresA2];
        factorA2 = fc;
        excA2 =  [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(excA1,excA2);
        faLaxpati = factorA1.*factorA2;
    else 
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA2 = Excitaciones;
        excTotal = [valoresA1; valoresA2];
        factorA2 = fc;
        excA2 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(excA1,excA2);
        faLaxpati = factorA1.*factorA2;
    end
elseif CN > 6 && CN <= 9
    %Se hace 2 convoluciones
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA1 = Excitaciones;
    factorA1 = fc;
    excA1 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    nuloExtra1 = [];
    nuloExtra2 = [];
    nuloExtra1(1,1) = nulos(1,1);
    nuloExtra1(1,2) = nulos(1,2);
    nuloExtra2(1,1) = nulos(2,1);
    nuloExtra2(1,2) = nulos(2,2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA2 = Excitaciones;
    factorA2 = fc;
    excA2 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    restante = dimN - 6;
    primConv = conv2(excA1,excA2);
    if restante == 1
        nulos(2,1) = nuloExtra1(1,1);
        nulos(2,2) = nuloExtra1(1,2);
        nulos(3,1) = nuloExtra2(1,1);
        nulos(3,2) = nuloExtra2(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA3 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3];
        factorA3 = fc;
        excA3 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(primConv,excA3);
        faLaxpati = factorA1.*factorA2.*factorA3;
    elseif restante == 2
        nulos(3,1) = nuloExtra1(1,1);
        nulos(3,2) = nuloExtra1(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA3 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3];
        factorA3 = fc;
        excA3 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(primConv,excA3);
        faLaxpati = factorA1.*factorA2.*factorA3;
    else 
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA3 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3];
        factorA3 = fc;
        excA3 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(primConv,excA3);
        faLaxpati = factorA1.*factorA2.*factorA3;
    end
elseif CN > 9 && CN <= 12
    %Se hace 3 convoluciones
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA1 = Excitaciones;
    factorA1 = fc;
    excA1 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    nuloExtra1 = [];
    nuloExtra2 = [];
    nuloExtra1(1,1) = nulos(1,1);
    nuloExtra1(1,2) = nulos(1,2);
    nuloExtra2(1,1) = nulos(2,1);
    nuloExtra2(1,2) = nulos(2,2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA2 = Excitaciones;
    factorA2 = fc;
    excA2 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    primConv = conv2(excA1,excA2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA3 = Excitaciones;
    factorA3 = fc;
    excA3 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    segConv = conv2(primConv,excA3);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    restante = dimN - 9;
    if restante == 1
        nulos(2,1) = nuloExtra1(1,1);
        nulos(2,2) = nuloExtra1(1,2);
        nulos(3,1) = nuloExtra2(1,1);
        nulos(3,2) = nuloExtra2(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA4 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4];
        factorA4 = fc;
        excA4 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(segConv,excA4);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4;
    elseif restante == 2
        nulos(3,1) = nuloExtra1(1,1);
        nulos(3,2) = nuloExtra1(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA4 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4];
        factorA4 = fc;
        excA4 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(segConv,excA4);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4;
    else 
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA4 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4];
        factorA4 = fc;
        excA4 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(segConv,excA4);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4;
    end
elseif CN > 12 && CN <= 15
    %Se hace 4 convoluciones
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA1 = Excitaciones;
    factorA1 = fc;
    excA1 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    nuloExtra1 = [];
    nuloExtra2 = [];
    nuloExtra1(1,1) = nulos(1,1);
    nuloExtra1(1,2) = nulos(1,2);
    nuloExtra2(1,1) = nulos(2,1);
    nuloExtra2(1,2) = nulos(2,2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA2 = Excitaciones;
    factorA2 = fc;
    excA2 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    primConv = conv2(excA1,excA2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA3 = Excitaciones;
    factorA3 = fc;
    excA3 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    segConv = conv2(primConv,excA3);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA4 = Excitaciones;
    factorA4 = fc;
    excA4 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    terConv = conv2(segConv,excA4);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    restante = dimN - 12;
    if restante == 1
        nulos(2,1) = nuloExtra1(1,1);
        nulos(2,2) = nuloExtra1(1,2);
        nulos(3,1) = nuloExtra2(1,1);
        nulos(3,2) = nuloExtra2(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA5 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5];
        factorA5 = fc;
        excA5 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(terConv,excA5);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5;
    elseif restante == 2
        nulos(3,1) = nuloExtra1(1,1);
        nulos(3,2) = nuloExtra1(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA5 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5];
        factorA5 = fc;
        excA5 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(terConv,excA5);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5;
    else 
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2); 
        valoresA5 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5];
        factorA5 = fc;
        excA5 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(terConv,excA5);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5;
    end
elseif CN > 15 && CN <= 18
    %Se hace 5 convoluciones
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA1 = Excitaciones;
    factorA1 = fc;
    excA1 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    nuloExtra1 = [];
    nuloExtra2 = [];
    nuloExtra1(1,1) = nulos(1,1);
    nuloExtra1(1,2) = nulos(1,2);
    nuloExtra2(1,1) = nulos(2,1);
    nuloExtra2(1,2) = nulos(2,2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA2 = Excitaciones;
    factorA2 = fc;
    excA2 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    primConv = conv2(excA1,excA2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA3 = Excitaciones;
    factorA3 = fc;
    excA3 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    segConv = conv2(primConv,excA3);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA4 = Excitaciones;
    factorA4 = fc;
    excA4 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    terConv = conv2(segConv,excA4);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA5 = Excitaciones;
    factorA5 = fc;
    excA5 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    CuartConv = conv2(terConv,excA5);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    restante = dimN - 15;
    if restante == 1
        nulos(2,1) = nuloExtra1(1,1);
        nulos(2,2) = nuloExtra1(1,2);
        nulos(3,1) = nuloExtra2(1,1);
        nulos(3,2) = nuloExtra2(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA6 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6];
        factorA6 = fc;
        excA6 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(CuartConv,excA6);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6;
    elseif restante == 2
        nulos(3,1) = nuloExtra1(1,1);
        nulos(3,2) = nuloExtra1(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA6 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6];
        factorA6 = fc;
        excA6 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(CuartConv,excA6);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6;
    else 
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA6 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6];
        factorA6 = fc;
        excA6 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(CuartConv,excA6);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6;
    end
elseif CN > 18 && CN <= 21
    %Se hace 6 convoluciones
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA1 = Excitaciones;
    factorA1 = fc;
    excA1 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    nuloExtra1 = [];
    nuloExtra2 = [];
    nuloExtra1(1,1) = nulos(1,1);
    nuloExtra1(1,2) = nulos(1,2);
    nuloExtra2(1,1) = nulos(2,1);
    nuloExtra2(1,2) = nulos(2,2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA2 = Excitaciones;
    factorA2 = fc;
    excA2 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    primConv = conv2(excA1,excA2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA3 = Excitaciones;
    factorA3 = fc;
    excA3 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    segConv = conv2(primConv,excA3);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA4 = Excitaciones;
    factorA4 = fc;
    excA4 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    terConv = conv2(segConv,excA4);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2); 
    valoresA5 = Excitaciones;
    factorA5 = fc;
    excA5 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    cuartConv = conv2(terConv,excA5);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA6 = Excitaciones;
    factorA6 = fc;
    excA6 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    quinConv = conv2(cuartConv,excA6);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    restante = dimN - 18;
    if restante == 1
        nulos(2,1) = nuloExtra1(1,1);
        nulos(2,2) = nuloExtra1(1,2);
        nulos(3,1) = nuloExtra2(1,1);
        nulos(3,2) = nuloExtra2(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA7 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6; valoresA7];
        factorA7 = fc;
        excA7 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(quinConv,excA7);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6.*factorA7;
    elseif restante == 2
        nulos(3,1) = nuloExtra1(1,1);
        nulos(3,2) = nuloExtra1(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA7 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6; valoresA7];
        factorA7 = fc;
        excA7 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(quinConv,excA7);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6.*factorA7;
    else 
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2); 
        valoresA7 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6; valoresA7];
        factorA7 = fc;
        excA7 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(quinConv,excA7);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6.*factorA7;
    end
elseif CN > 21 && CN <= 24
    %Se hace 7 convoluciones
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA1 = Excitaciones;
    factorA1 = fc;
    excA1 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    nuloExtra1 = [];
    nuloExtra2 = [];
    nuloExtra1(1,1) = nulos(1,1);
    nuloExtra1(1,2) = nulos(1,2);
    nuloExtra2(1,1) = nulos(2,1);
    nuloExtra2(1,2) = nulos(2,2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA2 = Excitaciones;
    factorA2 = fc;
    excA2 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    primConv = conv2(excA1,excA2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA3 = Excitaciones;
    factorA3 = fc;
    excA3 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    segConv = conv2(primConv,excA3);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA4 = Excitaciones;
    factorA4 = fc;
    excA4 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    terConv = conv2(segConv,excA4);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA5 = Excitaciones;
    factorA5 = fc;
    excA5 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    cuartConv = conv2(terConv,excA5);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2); 
    valoresA6 = Excitaciones;
    factorA6 = fc;
    excA6 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    quinConv = conv2(cuartConv,excA6);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA7 = Excitaciones;
    factorA7 = fc;
    excA7 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    sextConv = conv2(quinConv,excA7);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    restante = dimN - 21;
    if restante == 1
        nulos(2,1) = nuloExtra1(1,1);
        nulos(2,2) = nuloExtra1(1,2);
        nulos(3,1) = nuloExtra2(1,1);
        nulos(3,2) = nuloExtra2(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA8 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6; valoresA7; valoresA8];
        factorA8 = fc;
        excA8 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(sextConv,excA8);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6.*factorA7.*factorA8;
    elseif restante == 2
        nulos(3,1) = nulos(1,1);
        nulos(3,2) = nulos(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA8 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6; valoresA7; valoresA8];
        factorA8 = fc;
        excA8 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(sextConv,excA8);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6.*factorA7.*factorA8;
    else 
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA8 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6; valoresA7; valoresA8];
        factorA8 = fc;
        excA8 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(sextConv,excA8);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6.*factorA7.*factorA8;
    end
elseif CN > 24 && CN <= 27
    %Se hace 8 convoluciones
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA1 = Excitaciones;
    factorA1 = fc;
    excA1 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    nuloExtra1 = [];
    nuloExtra2 = [];
    nuloExtra1(1,1) = nulos(1,1);
    nuloExtra1(1,2) = nulos(1,2);
    nuloExtra2(1,1) = nulos(2,1);
    nuloExtra2(1,2) = nulos(2,2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA2 = Excitaciones;
    factorA2 = fc;
    excA2 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    primConv = conv2(excA1,excA2);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA3 = Excitaciones;
    factorA3 = fc;
    excA3 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    segConv = conv2(primConv,excA3);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA4 = Excitaciones;
    factorA4 = fc;
    excA4 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    terConv = conv2(segConv,excA4);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA5 = Excitaciones;
    factorA5 = fc;
    excA5 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    cuartConv = conv2(terConv,excA5);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA6 = Excitaciones;
    factorA6 = fc;
    excA6 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    quinConv = conv2(cuartConv,excA6);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA7 = Excitaciones;
    factorA7 = fc;
    excA7 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    sextConv = conv2(quinConv,excA7);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
    valoresA8 = Excitaciones;
    factorA8 = fc;
    excA8 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
    septConv = conv2(sextConv,excA8);
    for quitarFila = 1:1:3
        nulos(1,:) = [];
    end
    restante = dimN - 24;
    if restante == 1
        nulos(2,1) = nuloExtra1(1,1);
        nulos(2,2) = nuloExtra1(1,2);
        nulos(3,1) = nuloExtra2(1,1);
        nulos(3,2) = nuloExtra2(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA9 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6; valoresA7; valoresA8; valoresA9];
        factorA9 = fc;
        excA9 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(septConv,excA9);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6.*factorA7.*factorA8.*factorA9;
    elseif restante == 2
        nulos(3,1) = nuloExtra1(1,1);
        nulos(3,2) = nuloExtra1(1,2);
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA9 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6; valoresA7; valoresA8; valoresA9];
        factorA9 = fc;
        excA9 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(septConv,excA9);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6.*factorA7.*factorA8.*factorA9;
    else 
        [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2);
        valoresA9 = Excitaciones;
        excTotal = [valoresA1; valoresA2; valoresA3; valoresA4; valoresA5; valoresA6; valoresA7; valoresA8; valoresA9];
        factorA9 = fc;
        excA9 = [0 Excitaciones(2) 0; Excitaciones(3) 0 Excitaciones(1);0 Excitaciones(4) 0];
        excitacionesFinal = conv2(septConv,excA9);
        faLaxpati = factorA1.*factorA2.*factorA3.*factorA4.*factorA5.*factorA6.*factorA7.*factorA8.*factorA9;
    end
else
    disp('El programa no llega hasta ese rango.')
    excitacionesFinal = 0;
    faLaxpati = 0;
end
