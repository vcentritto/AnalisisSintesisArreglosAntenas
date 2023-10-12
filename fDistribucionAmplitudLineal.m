function [Amplitudes] = fDistribucionAmplitudLineal(N, verif)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fDistribucionAmplitudLineal?
%   - Módulo de análisis de arreglos lineales. 
%   - Módulo de variación de la fase entre elementos para arreglos lineales.

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fDistribucionAmplitud?
% I. Para todos los módulos: se encuentra la distribución de amplitud (vector) según los datos de 
%    entrada ingresados por el usuario (distribución de amplitud uniforme o no uniforme).
%    La función tiene las siguientes características:
%    - Se genera un vector con distribución de amplitud uniforme 
%    - Se genera un vector con distribución de amplitud no uniforme. Esta  permite: 
%    el ensanchamiento del lóbulo principal en el eje theta, en el eje phi o en el eje theta y eje phi

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     N ---------------------> Número de elementos del arreglo (Nx = Ny = Nz).
%     verif -----------------> Decisión entre distribución de amplitud uniforme o no uniforme

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     Amplitudes -------> Distribución de amplitud (vector con amplitud de cada excitación del arreglo). 

%Símbolo
flecha1 = char(8658);
flecha2 = char(8594);
numero0 = char(8320);
circulo = char(8226);

%PARTE I: CÁLCULO DE DISTRUBUCIÓN DE AMPLITUD (generación de vector de amplitud)-> Para todos los módulos que usan esta función
%I.1. Distribución de amplitud uniforme
if verif == 1   
    disp("¡IMPORTANTE!"); 
    disp(['       ',num2str(flecha1),' Distribución de amplitud uniforme implica que las ',num2str(N),' excitaciones tienen igual amplitud.']);
    disp(['       ',num2str(flecha1),' En este caso, se estableció I',num2str(numero0),' = 1.']);
    disp('--------------------------------------------------------------------------------------------------------------');
    Amplitudes = ones(1,N);
%I.2. Distribución de amplitud no uniforme
elseif verif == 2  
    disp("¡IMPORTANTE!"); 
    disp(['       ',num2str(flecha1),' Distribución de amplitud no uniforme implica que las ',num2str(N),' excitaciones pueden tener diferente amplitud.']);
    disp(['       ',num2str(flecha1),' En consecuencia, el lóbulo principal se ensancha.']);
    disp('--------------------------------------------------------------------------------------------------------------');   
    disp("¡ATENCIÓN!"); 
    disp(['       ',num2str(flecha1),' Ahora va a ingresar cada amplitud en un vector de 1x',num2str(N),' elementos.']);
    disp('---------------------------------------------------------------------------------------------------------------');            
    tam = N;
    Amplitudes = ones(1,tam);
    for i = 1:1:tam
        valor = input(['         ',num2str(circulo),' En la posición (1,', num2str(i),') ',num2str(flecha2),' ingrese la amplitud: ']);
        disp(' ');
        Amplitudes(1,i) = valor; 
    end
    disp('--------------------------------------------------------------------------------------------------------------');            
    disp(['       ',num2str(flecha1),' El vector resultante es la siguiente: ']);
    disp(' ');
    disp(Amplitudes)
    disp('--------------------------------------------------------------------------------------------------------------');        
 end
    
