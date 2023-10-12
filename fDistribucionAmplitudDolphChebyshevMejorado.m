function [Amplitudes] = fDistribucionAmplitudDolphChebyshevMejorado(N,nivelLL)

% �CU�LES M�DULOS USAN LA FUNCI�N fAmplitudDolphChebyshevMejorado?
%   - M�dulo de Dolph-Chebyshev Mejorado

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fAmplitudDolphChebyshevMejorado?
% I.  C�lculo de la distribuci�n de amplitud mediante m�todo de Dolph-Chebyshev Mejorado.
%     La funci�n tiene las siguientes caracter�sticas:
%     -  Se calcula el par�metro alpha0 (tambi�n conocido como w0)
%      - Se genera una matriz de distribuci�n de amplitud.
%      - El c�lculo de las amplitudes de Chebyshev depende si el n�mero de elementos es par o impar

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     N ---------------------> N�mero de elementos del arreglo (N = Nx = Ny = Nz).
%     nivelLL ---------------> Nivel relativo de l�bulos laterales (dB).

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%    Amplitudes ------> Distribuci�n de amplitud (matriz con amplitud de cada excitaci�n del arreglo). 

% PARTE I: C�LCULO DE DISTRIBUCI�N DE AMPLITUD (AMPLITUDES CHEBYSHEV)
% I.1. C�lculo del nivel relativo de los l�bulos laterales en escala lineal
nivelRelativoAdim = 10^(nivelLL/20);
% I.2. C�lculo del par�metro alpha0 (o w0)
w0 = cosh((acosh(1/nivelRelativoAdim)/(N-1)));
% I.2. Verificaci�n si n�mero de elementos es par o impar 
parImpar = mod(N,2);                 
%Caso Par
if parImpar == 0                                   
    limCS = N/2;
    matrizArgumento = zeros(limCS,limCS);
%Caso Impar
else                                
    limCS = (N - 1)/2;
    matrizArgumento = zeros(limCS+1,limCS+1);
end
%I.3. Rutina para hallar la distribuci�n de amplitud -> (m�todo fue desarollado por Cheng-Tseng)
if parImpar == 0
    for m = 1:1:limCS
        for n = 1:1:limCS
            if m >= n
                s = m;
                for s = m:1:limCS
                    matrizArgumento(m,n) = matrizArgumento(m,n) + ((((-1)^(limCS-s)))*((2*limCS)-1)/(2*(limCS+s-1)))*(factorial(limCS+s-1)/(factorial((2*s)-1)*factorial((limCS+s-1)-((2*s)-1))))*((factorial((2*s)-1))/((factorial(s-m))*(factorial(((2*s)-1)-(s-m)))))*(factorial((2*s)-1)/((factorial(s-n))*(factorial(((2*s)-1)-(s-n)))))*(w0/2)^((2*s)-1);
                end
            else
                s = n;
                for s = n:1:limCS
                    matrizArgumento(m,n) = matrizArgumento(m,n) + ((((-1)^(limCS-s)))*((2*limCS)-1)/(2*(limCS+s-1)))*(factorial(limCS+s-1)/(factorial((2*s)-1)*factorial((limCS+s-1)-((2*s)-1))))*((factorial((2*s)-1))/((factorial(s-m))*(factorial(((2*s)-1)-(s-m)))))*(factorial((2*s)-1)/((factorial(s-n))*(factorial(((2*s)-1)-(s-n)))))*(w0/2)^((2*s)-1);       
                end
            end
        end
    end
else
    for m = 0:1:(limCS)
        for n = 0:1:(limCS)
            if m >= n
                s = m;
                for s = m:1:(limCS)
                    matrizArgumento(m+1,n+1) = matrizArgumento(m+1,n+1) + (((-1)^(limCS-s))*((limCS)/(limCS+s))*((factorial(limCS+s))/((factorial(2*s))*(factorial((limCS+s)-(2*s)))))*((factorial(2*s))/((factorial(s-m))*(factorial((2*s)-(s-m)))))*((factorial(2*s))/((factorial(s-n))*(factorial((2*s)-(s-n)))))*((w0/2)^(2*s)));
                end
            else
                s = n;
                for s = n:1:(limCS)
                    matrizArgumento(m+1,n+1) = matrizArgumento(m+1,n+1) + (((-1)^(limCS-s))*((limCS)/(limCS+s))*((factorial(limCS+s))/((factorial(2*s))*(factorial((limCS+s)-(2*s)))))*((factorial(2*s))/((factorial(s-m))*(factorial((2*s)-(s-m)))))*((factorial(2*s))/((factorial(s-n))*(factorial((2*s)-(s-n)))))*((w0/2)^(2*s)));
                end
            end
        end
    end
end
%I.4. Se normalizan las amplitudes
valorMaximo = max(max(matrizArgumento));
matrizNormalizada = zeros(length(matrizArgumento),length(matrizArgumento));
for i = 1:length(matrizArgumento)
    for r = 1: length(matrizArgumento)
        matrizNormalizada(i,r) = matrizArgumento(i,r)/valorMaximo;   
    end
end
matrizCopiaNormalizada = matrizNormalizada;
%I.5. Se genera la matriz de distribuci�n de amplitud (expansi�n y obtenci�n de matriz)
if parImpar == 0
    %- Expasi�n cuando n�mero de elementos es par
    tam = size(matrizCopiaNormalizada);
    lim = tam(1);
    matrizIC = zeros(lim,lim);
    matrizIIC = zeros(lim,lim);
    matrizIIIC = zeros(lim,lim);
    matrizIV = zeros(lim,lim);
    matrizIV = matrizCopiaNormalizada;
    countMatriz = 0;
    while countMatriz <= 3
        decrem = N/2; 
        countMatriz = countMatriz + 1;
        switch countMatriz
            case 1     %MatrizPrimerCuadrante
                for i = 1:1:lim       
                    matrizIC(decrem,:) = matrizCopiaNormalizada(i,:);
                    decrem = decrem - 1;    
                end
            case 2      %MatrizTercerCuadrante
                for i = 1:1:lim       
                    matrizIIIC(:,decrem) = matrizCopiaNormalizada(:,i);
                    decrem = decrem - 1;    
                end
            case 3      %MatrizSegundoCuadrante
                for i = 1:1:lim       
                    matrizIIC(:,decrem) = matrizIC(:,i);
                    decrem = decrem - 1;    
                end
        end
    end
    matrizSuperior = [matrizIIC matrizIC];
    matrizInferior = [matrizIIIC matrizIV];
    Amplitudes = [matrizSuperior; matrizInferior];
else
    %- Expasi�n cuando n�mero de elementos es impar
    tamMatriz = size(matrizNormalizada);
    contadorMatriz2 = 1;
    matrizPrevia2 = [];
    for indx = tamMatriz(1):-1:1
        matrizPrevia2(contadorMatriz2,:) = matrizNormalizada(indx,:);
        contadorMatriz2 = contadorMatriz2 + 1;
    end
    matrizNormalizada = matrizPrevia2;
    matrizCopiaNormalizada2 = matrizNormalizada;
    contadorMatriz = 1;
    matrizPrevia = [];
    for indx2 = tamMatriz(1):-1:2
        matrizPrevia(:,contadorMatriz) = matrizNormalizada(:,indx2);
        contadorMatriz = contadorMatriz + 1;
    end
    matrizNormalizada = [matrizPrevia matrizNormalizada];
    matrizCopia5 = matrizNormalizada; 
    contadorMatriz2 = 1;
    matrizPrevia3 = [];
    for indc = (tamMatriz(1)-1):-1:1
        matrizPrevia3(contadorMatriz2,:) = matrizNormalizada(indc,:);
        contadorMatriz2 = contadorMatriz2 + 1;
    end
    Amplitudes = [matrizNormalizada; matrizPrevia3];
end