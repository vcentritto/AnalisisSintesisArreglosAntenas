function [minimosPhi,posicionPhiPositivo,maximosPhi,posicionmaxPhi] = fRutinaCortePhiChebyshev(ejeY,ejeZ,ejeX,angulocortePhi)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fRutinaCortePhiChebyshev?
%   - Es una subfunción de fGraficayAnalisisDolphChebyshevMejorado, por lo que aplica en:
%       - Módulo de análisis de arreglos en el plano. 
%       - Módulo de variación de la fase entre elementos para arreglos en el plano.

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fRutinaCortePhiChebyshev?
% I.  Corte del diagrama de radiación en un valor de phi ingresado por el usuario.
%     Se calculan el siguiente parámetro a partir de este corte:
%     - Posiciones de los nulos (numéricamente y gráficamente).

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     ejeX ----------------------------> Intervalo de grados de theta (-90>theta>90).
%     ejeY ----------------------------> Intervalo de grados de phi (-90>phi>90)
%     ejeZ ----------------------------> Valores que toma el Factor de Arreglo.
%     angulocortePhi ----------------> Valor de corte en phi.

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     minimosPhi --------------------------------> Posiciones de los nulos (corte en phi).
%     posicionPhiPositivo -----------------------> Altura de nulos (corte en phi).
%     maximosPhi --------------------------------> Posiciones de los máximos (corte en phi).
%     posicionmaxPhi ----------------------------> Altura de máximos(corte en phi).

%PARÁMETROS Y SÍMBOLOS INICIALES
colorminimos3dB = 1/255*[199 21 133]; 
colormaximos3dB = 1/255*[218 112 214];
colorcurva3dB = 1/255*[53 0 124]; 
v = [0.5,0.5];

%PARTE I: CORTE DEL DIAGRAMA DE RADIACIÓN EN PHI (THETA-AF) -> Para todos los módulos que usan esta función
figure('Name','Corte del diagrama de radiación (en valor de corte phi)');

%I.1. Se encuentra el corte del diagrama en phi
otrosCortesPhi = contour(ejeX,ejeZ,(ejeY - angulocortePhi), v,'Color',colorcurva3dB,'LineWidth',1.75);

% I.2. Se calculan los nulos del corte en phi
minimocortePhi = otrosCortesPhi(2,:);
[posicionPhi,indicePhi] = findpeaks(-(minimocortePhi()));
equivalentePhi = otrosCortesPhi(1,:);
minimosPhi = equivalentePhi(indicePhi);

% I.3. Se calculan los máximos del corte en phi
maximocortePhi = otrosCortesPhi(2,:);
[posicionmaxPhi,indicemaxPhi] = findpeaks(maximocortePhi());
equivalentemaxPhi = otrosCortesPhi(1,:);
maximosPhi = equivalentemaxPhi(indicemaxPhi);

% I.3. Se grafica el corte del diagrama en phi
posicionPhiPositivo = (-1)*posicionPhi;
hold on
grid minor
plot(minimosPhi,posicionPhiPositivo,'*','Color',colorminimos3dB,'LineWidth',1.50); 
plot(maximosPhi,posicionmaxPhi,'*','Color',colormaximos3dB,'LineWidth',1.50); 
ax = gca;
set(ax,'FontSize', 13);
title(['Corte del diagrama en \phi = ',num2str(angulocortePhi),'º'],'FontSize', 20,'FontName', 'Times New Roman');
xlabel("\theta",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xtickformat('degrees');
ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:10:90);