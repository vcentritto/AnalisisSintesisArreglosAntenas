function [Amplitudes] = fAmplitudDolphChebyshev(N,nivelLL)

% �CU�LES M�DULOS USAN LA FUNCI�N fAmplitudDolphChebyshev?
%   - M�dulo de Dolph-Chebyshev. 

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fAmplitudDolphChebyshev?
% I. Para todos los m�dulos: se calcula la distribuci�n de amplitud mediante m�todo de Dolph-Chebyshev Mejorado.
%     La funci�n tiene las siguientes caracter�sticas:
%     -  Se calcula el par�metro alpha0.
%      - Se genera un vector de distribuci�n de amplitud.
%      - El c�lculo de las amplitudes de Chebyshev depende si el n�mero de elementos es par o impar

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     N ---------> N�mero de elementos del arreglo.
%     nivelLL ---> Nivel relativo de l�bulos laterales (dB).

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     Amplitudes ---> Distribuci�n de amplitud (vector con amplitud de cada excitaci�n del arreglo -> 
%                     amplitudes Dolph-Chebyshev). 

%PARTE I: C�LCULO DE DISTRIBUCI�N DE AMPLITUD (DOLPH-CHEBYSHEV) -> Para todos los m�dulos que usan esta funci�n
% I.1. Obtenci�n de par�metro alpha0
NivelLLAdi = 10^(nivelLL/20);
alpha0 = cosh((acosh(1/NivelLLAdi))/(N-1));
% I.2. C�lculo de distribuci�n de amplitud
% - Verificaci�n si n�mero de elementos es par o impar
comprobacion = rem(N,2);
% I.2.1. Rutina para hallar la distribuci�n de amplitud en caso par -> (m�todo fue desarollado por Dolph)
if comprobacion == 0                        
    M = N/2;   
    excitaciones = zeros(1,(N/2));                                      
    for m = 1:1:(N/2)                              
        for k = m:1:(N/2)
            excitaciones(m) = excitaciones(m) + (((-1)^(M-k)*(alpha0)^((2*k)-1))*(((2*M)-1)*(factorial(k+M-2))/((factorial(k-m))*(factorial(k+m-1))*(factorial(M-k)))));
        end
    end
% - Se genera vector de distribuci�n de amplitud en caso par
    AmplitudesParte1 = excitaciones/max(excitaciones);  
    AmplitudesParte2 = AmplitudesParte1(length(AmplitudesParte1):-1:1);
    Amplitudes = [AmplitudesParte2 AmplitudesParte1];
% I.2.2. Rutina para hallar la distribuci�n de amplitud en caso impar -> (m�todo fue desarollado por Dolph)
else                                        
    M = (N-1)/2;   
    excitaciones = zeros(1,(((N-1)/2)+1));          
    for m = 0:((N-1)/2)                            
        for k = m:1:((N-1)/2)
            excitaciones(m+1) = excitaciones(m+1) + (((-1)^(M-k)*(alpha0)^(2*k))*((2*M)*(factorial(k+M-1))/((factorial(k-m))*(factorial(k+m))*(factorial(M-k)))));
        end
    end
% - Se genera vector de distribuci�n de amplitud en caso impar
    AmplitudesParte1 = excitaciones/max(excitaciones);    
    AmplitudesParte2 = AmplitudesParte1;
    AmplitudesParte1(1) = [];
    AmplitudesParte3 = AmplitudesParte1(length(AmplitudesParte1):-1:1);
    Amplitudes = [AmplitudesParte3 AmplitudesParte2];
end
