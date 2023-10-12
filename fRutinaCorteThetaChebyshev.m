function [minimosTheta,posicionThetaPositivo,maximosTheta,posicionmaxTheta] = fRutinaCorteThetaChebyshev(ejeY,ejeZ,ejeX,angulocorteTheta)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fRutinaCorteThetaChebyshev?
%   - Es una subfunción de fGraficayAnalisisDolphChebyshevMejorado, por lo que aplica en:
%       - Módulo de Dolph-Chebyshev Mejorado

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fRutinaCorteThetaChebyshev?
% I.  Corte del diagrama de radiación en un valor de theta ingresado por el usuario.
%     Se calculan el siguiente parámetro a partir de este corte:
%     - Posiciones de los nulos (numéricamente y gráficamente).
%     - Posiciones de los máximos (numéricamente y gráficamente).

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     ejeX ----------------------------> Intervalo de grados de theta (-90>theta>90).
%     ejeY ----------------------------> Intervalo de grados de phi (-90>phi>90)
%     ejeZ ----------------------------> Valores que toma el Factor de Arreglo.
%     angulocorteTheta ----------------> Valor de corte en theta.

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     minimosTheta -------------------------------> Posiciones de los nulos (corte en theta).
%     posicionThetaPositivo ----------------------> Altura de nulos (corte en theta).
%     maximosTheta -------------------------------> Posiciones de los máximos (corte en theta).
%     posicionmaxTheta ---------------------------> Altura de los máximos (corte en theta).

%PARÁMETROS Y SÍMBOLOS INICIALES
colorminimos3dB = 1/255*[199 21 133]; 
colorcurva3dB =  1/255*[53 0 124]; 
colormaximos3dB = 1/255*[218 112 214];
v = [0.5,0.5];

%PARTE I: CORTE DEL DIAGRAMA DE RADIACIÓN EN THETA (PHI-AF) -> Para todos los módulos que usan esta función
figure('Name','Corte del diagrama de radiación (en valor de corte theta)');

%I.1. Se encuentra el corte del diagrama en theta
otrosCortesTheta = contour(ejeY,ejeZ,(ejeX - angulocorteTheta), v,'Color',colorcurva3dB,'LineWidth',1.75);

% I.2. Se calculan los nulos del corte en theta
minimocorteTheta = otrosCortesTheta(2,:);
[posicionTheta,indiceTheta] = findpeaks(-(minimocorteTheta()));
equivalenteTheta = otrosCortesTheta(1,:);
minimosTheta = equivalenteTheta(indiceTheta);

% I.3. Se calculan los máximos del corte en theta
maximocorteTheta = otrosCortesTheta(2,:);
[posicionmaxTheta,indicemaxTheta] = findpeaks(maximocorteTheta());
equivalentemaxTheta = otrosCortesTheta(1,:);
maximosTheta = equivalentemaxTheta(indicemaxTheta);

% I.3. Se grafica el corte del diagrama en theta
posicionThetaPositivo = (-1)*posicionTheta;
hold on
grid minor
plot(minimosTheta,posicionThetaPositivo,'*','Color',colorminimos3dB,'LineWidth',1.50); 
plot(maximosTheta,posicionmaxTheta,'*','Color',colormaximos3dB,'LineWidth',1.50); 
ax = gca;
set(ax,'FontSize', 13);
title(['Corte del diagrama en \theta = ',num2str(angulocorteTheta),'º'],'FontSize', 20,'FontName', 'Times New Roman');
xlabel("\phi",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xtickformat('degrees');
ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:10:90);


