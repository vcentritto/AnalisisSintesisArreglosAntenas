function [minimosTheta,posicionThetaPositivo,maximosTheta,posicionmaxTheta] = fRutinaCorteThetaChebyshev(ejeY,ejeZ,ejeX,angulocorteTheta)

% �CU�LES M�DULOS USAN LA FUNCI�N fRutinaCorteThetaChebyshev?
%   - Es una subfunci�n de fGraficayAnalisisDolphChebyshevMejorado, por lo que aplica en:
%       - M�dulo de Dolph-Chebyshev Mejorado

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fRutinaCorteThetaChebyshev?
% I.  Corte del diagrama de radiaci�n en un valor de theta ingresado por el usuario.
%     Se calculan el siguiente par�metro a partir de este corte:
%     - Posiciones de los nulos (num�ricamente y gr�ficamente).
%     - Posiciones de los m�ximos (num�ricamente y gr�ficamente).

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     ejeX ----------------------------> Intervalo de grados de theta (-90>theta>90).
%     ejeY ----------------------------> Intervalo de grados de phi (-90>phi>90)
%     ejeZ ----------------------------> Valores que toma el Factor de Arreglo.
%     angulocorteTheta ----------------> Valor de corte en theta.

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     minimosTheta -------------------------------> Posiciones de los nulos (corte en theta).
%     posicionThetaPositivo ----------------------> Altura de nulos (corte en theta).
%     maximosTheta -------------------------------> Posiciones de los m�ximos (corte en theta).
%     posicionmaxTheta ---------------------------> Altura de los m�ximos (corte en theta).

%PAR�METROS Y S�MBOLOS INICIALES
colorminimos3dB = 1/255*[199 21 133]; 
colorcurva3dB =  1/255*[53 0 124]; 
colormaximos3dB = 1/255*[218 112 214];
v = [0.5,0.5];

%PARTE I: CORTE DEL DIAGRAMA DE RADIACI�N EN THETA (PHI-AF) -> Para todos los m�dulos que usan esta funci�n
figure('Name','Corte del diagrama de radiaci�n (en valor de corte theta)');

%I.1. Se encuentra el corte del diagrama en theta
otrosCortesTheta = contour(ejeY,ejeZ,(ejeX - angulocorteTheta), v,'Color',colorcurva3dB,'LineWidth',1.75);

% I.2. Se calculan los nulos del corte en theta
minimocorteTheta = otrosCortesTheta(2,:);
[posicionTheta,indiceTheta] = findpeaks(-(minimocorteTheta()));
equivalenteTheta = otrosCortesTheta(1,:);
minimosTheta = equivalenteTheta(indiceTheta);

% I.3. Se calculan los m�ximos del corte en theta
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
title(['Corte del diagrama en \theta = ',num2str(angulocorteTheta),'�'],'FontSize', 20,'FontName', 'Times New Roman');
xlabel("\phi",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xtickformat('degrees');
ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:10:90);


