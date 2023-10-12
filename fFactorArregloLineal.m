function [ejeX,ejeY,directividad] = fFactorArregloLineal(N,d,Amplitudes,Fase,anguloZ,anguloZVariacionFase,casoAnalisisoSintesis)

% �CU�LES M�DULOS USAN LA FUNCI�N fFactorArregloLineal?
%   - M�dulo de An�lisis de arreglos lineales. 
%   - Los siguientes m�dulos pertenecientes al M�dulo de S�ntesis de arreglos lineales:
%      - M�dulo de variaci�n de la fase entre elementos para arreglos lineales.
%      - M�dulo de Dolph-Chebyshev.

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fFactorArregloLineal?
% I. Para todos los m�dulos: se calcula el factor de arreglo para arreglos
% lineales cuyos elementos se encuentren sobre el eje z.
%    La funci�n tiene las siguientes caracter�sticas:
%    - Se establecen par�metros iniciales (como el intervalo de theta).
%    - Se normaliza el factor de arreglo.
% II. Para todos los m�dulos: permite calcular la directividad m�xima.
 
% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     N -------------------------> N�mero de elementos del arreglo.
%     d -------------------------> Distancia entre los elementos.
%     Amplitudes ----------------> Distribuci�n de amplitud (vector con amplitud de cada excitaci�n del arreglo). 
%     anguloZ -------------------> Desfasaje entre los elementos.
%     anguloZVariacionFase ------> Desfasaje entre elementos obtenido en funci�n fDesfasajeLineala (a partir del
%                                  m�todo de s�ntesis de variaci�n de fases (un �nico valor).
%     casoAnalisisoSintesis -----> Decisi�n entre an�lisis o s�ntesis (m�todo de variaci�n de fases)

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     ejeX ----------------------> Intervalo de valores de theta (desde 0� hasta 180�).
%     ejeY -----------------------> Valores que toma el factor de arreglo.
%     directividad ---------------> Valor de directividad m�xima.


%S�MBOLOS Y PAR�METROS INICIALES
%S�mbolos
rombos = char(9830);
flecha2 = char(8594);
angulo = char(8736);
% Condici�n para los m�dulos de s�ntesis de arreglos lineales
if casoAnalisisoSintesis == 2
    anguloZ = anguloZVariacionFase;
end

%PARTE I: C�LCULO DEL FACTOR DE ARREGLO -> Para todos los m�dulos que usan esta funci�n
% I.1. Par�metros iniciales para calcular el factor de arreglo.
tita = 0:(1/1000):pi; 
anguloZ = anguloZ*(pi/180);
factorZ =  (anguloZ) + (2*pi*d*cos(tita));
% I.2. Se calcula el factor de arreglo.
for m = 1:1:N
    AF(m,:) = (Amplitudes(m)).*exp(i*(m-1)*factorZ);      
end
vectorY = sum(AF);                         
% I.3. Se normaliza el factor de arreglo.
vectorYNormalizado = (abs(vectorY/max(vectorY))); 
% I.4. Se definen los ejes.
 ejeX = tita.*(180/pi);
 ejeY = vectorYNormalizado;
 
%PARTE II: SE MUESTRA POR CONSOLA LAS EXCITACIONES
disp(' ');
FaseG = Fase.*(180/pi);
disp([num2str(rombos),num2str(rombos),' EXCITACIONES (MAGNITUD-FASE) ',num2str(rombos),num2str(rombos)]);
disp(' Cada excitaci�n tiene el siguiente valor (magnitud-fase): ');
for numeroExcitacionX = 1:1:N
    [imprimirExc] = fSimbolosLinealExc(Amplitudes,FaseG,numeroExcitacionX,N);
    disp(imprimirExc);
end

%PARTE III: C�LCULO DE DIRECTIVIDAD M�XIMA -> Para todos los m�dulos que usan esta funci�n
dtheta=1/1000;
AF = vectorY;
U=(abs(AF)./max(abs(AF))).^2;
Prad=2*pi*sum(U.*sin(tita).*dtheta);
D=4*pi*U/Prad;
directividad=max(D);



