function [ejeX,ejeY,directividad] = fFactorArregloLineal(N,d,Amplitudes,Fase,anguloZ,anguloZVariacionFase,casoAnalisisoSintesis)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fFactorArregloLineal?
%   - Módulo de Análisis de arreglos lineales. 
%   - Los siguientes módulos pertenecientes al Módulo de Síntesis de arreglos lineales:
%      - Módulo de variación de la fase entre elementos para arreglos lineales.
%      - Módulo de Dolph-Chebyshev.

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fFactorArregloLineal?
% I. Para todos los módulos: se calcula el factor de arreglo para arreglos
% lineales cuyos elementos se encuentren sobre el eje z.
%    La función tiene las siguientes características:
%    - Se establecen parámetros iniciales (como el intervalo de theta).
%    - Se normaliza el factor de arreglo.
% II. Para todos los módulos: permite calcular la directividad máxima.
 
% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     N -------------------------> Número de elementos del arreglo.
%     d -------------------------> Distancia entre los elementos.
%     Amplitudes ----------------> Distribución de amplitud (vector con amplitud de cada excitación del arreglo). 
%     anguloZ -------------------> Desfasaje entre los elementos.
%     anguloZVariacionFase ------> Desfasaje entre elementos obtenido en función fDesfasajeLineala (a partir del
%                                  método de síntesis de variación de fases (un único valor).
%     casoAnalisisoSintesis -----> Decisión entre análisis o síntesis (método de variación de fases)

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     ejeX ----------------------> Intervalo de valores de theta (desde 0° hasta 180°).
%     ejeY -----------------------> Valores que toma el factor de arreglo.
%     directividad ---------------> Valor de directividad máxima.


%SÍMBOLOS Y PARÁMETROS INICIALES
%Símbolos
rombos = char(9830);
flecha2 = char(8594);
angulo = char(8736);
% Condición para los módulos de síntesis de arreglos lineales
if casoAnalisisoSintesis == 2
    anguloZ = anguloZVariacionFase;
end

%PARTE I: CÁLCULO DEL FACTOR DE ARREGLO -> Para todos los módulos que usan esta función
% I.1. Parámetros iniciales para calcular el factor de arreglo.
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
disp(' Cada excitación tiene el siguiente valor (magnitud-fase): ');
for numeroExcitacionX = 1:1:N
    [imprimirExc] = fSimbolosLinealExc(Amplitudes,FaseG,numeroExcitacionX,N);
    disp(imprimirExc);
end

%PARTE III: CÁLCULO DE DIRECTIVIDAD MÁXIMA -> Para todos los módulos que usan esta función
dtheta=1/1000;
AF = vectorY;
U=(abs(AF)./max(abs(AF))).^2;
Prad=2*pi*sum(U.*sin(tita).*dtheta);
D=4*pi*U/Prad;
directividad=max(D);



