function [ejeZ,ejeX,ejeY,directividad] = fFactorDeArregloPlanoXY(N,d,Fase,Amplitudes)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fFactorDeArregloPlanoXY?
%   - Módulo de Análisis de arreglos en el plano. 
%   - Los siguientes módulos pertenecientes al Módulo de Síntesis de arreglos en el plano:
%      - Módulo de variación de la fase entre elementos para arreglos en el plano.
%      - Módulo de Dolph-Chebyshev Mejorado.

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fFactorDeArregloPlanoXY?
% I. Para todos los módulos: se calcula el factor de arreglo en el plano xy.
%    La función tiene las siguientes características:
%    - Se establecen parámetros iniciales (como el intervalo de theta y de phi).
%    - Se calcula el factor de arreglo para arreglos de perímetro y malla cuadrada.
%    - Se normaliza el factor de arreglo.
% II. Para todos los módulos: permite calcular la directividad máxima.

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     N ---------------------> Número de elementos del arreglo (N = Nx = Ny).
%     d ------------------> Distancia inter-elemento (d = dx = dy) .
%     Fase ------------------> Distribución de fases (matriz con fase de cada excitación del arreglo).
%     Excitaciones ----------> Distribución de amplitud (matriz con amplitud de cada excitación del arreglo)

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     ejeX -----------------------> Intervalo de valores de theta (desde -90° hasta 90°).
%     ejeY -----------------------> Intervalo de valores de phi (desde 0° hasta 180°).
%     ejeZ -----------------------> Valores que toma el factor de arreglo.
%     directividad ---------------> Valor de directividad máxima.

% ¿CUÁLES SUBFUNCIONES CONTIENE?:
%     fDirectividad Plano ------> Subfunción que calcula la directividad máxima en el plano xy.

%SÍMBOLOS Y PARÁMETROS INICIALES
%Símbolos
rombos = char(9830);
flecha2 = char(8594);
angulo = char(8736);

% PARTE I: CÁLCULO DE FACTOR DE ARREGLO EN PLANO XY -> Para todos los módulos que usan esta función
% I.1. Parámetros iniciales para calcular el factor de arreglo.
tita = -pi/2:(1/100):pi/2;        
phi = -pi/2:(1/100):pi/2;               
[TITA,PHI] = meshgrid(tita,phi);                
factorx=sin(TITA).*cos(PHI);
factory=sin(TITA).*sin(PHI);
matrizExcitaciones = Amplitudes.*(cos(Fase)+j*sin(Fase)); 
matrizZ = zeros(1,1);    
% I.2. Se calcula el factor de arreglo.
for m = 1:1:N
   for n = 1:1:N
       matrizZ = (matrizExcitaciones(m,n)*exp(j*2*pi*(n-1)*d*(factorx)).*exp(j*2*pi*(m-1)*d*(factory))) + matrizZ;    
   end
end   
% I.3. Se normaliza el factor de arreglo.
matrizZ = abs(matrizZ);
valorMaximo = max(max(matrizZ));
matrizNormalizada = zeros(length(matrizZ),length(matrizZ));
for i = 1:length(matrizZ)
   for r = 1: length(matrizZ)
        matrizNormalizada(i,r) = matrizZ(i,r)/valorMaximo;   
    end
end
% I.4. Se definen los ejes.
 ejeX = TITA.*(180/pi);
 ejeY = PHI.*(180/pi);
 ejeZ = matrizNormalizada; 
  
%PARTE II: SE MUESTRA POR CONSOLA LAS EXCITACIONES
disp(' ');
disp([num2str(rombos),num2str(rombos),' EXCITACIONES (MAGNITUD-FASE) ',num2str(rombos),num2str(rombos)]);
disp(' Cada excitación tiene el siguiente valor (magnitud-fase): ');
FaseG = Fase.*(180/pi);
tamMagFase = size(matrizExcitaciones);
tamMagFase = tamMagFase(1);
for numeroExcitacionX = 1:1:tamMagFase
    for numeroExcitacionY = 1:1:tamMagFase  
        disp(['    ',num2str(flecha2),' I(',num2str(numeroExcitacionX),',',num2str(numeroExcitacionY),') = (',num2str(Amplitudes(numeroExcitacionX,numeroExcitacionY)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX,numeroExcitacionY)),'°)']);
    end
end

%POLAR
tita0 = -pi/2:(1/100):pi/2;        
phi0 = 0;               
factorx0=sin(tita0).*cos(phi0);
factory0=sin(tita0).*sin(phi0);
matrizExcitaciones0 = Amplitudes.*(cos(Fase)+j*sin(Fase)); 
matrizZ0 = zeros(1,1);    
% I.2. Se calcula el factor de arreglo.
for m = 1:1:N
   for n = 1:1:N
       matrizZ0 = (matrizExcitaciones0(m,n)*exp(j*2*pi*(n-1)*d*(factorx0)).*exp(j*2*pi*(m-1)*d*(factory0))) + matrizZ0;    
   end
end   
% I.3. Se normaliza el factor de arreglo.
matrizNormalizada = (abs(matrizZ0/max(matrizZ0))); 
colorcurva3dB = 1/255*[53 0 124]; 
colormaximosChebyshev = 1/255*[218 112 214]; 

figure('Name','Corte del diagrama para observar posición de lóbulo principal');
ax = polaraxes;
polarplot(ax,tita0,20*log10(matrizNormalizada),'Color', colorcurva3dB,'Linewidth',1.35);
hold on 
% tita0 = linspace(-pi/2,pi/2); 
% rho0 = -25*ones(size(tita0)); 
% polarplot(tita0,rho0,'--','Color', colormaximosChebyshev,'Linewidth',1.25);
hold off 
thetalim([-90 90])
ax.ThetaDir = 'clockwise';
ax.ThetaZeroLocation = 'top';
rlim([-40 0])
thetaticks(-90:10:90)
rticks(-40:15:0)
ax.RTickLabel = string(ax.RTick) + " dB"; 
% text(deg2rad(ax.ThetaTick(3)),ax.RTick(2)*0.95,'NRLL = -25 dB','HorizontalAlignment','center','Rotation',75,'FontSize', 14,'Color', colormaximosChebyshev,'FontWeight', 'bold','FontName', 'Times New Roman')
labels = ax.ThetaTickLabel; 
labels{12} = '\theta_0 = 20'; 
ax.ThetaTickLabel = labels; 
ax.ThetaTickLabel = string(ax.ThetaTickLabel) + char(176);
ax.FontSize = 16;
title('Posición número 3: \theta_{0} = 20°','FontSize', 20,'FontName', 'Times New Roman');
ax.Title.FontSize = 20;


%PARTE III: SE LLAMA A FUNCIÓN DE DIRECTIVIDAD -> Para todos los módulos que usan esta función
directividad = fDirectividadPlano(N,d,matrizExcitaciones);   

 
 