function [Amplitudes] = fAmplitudDolphChebyshev(N,nivelLL)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fAmplitudDolphChebyshev?
%   - Módulo de Dolph-Chebyshev. 

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fAmplitudDolphChebyshev?
% I. Para todos los módulos: se calcula la distribución de amplitud mediante método de Dolph-Chebyshev Mejorado.
%     La función tiene las siguientes características:
%     -  Se calcula el parámetro alpha0.
%      - Se genera un vector de distribución de amplitud.
%      - El cálculo de las amplitudes de Chebyshev depende si el número de elementos es par o impar

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     N ---------> Número de elementos del arreglo.
%     nivelLL ---> Nivel relativo de lóbulos laterales (dB).

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     Amplitudes ---> Distribución de amplitud (vector con amplitud de cada excitación del arreglo -> 
%                     amplitudes Dolph-Chebyshev). 

%PARTE I: CÁLCULO DE DISTRIBUCIÓN DE AMPLITUD (DOLPH-CHEBYSHEV) -> Para todos los módulos que usan esta función
% I.1. Obtención de parámetro alpha0
NivelLLAdi = 10^(nivelLL/20);
alpha0 = cosh((acosh(1/NivelLLAdi))/(N-1));
% I.2. Cálculo de distribución de amplitud
% - Verificación si número de elementos es par o impar
comprobacion = rem(N,2);
% I.2.1. Rutina para hallar la distribución de amplitud en caso par -> (método fue desarollado por Dolph)
if comprobacion == 0                        
    M = N/2;   
    excitaciones = zeros(1,(N/2));                                      
    for m = 1:1:(N/2)                              
        for k = m:1:(N/2)
            excitaciones(m) = excitaciones(m) + (((-1)^(M-k)*(alpha0)^((2*k)-1))*(((2*M)-1)*(factorial(k+M-2))/((factorial(k-m))*(factorial(k+m-1))*(factorial(M-k)))));
        end
    end
% - Se genera vector de distribución de amplitud en caso par
    AmplitudesParte1 = excitaciones/max(excitaciones);  
    AmplitudesParte2 = AmplitudesParte1(length(AmplitudesParte1):-1:1);
    Amplitudes = [AmplitudesParte2 AmplitudesParte1];
% I.2.2. Rutina para hallar la distribución de amplitud en caso impar -> (método fue desarollado por Dolph)
else                                        
    M = (N-1)/2;   
    excitaciones = zeros(1,(((N-1)/2)+1));          
    for m = 0:((N-1)/2)                            
        for k = m:1:((N-1)/2)
            excitaciones(m+1) = excitaciones(m+1) + (((-1)^(M-k)*(alpha0)^(2*k))*((2*M)*(factorial(k+M-1))/((factorial(k-m))*(factorial(k+m))*(factorial(M-k)))));
        end
    end
% - Se genera vector de distribución de amplitud en caso impar
    AmplitudesParte1 = excitaciones/max(excitaciones);    
    AmplitudesParte2 = AmplitudesParte1;
    AmplitudesParte1(1) = [];
    AmplitudesParte3 = AmplitudesParte1(length(AmplitudesParte1):-1:1);
    Amplitudes = [AmplitudesParte3 AmplitudesParte2];
end
