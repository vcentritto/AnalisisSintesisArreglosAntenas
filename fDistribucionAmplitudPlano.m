function [Amplitudes] = fDistribucionAmplitudPlano(N, verif)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fDistribucionAmplitudPlano?
%   - Módulo de Análisis de arreglos en el plano. 
%   - Módulo de Síntesis de variación de la fase entre elementos para arreglos en el plano.

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fDistribucionAmplitud?
% I. Para todos los módulos: se encuentra la distribución de amplitud (matriz) según los datos de 
%    entrada ingresados por el usuario (distribución de amplitud uniforme o no uniforme).
%    La función tiene las siguientes características:
%    - Se genera una matriz con distribución de amplitud uniforme 
%    - Se genera una matriz con distribución de amplitud no uniforme. Esta  permite: 
%    el ensanchamiento del lóbulo principal en el eje theta, en el eje phi o en el eje theta y eje phi

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     N ---------------------> Número de elementos del arreglo (Nx = Ny = Nz).
%     verif -----------------> Decisión entre distribución de amplitud uniforme o no uniforme

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     Amplitudes ------> Distribución de amplitud (matriz con amplitud de cada excitación del arreglo). 

%Símbolo
flecha1 = char(8658);
flecha2 = char(8594);
circulo = char(8226);
numero0 = char(8320);
       
%PARTE I: CÁLCULO DE DISTRUBUCIÓN DE AMPLITUD (generación de matriz de amplitud)-> Para todos los módulos que usan esta función
%I.1. Distribución de amplitud uniforme
totalExc = N*N;
if verif == 1     
    disp("¡IMPORTANTE!"); 
    disp(['       ',num2str(flecha1),' La distribución de amplitud uniforme implica que las ',num2str(totalExc),' excitaciones tienen igual amplitud.']);
    disp(['       ',num2str(flecha1),' En este caso, se estableció I',num2str(numero0),' = 1.']);
    disp('--------------------------------------------------------------------------------------------------------------');
    Amplitudes = ones(N,N);
%I.2. Distribución de amplitud no uniforme
elseif verif == 2 
    disp("¡IMPORTANTE!"); 
    disp(['       ',num2str(flecha1),' Distribución de amplitud no uniforme implica que las ',num2str(totalExc),' excitaciones pueden tener diferente amplitud.']);
    disp(['       ',num2str(flecha1),' En consecuencia, el lóbulo principal se ensancha.']);
    tam = N;
    Amplitudes = ones(N,N);
    ciclo = 1;
    %Se definen las opciones 
    while ciclo == 1
        disp('-------------------------------------------------------------------------------------------------------------');
        disp("¡ATENCIÓN!"); 
        disp(['       ',num2str(flecha1),' Ahora va a ingresar la distribución de amplitud en una matriz de ',num2str(N),'x',num2str(N),' elementos.']);
        disp('---------------------------------------------------------------------------------------------------------------');            
        disp(['       ',num2str(flecha1),' Tiene las siguientes opciones: ']);
        disp('          1. Ingresar las amplitudes por fila.')
        disp('          2. Ingresar las amplitudes por columna.')
        disp('          3. Ingresar cada amplitud en la matriz (una a una).')
        cam = input('        Seleccione: ');
        disp('--------------------------------------------------------------------------------------------------------------');            
        %I.2.1. Amplitudes por fila
        if cam == 1
            Amplitudes = ones(tam,tam);
            for i = 1:1:tam
                valor = input(['         ',num2str(circulo),' En la fila ',num2str(i),' ',num2str(flecha2),' ingrese la amplitud: ']);
                disp(' ');
                Amplitudes(i,:) = valor; 
            end
            disp('--------------------------------------------------------------------------------------------------------------');            
            disp(['       ',num2str(flecha1),' La matriz resultante es la siguiente: ']);
            disp(' ');
            disp(Amplitudes);
            disp('--------------------------------------------------------------------------------------------------------------');
            ciclo = 2;
        %I.2.2. Amplitudes por columna
        elseif cam == 2
            for i = 1:1:tam
                valor = input(['         ',num2str(circulo),' En la columna ',num2str(i),' ',num2str(flecha2),' ingrese la amplitud: ']);
                Amplitudes(:,i) = valor; 
                disp(' ');
            end  
            disp('--------------------------------------------------------------------------------------------------------------');            
            disp(['       ',num2str(flecha1),' La matriz resultante es la siguiente: ']);
            disp(Amplitudes);
            disp(' ');
            disp('--------------------------------------------------------------------------------------------------------------');  
            ciclo = 2;
         %I.2.3. Amplitud una a una en matriz                  
         elseif cam == 3
          for i = 1:1:tam
            for j = 1:1:tam
                valor = input(['         ',num2str(circulo),' En la posición (',num2str(i),',',num2str(j),') ',num2str(flecha2),' ingrese la amplitud: ']);
                disp(' ');
                Amplitudes(i,j) = valor; 
            end
          end
         disp('--------------------------------------------------------------------------------------------------------------');            
         disp(['       ',num2str(flecha1),' La matriz resultante es la siguiente: ']);
         disp(' ');
         disp(Amplitudes)
         disp('--------------------------------------------------------------------------------------------------------------');  
         ciclo = 2;
         %I.2.4. Opción incorrecta 
         else
            disp("¡IMPORTANTE!"); 
            disp(['       ',num2str(flecha1),' Ingresó una opción que NO es válida.'])
            disp(['       ',num2str(flecha1),' Debe intentar de nuevo.'])
        end
    end
end

