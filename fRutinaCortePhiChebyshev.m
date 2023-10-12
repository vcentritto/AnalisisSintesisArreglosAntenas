function [minimosPhi,posicionPhiPositivo,maximosPhi,posicionmaxPhi] = fRutinaCortePhiChebyshev(ejeY,ejeZ,ejeX,angulocortePhi)

% �CU�LES M�DULOS USAN LA FUNCI�N fRutinaCortePhiChebyshev?
%   - Es una subfunci�n de fGraficayAnalisisDolphChebyshevMejorado, por lo que aplica en:
%       - M�dulo de an�lisis de arreglos en el plano. 
%       - M�dulo de variaci�n de la fase entre elementos para arreglos en el plano.

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fRutinaCortePhiChebyshev?
% I.  Corte del diagrama de radiaci�n en un valor de phi ingresado por el usuario.
%     Se calculan el siguiente par�metro a partir de este corte:
%     - Posiciones de los nulos (num�ricamente y gr�ficamente).

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     ejeX ----------------------------> Intervalo de grados de theta (-90>theta>90).
%     ejeY ----------------------------> Intervalo de grados de phi (-90>phi>90)
%     ejeZ ----------------------------> Valores que toma el Factor de Arreglo.
%     angulocortePhi ----------------> Valor de corte en phi.

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     minimosPhi --------------------------------> Posiciones de los nulos (corte en phi).
%     posicionPhiPositivo -----------------------> Altura de nulos (corte en phi).
%     maximosPhi --------------------------------> Posiciones de los m�ximos (corte en phi).
%     posicionmaxPhi ----------------------------> Altura de m�ximos(corte en phi).

%PAR�METROS Y S�MBOLOS INICIALES
colorminimos3dB = 1/255*[199 21 133]; 
colormaximos3dB = 1/255*[218 112 214];
colorcurva3dB = 1/255*[53 0 124]; 
v = [0.5,0.5];

%PARTE I: CORTE DEL DIAGRAMA DE RADIACI�N EN PHI (THETA-AF) -> Para todos los m�dulos que usan esta funci�n
figure('Name','Corte del diagrama de radiaci�n (en valor de corte phi)');

%I.1. Se encuentra el corte del diagrama en phi
otrosCortesPhi = contour(ejeX,ejeZ,(ejeY - angulocortePhi), v,'Color',colorcurva3dB,'LineWidth',1.75);

% I.2. Se calculan los nulos del corte en phi
minimocortePhi = otrosCortesPhi(2,:);
[posicionPhi,indicePhi] = findpeaks(-(minimocortePhi()));
equivalentePhi = otrosCortesPhi(1,:);
minimosPhi = equivalentePhi(indicePhi);

% I.3. Se calculan los m�ximos del corte en phi
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
title(['Corte del diagrama en \phi = ',num2str(angulocortePhi),'�'],'FontSize', 20,'FontName', 'Times New Roman');
xlabel("\theta",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xtickformat('degrees');
ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:10:90);