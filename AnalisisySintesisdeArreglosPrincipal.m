
clear, close all, clc
preg = true;

while preg
    romb = char(9830);
    f = char(8658);
    f2 = char(8594);

    disp(' ');
    disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
    disp('                            ANÁLISIS Y SÍNTESIS DE ARREGLOS LINEALES Y EN EL PLANO                            ');
    disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
    disp('--------------------------------------------------------------------------------------------------------------');
    disp('        1. Análisis');
    disp('        2. Síntesis');
    disp('        3. Salir del programa');
    caso = input('Seleccione su opción: ');                                
    disp('--------------------------------------------------------------------------------------------------------------');

    %MÓDULO DE ANÁLISIS
    switch caso
        case 1            
            close all,                                         
            disp(['                             ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' ANÁLISIS DE ARREGLOS DE ANTENAS ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
            disp('--------------------------------------------------------------------------------------------------------------');
            disp('        1. Arreglos lineales');
            disp('        2. Arreglos en el plano');
            disp('        3. Regresar al menú de inicio');
            caso_especifico = input('Seleccione su opción: ');
            disp('--------------------------------------------------------------------------------------------------------------');

            %Módulo de análisis de arreglos lineales
            switch caso_especifico
                case 1
                    casoAnalisisoSintesis = 1;
                    pTheta = 0;
                    casoSintesisChebyshev = 1;
                    nivelLL = 0;
                    disp(['                             ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' ANÁLISIS DE ARREGLOS LINEALES ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                    disp('--------------------------------------------------------------------------------------------------------------');
                    disp('INTRODUZCA LOS SIGUIENTES DATOS:');
                    N = input('       - El número de elementos en dirección z: ');
                    d = input('       - La distancia inter-elemento del arreglo: ');
                    anguloZ = input('       - El desfasaje entre los elementos del arreglo: ');
                    disp('       - Elija el tipo de distribución de amplitud');
                    disp('          1. Uniforme');
                    disp('          2. No Uniforme');
                    verif = input('        Seleccione: ');
                    disp('--------------------------------------------------------------------------------------------------------------');
                    %CONDICIÓN: Si se ingresa una opción que no es válida
                    while verif > 2 || verif < 1
                      disp("¡LA OPCIÓN NO ES VÁLIDA!"); 
                      disp('        - Por favor, elija de nuevo el tipo de distribución de amplitud');
                      disp('          1. Uniforme');
                      disp('          2. No Uniforme'); 
                      disp('--------------------------------------------------------------------------------------------------------------');
                      verif = input('        Seleccione: ');
                      disp('--------------------------------------------------------------------------------------------------------------');
                    end
                    [Amplitudes] = fDistribucionAmplitudLineal(N, verif);
                    [Fase,anguloZVariacionFase] = fDesfasajeLineal(N,anguloZ,pTheta,d,casoAnalisisoSintesis);
                    disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                    disp('                                                 RESULTADOS                                            ');
                    disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                    [ejeX,ejeY,directividad] = fFactorArregloLineal(N,d,Amplitudes,Fase,anguloZ,anguloZVariacionFase,casoAnalisisoSintesis);
                    [ejeX,ejeY] = fGraficayAnalisisLineal(ejeX,ejeY,d,anguloZ,pTheta,casoAnalisisoSintesis,casoSintesisChebyshev,nivelLL,directividad);

                %Módulo de análisis de arreglos en el plano
                case 2
                    casoAnalisisoSintesis = 1;
                    pTheta = 0;
                    pPhi = 0;
                    disp(['                             ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' ANÁLISIS DE ARREGLOS EN EL PLANO ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                    disp('--------------------------------------------------------------------------------------------------------------');
                    disp("¡IMPORTANTE!"); 
                    disp(['       ',num2str(f),' Los elementos del arreglo están sobre el plano xy.']);
                    disp(['       ',num2str(f),' Se estudian arreglos de perímetro y malla cuadrada.']);
                    disp(['       ',num2str(f),' El número de elementos es igual en ambas dimensiones del plano (Nx = Ny).']);
                    disp(['       ',num2str(f),' La distancia inter-elemento es igual en cada una de las dimensiones del plano (dx = dy).']);
                    disp('--------------------------------------------------------------------------------------------------------------');
                    disp('INTRODUZCA LOS SIGUIENTES DATOS:');
                    N = input('        - El número de elementos en dirección x e y: ');
                    d = input('        - La distancia inter-elemento del arreglo: ');
                    anguloX = input('        - El desfasaje entre elementos en dirección x: ');
                    anguloY = input('        - El desfasaje entre elementos en dirección y: ');
                    disp('        - Elija el tipo de distribución de amplitud');
                    disp('          1. Uniforme');
                    disp('          2. No Uniforme');               
                    verif = input('        Seleccione: ');
                    disp('--------------------------------------------------------------------------------------------------------------');
                   %CONDICIÓN: Si se ingresa una opción que no es válida
                    while verif > 2 || verif < 1
                      disp("¡LA OPCIÓN NO ES VÁLIDA!"); 
                      disp('        - Por favor, elija de nuevo el tipo de distribución de amplitud');
                      disp('          1. Uniforme');
                      disp('          2. No Uniforme'); 
                      disp('--------------------------------------------------------------------------------------------------------------');
                      verif = input('        Seleccione: ');
                      disp('--------------------------------------------------------------------------------------------------------------');
                    end
                    [Amplitudes] = fDistribucionAmplitudPlano(N, verif);
                    %CORTE DE DIAGRAMA
                    opcion = 1;
                    repetir = 5;
                    [angulocorteTheta,angulocortePhi] = fCortesDiagrama(opcion,repetir);
                    %FUNCIONES
                    disp(' ');
                    [Fase] = fDesfasajePlanoXY(N,anguloX,anguloY,pTheta,pPhi,d,casoAnalisisoSintesis);
                    disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                    disp('                                                 RESULTADOS                                            ');
                    disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                    [ejeZ,ejeX,ejeY,directividad] = fFactorDeArregloPlanoXY(N,d,Fase,Amplitudes);
                    [ejeZ,ejeX,ejeY] = fGraficayAnalisisPlano(ejeZ,ejeX,ejeY,N,anguloX,anguloY,pTheta,pPhi,d,angulocorteTheta,angulocortePhi,casoAnalisisoSintesis,verif,directividad);
                    
                case 3        
                otherwise
                    disp(['                                     ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' CASO INCORRECTO ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                    disp('--------------------------------------------------------------------------------------------------------------');
            end
     
        %MÓDULO DE SÍNTESIS
        case 2            
            close all,                                     
            disp(['                             ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' SÍNTESIS DE ARREGLOS DE ANTENAS ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
            disp('--------------------------------------------------------------------------------------------------------------');
            disp('        1. Arreglos lineales'); 
            disp('        2. Arreglos en el plano');
            disp('        3. Regresar al de inicio');
            caso_especifico = input('Seleccione su opción: ');
            disp('--------------------------------------------------------------------------------------------------------------');
            
            %Módulo de síntesis de arreglos lineales
            switch caso_especifico
                case 1
                    disp(['                             ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' SÍNTESIS DE ARREGLOS LINEALES ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                    disp('--------------------------------------------------------------------------------------------------------------');
                    disp("        1. Variación de la fase entre elementos");
                    disp("        2. Dolph-Chebyshev: Nivel Relativo de los lóbulos laterales");
                    disp("        3. Regresar al menú de inicio");
                    casoArreglosLinealesSintesis = input('Seleccione el método de síntesis: ');
                    disp('--------------------------------------------------------------------------------------------------------------');
                  
                %Módulo de variación de la fase entre elementos para arreglos lineales
                switch casoArreglosLinealesSintesis
                    case 1
                        casoAnalisisoSintesis = 2;
                        anguloZ = 0;
                        casoSintesisChebyshev = 1;
                        nivelLL = 0;
                        disp(['                             ', num2str(romb),num2str(romb),num2str(romb),num2str(romb),' VARIACIÓN DE LA FASE ENTRE ELEMENTOS ',num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                        disp('--------------------------------------------------------------------------------------------------------------');
                        disp('INTRODUZCA LOS SIGUIENTES DATOS:');
                        N = input('       - El número de elementos del arreglo: ');
                        d = input('       - La distancia entre elementos del arreglo: ');
                        disp('--------------------------------------------------------------------------------------------------------------');
                        disp("¡IMPORTANTE!"); 
                        disp(['       ',num2str(f),' La posición del lóbulo principal debe estar entre 0° y 180°.']);
                        disp('--------------------------------------------------------------------------------------------------------------');
                        pTheta = input('       - Ingrese la posición del lóbulo principal en theta: ');
                        %Condición: Si se ingresa una posición del lóbulo principal que no esté entre 0° y 180°
                        while ((pTheta < 0) || (pTheta > 180))
                          disp('--------------------------------------------------------------------------------------------------------------');
                          disp("¡LA POSICIÓN NO ES VÁLIDA!"); 
                          disp(['       ',num2str(f),' RECUERDE: la posición del lóbulo principal debe estar entre 0° y 180°.']);
                          disp('--------------------------------------------------------------------------------------------------------------');
                          pTheta = input('       - Ingrese la posición del lóbulo principal en theta: ');
                        end
                        disp('       - Elija el tipo de distribución de amplitud');
                        disp('          1. Uniforme');
                        disp('          2. No Uniforme');
                        verif = input('        Seleccione: ');
                        disp('--------------------------------------------------------------------------------------------------------------');
                        %CONDICIÓN: Si se ingresa una opción que no es válida
                        while verif > 2 || verif < 1
                          disp("¡LA OPCIÓN NO ES VÁLIDA!"); 
                          disp('        - Por favor, elija de nuevo el tipo de distribución de amplitud');
                          disp('          1. Uniforme');
                          disp('          2. No Uniforme'); 
                          disp('--------------------------------------------------------------------------------------------------------------');
                          verif = input('        Seleccione: ');
                          disp('--------------------------------------------------------------------------------------------------------------');
                        end
                        [Amplitudes] = fDistribucionAmplitudLineal(N, verif);
                        disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                        disp('                                                 RESULTADOS                                            ');
                        disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                        [Fase,anguloZVariacionFase] = fDesfasajeLineal(N,anguloZ,pTheta,d,casoAnalisisoSintesis);
                        [ejeX,ejeY,directividad] = fFactorArregloLineal(N,d,Amplitudes,Fase,anguloZ,anguloZVariacionFase,casoAnalisisoSintesis);
                        [ejeX,ejeY] = fGraficayAnalisisLineal(ejeX,ejeY,d,anguloZ,pTheta,casoAnalisisoSintesis,casoSintesisChebyshev,nivelLL,directividad);

                    %Módulo de Dolph-Chebyshev    
                    case 2
                        casoAnalisisoSintesis = 2;
                        anguloZ = 0;
                        casoSintesisChebyshev = 2;
                        disp(['            ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' MÉTODO DE DOLPH-CHEBYSHEV: NIVEL RELATIVO DE LOS LÓBULOS LATERALES ',num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                        disp('--------------------------------------------------------------------------------------------------------------');
                        disp('INTRODUZCA LOS SIGUIENTES DATOS:');
                        N = input('       - El número de elementos del arreglo: ');
                        d = input('       - La distancia entre los elementos del arreglo: ');
                        disp('--------------------------------------------------------------------------------------------------------------');
                        disp("¡IMPORTANTE!"); 
                        disp(['       ',num2str(f),' La posición del lóbulo principal debe estar entre 0° y 180°.']);
                        disp('--------------------------------------------------------------------------------------------------------------');
                        pTheta = input('       - Ingrese la posición del lóbulo principal en theta: ');
                        %Condición: Si se ingresa una posición del lóbulo principal que no esté entre 0° y 180°
                        while ((pTheta < 0) || (pTheta > 180))
                          disp('--------------------------------------------------------------------------------------------------------------');
                          disp("¡LA POSICIÓN NO ES VÁLIDA!"); 
                          disp(['       ',num2str(f),' RECUERDE: la posición del lóbulo principal debe estar entre 0° y 180°.']);
                          disp('--------------------------------------------------------------------------------------------------------------');
                          pTheta = input('       - Ingrese la posición del lóbulo principal en theta: ');
                        end
                        nivelLL = input('       - Ingrese el nivel relativo de lóbulos laterales (dB): ');
                        nivelRelativoAdim = 10^(nivelLL/20);
                        disp('--------------------------------------------------------------------------------------------------------------');
                        disp("¡IMPORTANTE!"); 
                        disp(['       ',num2str(f),' El nivel relativo en escala lineal es ',num2str(nivelRelativoAdim)]);         
                        disp('--------------------------------------------------------------------------------------------------------------');
                        disp(' ');
                        disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                        disp('                                                 RESULTADOS                                            ');
                        disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                        [Amplitudes] = fAmplitudDolphChebyshev(N,nivelLL);
                        [Fase,anguloZVariacionFase] = fDesfasajeLineal(N,anguloZ,pTheta,d,casoAnalisisoSintesis);
                        [ejeX,ejeY,directividad] = fFactorArregloLineal(N,d,Amplitudes,Fase,anguloZ,anguloZVariacionFase,casoAnalisisoSintesis);
                        [ejeX,ejeY] = fGraficayAnalisisLineal(ejeX,ejeY,d,anguloZ,pTheta,casoAnalisisoSintesis,casoSintesisChebyshev,nivelLL,directividad);

                               
                    case 3
                    otherwise
                        disp(['                                     ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' CASO INCORRECTO ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                        disp('--------------------------------------------------------------------------------------------------------------');
                end

                %Módulo de síntesis de arreglos en el plano
                case 2
                    disp(['                             ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' SÍNTESIS DE ARREGLOS EN EL PLANO ',num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                    disp('--------------------------------------------------------------------------------------------------------------');
                    disp("        1. Variación de la fase entre elementos");
                    disp("        2. Dolph-Chebyshev Mejorado: Nivel Relativo de los lóbulos laterales");
                    disp("        3. Laxpati: Especificación de los nulos en el patrón de radiación");
                    disp("        4. Regresar al menú de inicio");
                    casoArreglosPlanoSintesis = input('Seleccione el método de síntesis: ');
                    disp('--------------------------------------------------------------------------------------------------------------');
                    
                    %Módulo de variación de la fase entre elementos para arreglos en el plano
                    switch casoArreglosPlanoSintesis
                        case 1
                            casoAnalisisoSintesis = 2;
                            casoSintesis = 1;
                            anguloY = 0;
                            anguloX = 0;
                            disp(['                             ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' VARIACIÓN DE LA FASE ENTRE ELEMENTOS ' num2str(romb),num2str(romb),num2str(romb),num2str(romb),]);
                            disp('--------------------------------------------------------------------------------------------------------------');
                            disp("¡IMPORTANTE!"); 
                            disp(['       ',num2str(f),' Este método ubica al lóbulo principal en una posición específica del patrón de radiación.']);
                            disp(['       ',num2str(f),' Los elementos del arreglo están sobre el plano xy.']);
                            disp(['       ',num2str(f),' Se estudian arreglos de perímetro y malla cuadrada.']);
                            disp(['       ',num2str(f),' El número de elementos es igual en ambas direcciones (Nx = Ny).']);
                            disp(['       ',num2str(f),' La distancia inter-elemento es igual en ambas direcciones (dx = dy).']);
                            disp('--------------------------------------------------------------------------------------------------------------');
                            disp('INTRODUZCA LOS SIGUIENTES DATOS:');
                            N = input('        - El número de elementos en dirección x e y: ');
                            d = input('        - La distancia inter-elemento del arreglo: ');
                            disp('--------------------------------------------------------------------------------------------------------------');
                            disp("¡IMPORTANTE!"); 
                            disp(['       ',num2str(f),' La posición del lóbulo principal (en theta y en phi) debe estar entre -90° y 90°.']);
                            disp('--------------------------------------------------------------------------------------------------------------');
                            pTheta = input('        - Ingrese la posición del lóbulo principal en theta: ');
                            pPhi = input('        - Ingrese la posición del lóbulo principal en phi: ');
                           %Condición Theta: Si se ingresa una posición del lóbulo principal que no esté entre -90° y 90°
                            while ((pTheta < -90) || (pTheta > 90))
                                disp('--------------------------------------------------------------------------------------------------------------');
                                disp("¡LA POSICIÓN EN THETA NO ES VÁLIDA!"); 
                                disp(['       ',num2str(f),' RECUERDE: la posición del lóbulo principal en theta debe estar entre -90° y 90°.']);
                                disp('--------------------------------------------------------------------------------------------------------------');
                                pTheta = input('       - Ingrese la posición del lóbulo principal en theta: ');
                            end
                            %Condición Phi: Si se ingresa una posición del lóbulo principal que no esté entre -90° y 90°
                            while ((pPhi < -90) || (pPhi > 90))
                                disp('--------------------------------------------------------------------------------------------------------------');
                                disp("¡LA POSICIÓN EN PHI NO ES VÁLIDA!"); 
                                disp(['       ',num2str(f),' RECUERDE: la posición del lóbulo principal en phi debe estar entre -90° y 90°.']);
                                disp('--------------------------------------------------------------------------------------------------------------');
                                pPhi = input('       - Ingrese la posición del lóbulo principal en phi: ');
                            end
                            disp('       - Elija el tipo de distribución de amplitud');
                            disp('          1. Uniforme');
                            disp('          2. No Uniforme');
                            verif = input('        Seleccione: ');
                            disp('--------------------------------------------------------------------------------------------------------------');
                            %CONDICIÓN: Si se ingresa una opción que no es válida
                            while verif > 2 || verif < 1
                                disp("¡LA OPCIÓN NO ES VÁLIDA!"); 
                                disp('        - Por favor, elija de nuevo el tipo de distribución de amplitud');
                                disp('          1. Uniforme');
                                disp('          2. No Uniforme'); 
                                disp('--------------------------------------------------------------------------------------------------------------');
                                verif = input('        Seleccione: ');
                                disp('--------------------------------------------------------------------------------------------------------------');
                            end
                            [Amplitudes] = fDistribucionAmplitudPlano(N, verif);
                            %CORTE DE DIAGRAMA
                            opcion = 1;
                            repetir = 5;
                            [angulocorteTheta,angulocortePhi] = fCortesDiagrama(opcion,repetir);
                            disp(' ');
                            [Fase] = fDesfasajePlanoXY(N,anguloX,anguloY,pTheta,pPhi,d,casoAnalisisoSintesis);
                            disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                            disp('                                                 RESULTADOS                                            ');
                            disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]); 
                            [ejeZ,ejeX,ejeY,directividad] = fFactorDeArregloPlanoXY(N,d,Fase,Amplitudes);
                            [ejeZ,ejeX,ejeY] = fGraficayAnalisisPlano(ejeZ,ejeX,ejeY,N,anguloX,anguloY,pTheta,pPhi,d,angulocorteTheta,angulocortePhi,casoAnalisisoSintesis,verif,directividad);

                        
                        %Módulo de Dolph-Chebyshev Mejorado
                        case 2 
                            anguloX = 0;
                            anguloY = 0;
                            casoAnalisisoSintesis = 2;
                            casoSintesis = 3;
                            disp(['                         ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' DOLPH-CHEBYSHEV MEJORADO ',num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                            disp('--------------------------------------------------------------------------------------------------------------');
                            disp("¡IMPORTANTE!"); 
                            disp(['       ',num2str(f),' Corresponde a Dolph-Chebyshev Modificado ',num2str(f),' método desarrollado por Cheng-Tseng.']);
                            disp(['       ',num2str(f),' Los elementos del arreglo están sobre el plano xy.']);
                            disp(['       ',num2str(f),' Se estudian arreglos de perímetro y malla cuadrada.']);
                            disp(['       ',num2str(f),' El número de elementos es igual en ambas direcciones (Nx = Ny).']);
                            disp(['       ',num2str(f),' La distancia inter-elemento es igual en ambas direcciones (dx = dy).']);
                            disp('--------------------------------------------------------------------------------------------------------------');
                            disp('INTRODUZCA LOS SIGUIENTES DATOS:');
                            N = input('        - El número de elementos en dirección x e y: ');
                            d = input('        - La distancia inter-elemento del arreglo: ');
                            disp('--------------------------------------------------------------------------------------------------------------');
                            disp("¡IMPORTANTE!"); 
                            disp(['       ',num2str(f),' La posición del lóbulo principal (en theta y en phi) debe estar entre -90° y 90°.']);
                            disp('--------------------------------------------------------------------------------------------------------------');
                            pTheta = input('        - Ingrese la posición del lóbulo principal en theta: ');
                            pPhi = input('        - Ingrese la posición del lóbulo principal en phi: ');
                           %Condición Theta: Si se ingresa una posición del lóbulo principal que no esté entre -90° y 90°
                            while ((pTheta < -90) || (pTheta > 90))
                                disp('--------------------------------------------------------------------------------------------------------------');
                                disp("¡LA POSICIÓN EN THETA NO ES VÁLIDA!"); 
                                disp(['       ',num2str(f),' RECUERDE: la posición del lóbulo principal en theta debe estar entre -90° y 90°.']);
                                disp('--------------------------------------------------------------------------------------------------------------');
                                pTheta = input('        - Ingrese la posición del lóbulo principal en theta: ');
                            end
                            %Condición Phi: Si se ingresa una posición del lóbulo principal que no esté entre -90° y 90°
                            while ((pPhi < -90) || (pPhi > 90))
                                disp('--------------------------------------------------------------------------------------------------------------');
                                disp("¡LA POSICIÓN EN PHI NO ES VÁLIDA!"); 
                                disp(['       ',num2str(f),' RECUERDE: la posición del lóbulo principal en phi debe estar entre -90° y 90°.']);
                                disp('--------------------------------------------------------------------------------------------------------------');
                                pPhi = input('        - Ingrese la posición del lóbulo principal en phi: ');
                            end
                            nivelLL = input('        - Ingrese el nivel relativo de lóbulos laterales (dB): ');
                            nivelRelativoAdim = 10^(nivelLL/20);
                            disp('--------------------------------------------------------------------------------------------------------------');
                            disp("¡IMPORTANTE!"); 
                            disp(['       ',num2str(f),' El nivel relativo en escala lineal es ',num2str(nivelRelativoAdim)]);         
                            disp('--------------------------------------------------------------------------------------------------------------');
                            %CORTES DEL DIAGRAMA
                            opcion = 1;
                            repetir = 5;
                            [angulocorteTheta,angulocortePhi] = fCortesDiagrama(opcion,repetir);
                            %FUNCIONES
                            [Amplitudes] = fDistribucionAmplitudDolphChebyshevMejorado(N,nivelLL);
                            [Fase] = fDesfasajePlanoXY(N,anguloX,anguloY,pTheta,pPhi,d,casoAnalisisoSintesis);
                            disp(' ');
                            disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                            disp('                                                 RESULTADOS                                            ');
                            disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                            [ejeZ,ejeX,ejeY,directividad] = fFactorDeArregloPlanoXY(N,d,Fase,Amplitudes);
                            [ejeZ,ejeX,ejeY] = fGraficayAnalisisDolphChebyshevMejorado(ejeZ,ejeX,ejeY,N,pTheta,pPhi,d,angulocorteTheta,angulocortePhi,nivelRelativoAdim,directividad);
                         
                        %Módulo de Laxpati
                        case 3
                            disp(['                 ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' LAXPATI: ESPECIFICACIÓN DE LOS NULOS EN EL PATRÓN ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                            disp('--------------------------------------------------------------------------------------------------------------');
                            disp("¡IMPORTANTE!"); 
                            disp(['       ',num2str(f),' La configuración de los arreglos canónicos es romboidal o de forma de diamante.']);
                            disp(['       ',num2str(f),' Es necesario indicar (en grados) las coordenadas (theta,phi) de los nulos.']); 
                            disp(['       ',num2str(f),' El programa acepta 3 nulos como MÍNIMO y 27 como MÁXIMO']);
                            disp('--------------------------------------------------------------------------------------------------------------');
                            disp("INTRODUZCA LOS SIGUIENTES DATOS:"); 
                            CN =  input('        El número de nulos: ');
                            nulos = [];
                            if CN <3
                                disp('--------------------------------------------------------------------------------------------------------------');
                                disp("¡RECORDATORIO!"); 
                                disp(['       ',num2str(f),' El número MÍNIMO de nulos es 3.']);
                                disp('--------------------------------------------------------------------------------------------------------------');
                            elseif CN > 27
                                disp('--------------------------------------------------------------------------------------------------------------');
                                disp("¡RECORDATORIO!"); 
                                disp(['       ',num2str(f),' El número MÁXIMO de nulos es 27.']); 
                                disp('--------------------------------------------------------------------------------------------------------------');
                            else
                                disp("        Las coordenadas (Theta,Phi) de cada par de nulos:")
                                for i = 1:1:CN
                                    col = 1;
                                    NT = input(['         ',num2str(f2), ' El nulo #',num2str(i),' en el eje Theta es: ']);
                                    nulos(i,col) = NT;
                                    col = 2;
                                    NP = input(['         ',num2str(f2), ' El nulo #',num2str(i),' en el eje Phi es: ']);
                                    nulos(i,col) = NP;
                                end
                                im = imread('imagenPrevia.png');
                                imT = double(im(:,:,1));
                                figure
                                imshow(uint8(im));
                                title('Arreglo Canónico de Cuatro Elementos','FontSize', 22,'FontName', 'Times New Roman')
                                warning('off','all')
                                disp('--------------------------------------------------------------------------------------------------------------');
                                disp("IMPORTANTE: ¡OBSERVE LA IMAGEN EN PANTALLA!"); 
                                disp(['       ',num2str(f),' La imagen describe el arreglo canónico con configuración romboidal.']);
                                disp(['       ',num2str(f),' Los vectores d1 y d2 describen la posición especial de los elementos.']);
                                disp(['       ',num2str(f),' Las fases de d1 y d2 vienen definidas como 0° y 90° respectivamente.']);
                                disp(['       ',num2str(f),' DEBE definir las magnitudes de d1 y d2.']);
                                disp('--------------------------------------------------------------------------------------------------------------');
                                d1 =  input('        La distancia del origen al elemento en el eje Theta (magnitud d1): ');
                                d2 =  input('        La distancia del origen al elemento en el eje Phi (magnitud d2): ');
                                close all
                                disp(' ');
                                disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);                       
                                disp('                                   RESULTADOS DE LA SÍNTESÍS                            ');
                                disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
                                [excitacionesFinal,excTotal,faLaxpati] = fDistribucionCorrienteLaxpati(CN,nulos,d1,d2);
                                [excitacionesFinal,vectorExcitaciones,fc1] = fFactorArregloGraficaLaxpati(excitacionesFinal,excTotal,faLaxpati,nulos, CN, d1,d2);
                            end
                            
                        case 4
                            
                        otherwise
                            disp(['                                     ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' CASO INCORRECTO ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                            disp('--------------------------------------------------------------------------------------------------------------');
                    end
                
                case 3
                    
                otherwise
                    disp(['                                     ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' CASO INCORRECTO ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
                    disp('--------------------------------------------------------------------------------------------------------------');
            end
            
        case 3
            disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
            disp('                                         PROGRAMA FINALIZADO                            ');
            disp([num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb),num2str(romb),num2str(romb),num2str(romb), num2str(romb),num2str(romb)]);
            break
        otherwise
            disp(['                                     ',num2str(romb),num2str(romb),num2str(romb),num2str(romb),' CASO INCORRECTO ', num2str(romb),num2str(romb),num2str(romb),num2str(romb)]);
            disp('--------------------------------------------------------------------------------------------------------------');
    end
end