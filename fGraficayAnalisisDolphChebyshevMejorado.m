function [ejeZ,ejeX,ejeY] = fGraficayAnalisisDolphChebyshevMejorado(ejeZ,ejeX,ejeY,N,pTheta,pPhi,d,angulocorteTheta,angulocortePhi,nivelRelativoAdim,directividad)

% �CU�LES M�DULOS USAN LA FUNCI�N fGraficayAnalisisDolphChebyshevMejorado?
%   - M�dulo de Dolph-Chebyshev Mejorado

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fGraficayAnalisisDolphChebyshevMejorado?
% 1.   Representaciones gr�ficas tridimensionales (cartesiana y esf�rica) del diagrama de radiaci�n.
% 2.   C�lculo de los m�ximos en el diagrama de radiaci�n 
% 3.   Si es an�lisis: c�lculo de movimiento de l�bulo principal; si es s�ntesis: c�lculo del desfasaje 
%      (direcci�n x/direcci�n y/direcci�n z)
% 4.   C�lculo del nivel relativo de los l�bulos laterales.
% 5.   C�lculo de los m�nimos o nulos en el diagrama de radiaci�n.
% 6.   C�lculo del ancho de haz a - 3 dB y del ancho de haz principal.
% 7.   Cortes del diagrama de radiaci�n que contienen la posici�n de los nulos.
% 8.   C�lculo de directividad m�xima

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     ejeX ----------------------------> Valores que toma el Factor de Arreglo en theta
%     ejeY ----------------------------> Valores que toma el Factor de Arreglo en phi
%     ejeZ ----------------------------> Valores que toma el Factor de Arreglo en z
%     N -------------------------------> N�mero de elementos del arreglo
%     anguloX -------------------------> Desfasaje entre elementos en direcci�n "x".
%     �nguloY -------------------------> Desfasaje entre elementos en direcci�n "y".
%     �nguloZ -------------------------> Desfasaje entre elementos en direcci�n "z".
%     pTheta --------------------------> Posici�n del l�bulo principal en Theta
%     pPhi ----------------------------> Posici�n del l�bulo principal en Phi
%     d -------------------------------> Distancia inter-elemento.
%     �ngulocorteTheta ----------------> �ngulo para realizar curva de nivel en theta.
%     �ngulocortePhi ------------------> �ngulo para realizar curva de nivel en phi.
%     plano ---------------------------> Decisi�n entre plano xy o plano yz
%     verifCurva ----------------------> Indica en cual eje se realiza corte
%     caso ---------------------------> Decisi�n entre an�lisis o s�ntesis (m�todo de variaci�n de fases)
%     directividad --------------------> Valor de directividad m�xima.

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     ejeX ------> Intervalo de grados de theta.
%     ejeY ------> Intervalo de grados de phi.
%     ejeZ ------> Valores que toma el Factor de Arreglo.

% �CU�LES SUBFUNCIONES CONTIENE?:
%     fColoresPlanoChebyshev -------------------> Funci�n de colores para M�dulo de Dolph-Chebyshev Mejorado.
%     fAnchoHaz3DBPlanoXY ----------------------> Funci�n que calcula Ancho de Haz a - 3 dB y Ancho de Haz en plano XY para un n�mero de elementos igual 
%                                                 o mayor a 8  
%     fAnchoHaz3DBPlano4NXY --------------------> Funci�n que calcula Ancho de Haz a - 3 dB y Ancho de Haz en plano XY para un n�mero de elementos igual 
%                                                 o mayor a 4 y menor a 8.                                               
%     fAnchoHaz3DBPlanoYZ ----------------------> Funci�n que calcula Ancho de Haz a - 3 dB y Ancho de Haz en plano YZ para cualquier n�mero de elementos


%S�MBOLOS Y PAR�METROS INICIALES
%S�mbolos
rombos = char(9830);
flecha1 = char(8658);
flecha2 = char(8594);
letraL = char(8343);
letraP = char(8346);
theta = char(952);
phi = char(966);
letraN = char(8345);            
circulo = char(8226);
%Se llama a funci�n fColoresPlanoChebyshev
[colorChebyshev,colorChebyshevEsferica,colorminimosChebyshev,colormaximosChebyshev,colorlpChebyshev,coloranchohazChebyshev] = fColoresPlanoChebyshev;

%PARTE I: REPRESENTACIONES GR�FICAS TRIDIMENSIONALES

%I.1. Gr�fica en coordenadas esf�ricas
% - En escala lineal
figure('Name','Diagrama de radiaci�n (en coordenadas esf�ricas en escala lineal)');
x = abs(ejeZ).*sin(ejeX.*(pi/180)).*cos(ejeY.*(pi/180));
y = abs(ejeZ).*sin(ejeX.*(pi/180)).*sin(ejeY.*(pi/180));
z = abs(ejeZ).*cos(ejeX.*(pi/180));
ax = gca;
ax.FontSize = 15;
surf(x,y,z,ejeZ);
shading interp;
colorChebyshevGrafica = flipud(colorChebyshev); 
colormap(colorChebyshevGrafica);
xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([0 1.2])
barra = colorbar('Location', 'eastoutside');
set(barra, 'TickLabelInterpreter', 'latex', 'FontName', 'Times New Roman','FontSize', 16);
ylabel(barra,'|AF|','FontSize',18,'FontName','Times New Roman','FontWeight', 'bold');
caxis([0 1]);
title("Diagrama de Radiaci�n",'FontSize', 22,'FontName', 'Times New Roman');
set(ax,'XTickLabel',[], 'YTickLabel', [], 'ZTickLabel', []);
hold on
grid minor
quiver3(-1.2,0,0,1.2,0,0,2,'k','LineWidth',1);
quiver3(0,-1.2,0,0,1.2,0,2,'k','LineWidth',1);
quiver3(0,0,0,0,0,0.6,2,'k','LineWidth',1);
%Eje Z - Escala num�rica
text(0,0,1.25,'Z','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(-0.04,0.02,0,'0','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,0.5,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,0.5,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,1,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,1,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.25,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.75,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
%Eje Y - Escala num�rica
text(-0.09,1,0,'Y','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(0.15,-1,0,'- 1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[-1 -1],[0 0],'Color','k','LineWidth',1.1)
% text(0.15,-0.5,0,'- 0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[-0.5 -0.5],[0 0],'Color','k','LineWidth',1.1)
% text(0.15,0.5,0,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[0.5 0.5],[0 0],'Color','k','LineWidth',1.1)
% text(0.15,1,0,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[1 1],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[-0.75 -0.75],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[-0.25 -0.25],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[0.25 0.25],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[0.75 0.75],[0 0],'Color','k','LineWidth',1.1)
%Eje X - Escala num�rica
text(1.1,-0.25,0,'X','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(-1,0.09,0,'- 1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-1 -1],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
% text(-0.5,0.09,0,'- 0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.5 -0.5],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
% text(0.5,0.09,0,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([0.5 0.5],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
% text(1,0.09,0,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([1 1],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.75 -0.75],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.25 -0.25],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([0.75 0.75],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([0.25 0.25],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
view(141.7217, 39.9798);

% - En escala logar�tmica
figure('Name','Diagrama de radiaci�n (en coordenadas esf�ricas)');
r = 20*log10(ejeZ);
ro = r;
R = 40;
r = (max(r,-R) + R)/R;
x = r.*sin(ejeX.*(pi/180)).*cos(ejeY.*(pi/180));
y = r.*sin(ejeX.*(pi/180)).*sin(ejeY.*(pi/180));
z = r.*cos(ejeX.*(pi/180));
surf(x,y,z,ro);
shading interp;
barra = colorbar('Location', 'eastoutside');
set(barra, 'TickLabelInterpreter', 'latex', 'FontName', 'Times New Roman','FontSize', 16);
ylabel(barra,'AF [dB]','FontSize',18,'FontName','Times New Roman','FontWeight', 'bold');
caxis([-40 0])
colorChebyshevGraficaEsferica = flipud(colorChebyshevEsferica); 
colormap(colorChebyshevGraficaEsferica);
ax = gca;
ax.FontSize = 15;
xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([0 1.2])
title("Diagrama de Radiaci�n",'FontSize', 22,'FontName', 'Times New Roman');
set(ax,'XTickLabel',[], 'YTickLabel', [], 'ZTickLabel', []);
hold on
grid minor
quiver3(-1.2,0,0,1.2,0,0,2,'k','LineWidth',1);
quiver3(0,-1.2,0,0,1.2,0,2,'k','LineWidth',1);
quiver3(0,0,0,0,0,0.6,2,'k','LineWidth',1);
%Eje Z - Escala num�rica
text(0,0,1.25,'Z','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(-0.04,0.02,0,'0','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,0.5,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,0.5,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,1,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,1,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.25,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.75,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
%Eje Y - Escala num�rica
text(-0.09,1,0,'Y','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(0.15,-1,0,'- 1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[-1 -1],[0 0],'Color','k','LineWidth',1.1)
% text(0.15,-0.5,0,'- 0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[-0.5 -0.5],[0 0],'Color','k','LineWidth',1.1)
% text(0.15,0.5,0,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[0.5 0.5],[0 0],'Color','k','LineWidth',1.1)
% text(0.15,1,0,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[1 1],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[-0.75 -0.75],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[-0.25 -0.25],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[0.25 0.25],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[0.75 0.75],[0 0],'Color','k','LineWidth',1.1)
%Eje X - Escala num�rica
text(1.1,-0.25,0,'X','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(-1,0.09,0,'- 1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-1 -1],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
% text(-0.5,0.09,0,'- 0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.5 -0.5],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
% text(0.5,0.09,0,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([0.5 0.5],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
% text(1,0.09,0,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([1 1],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.75 -0.75],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.25 -0.25],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([0.75 0.75],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([0.25 0.25],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
view(141.7217, 39.9798);
% figure
% [C,h] = contourf(x,z,y,'ShowText','on');
% set(h, 'EdgeColor', 'none');
% colormap(colorChebyshevGrafica);
% xlim([-1 1])
% ylim([0 1])
% yticks(0:0.05:1);

%I.2. Gr�ficas en coordenadas cartesinas
% - En escala logar�tmica
figure('Name','Diagrama de radiaci�n (en coordenadas cartesianas en escala logar�tmica)');
hold on
ax = gca;
ax.FontSize = 15;
surf(ejeX, ejeY, 20*log10(ejeZ));
shading interp;
colorChebyshevGrafica = flipud(colorChebyshev); 
colormap(colorChebyshevGrafica);
grid on
title("Diagrama de Radiaci�n",'FontSize', 22,'FontName', 'Times New Roman');
xlabel("\theta",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
ylabel("\phi",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
zlabel("AF_{(dB)}",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:10:90);
yticks(-90:10:90);
xtickformat('degrees');
ytickformat('degrees');
xlim([-90 90]);
ylim([-90 90]);
zlim([-50 0]);
caxis([-50 0]);
view(-30.281,60.0606);
hold off

%Gr�fica de corte -> para observar nivel relativo de l�bulos laterales
figure('Name','Nivel relativo de los l�bulos laterales (corte del diagrama de radiaci�n en phi)');
v = [0.5,0.5];
hold on
grid minor
ax = gca;
ax.FontSize = 13;
colorcurva3dBChebyshev = 1/255*[53 0 124];
contour(ejeX,20*log10(ejeZ),(ejeY-pPhi),v,'Color', colorcurva3dBChebyshev,'LineWidth',1.75);
x1 = -90;
x2 = 90;
nivelLL = 20*log10(nivelRelativoAdim);
y1 = nivelLL;
plot([x1, x2], [y1, y1],"-.",'Color', colormaximosChebyshev,'LineWidth',1.50);
text(-85,(nivelLL + 1.5),['NRRL = ',num2str(nivelLL),' dB'],'FontSize', 14,'Color', colormaximosChebyshev,'FontWeight', 'bold','FontName', 'Times New Roman');
title('Nivel relativo de los l�bulos laterales','FontSize', 20,'FontName', 'Times New Roman');
xlabel("\theta",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
ylabel("AF_{(dB)}",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xtickformat('degrees');
xticks(-90:10:90);
ylim([-70 0]);
hold off

% - En escala lineal
figure('Name','Diagrama de radiaci�n (en coordenadas cartesianas en escala lineal)');
hold on 
ax = gca;
ax.FontSize = 15;
surf(ejeX,ejeY,ejeZ);
shading interp;
colorChebyshevGrafica = flipud(colorChebyshev); 
colormap(colorChebyshevGrafica);
grid on
title("Diagrama de Radiaci�n",'FontSize', 22,'FontName', 'Times New Roman');
xlabel("\theta",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
ylabel("\phi",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
zlabel("|AF|",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:10:90);
yticks(-90:10:90);
xlim([-90 90]);
ylim([-90 90]);
xtickformat('degrees');
ytickformat('degrees');
view(-30.281,60.0606);
    
%PARTE II: C�LCULO DE M�XIMOS - POSICI�N DEL L�BULO PRINCIPAL - DESFASAJE ENTRE ELEMENTOS 
%II.1. Posici�n del l�bulo principal
% - Representaci�n gr�fica 
plot3(pTheta,pPhi,1,'d','Color',colorlpChebyshev); 
disp(' ');
disp([num2str(rombos),num2str(rombos),' POSICI�N DE L�BULO PRINCIPAL ',num2str(rombos),num2str(rombos)]);
disp([' El l�bulo principal se encuentra en: (',num2str(theta),num2str(letraL),num2str(letraP),' = ',num2str(pTheta),'�,',num2str(phi),num2str(letraL),num2str(letraP),' = ',num2str(pPhi),'�,|AF|',num2str(letraL),num2str(letraP),' = 1)']);

%II.2. C�lculo de posiciones de l�bulos laterales
% - Se renombran ejes
Z = ejeZ;
X= ejeX;
Y= ejeY;
% - Planteamiento de condiciones
if N >= 4 && N < 8
    n = 2000;
    condicion = 1.5;
elseif N >= 8 && N < 16
    n = 3000;
    condicion = 1.5;
elseif N >= 16 && N < 32
    n = 4000;
    condicion = 1.25; 
elseif N >= 32
    n = 6000;
    condicion = 1.1; 
end
% - Rutina para calcular m�ximos
for z1 = 1:length(Z)
    for z2 = 1:length(Z)
        if Z(z1,z2) > nivelRelativoAdim
            Z(z1,z2) = 0;
        end
    end
end
maximos = [];
for i = 1:n
    [maxZ, maxIndice] = max(Z(:));
    [maxXIndice, maxYIndice] = ind2sub(size(Z), maxIndice);
    maxX = X(maxXIndice, maxYIndice);
    maxY = Y(maxXIndice, maxYIndice);
    if isempty(maximos)
        plot3(maxX, maxY, maxZ, '.','Color', colormaximosChebyshev,'Linewidth', 0.5);
        maximos = [maximos; [maxX, maxY, maxZ]];
    else
        distancias = sqrt(sum(bsxfun(@minus, maximos, [maxX, maxY, maxZ]).^2,2));
        if all(distancias > condicion)
            plot3(maxX, maxY, maxZ, '.','Color', colormaximosChebyshev,'Linewidth', 0.5);
            maximos = [maximos; [maxX, maxY, maxZ]];
        end
    end
    Z(maxXIndice, maxYIndice) = -Inf;
end

%II.3. Desfasaje entre elementos (S�ntesis)
pThetaR = pTheta*(pi/180);
pPhiR = pPhi*(pi/180);
% - Desfasaje entre elementos en direcci�n x
anguloX = -d*2*pi*sin(pThetaR)*cos(pPhiR);
anguloX = anguloX * (180/pi);
disp(' ');
disp([num2str(rombos),num2str(rombos),' �CU�L ES EL DESFASAJE ENTRE ELEMENTOS EN DIRECCI�N X? ',num2str(rombos),num2str(rombos)]);
disp([' El desfasaje entre elementos es igual a ',num2str(anguloX),'� en direcci�n x.']);
disp(' ');
% - Desfasaje entre elementos en direcci�n y
anguloY = -d*2*pi*sin(pThetaR)*sin(pPhiR);
anguloY = anguloY*(180/pi);
disp([num2str(rombos),num2str(rombos),' �CU�L ES EL DESFASAJE ENTRE ELEMENTOS EN DIRECCI�N Y? ',num2str(rombos),num2str(rombos)]);
disp([' El desfasaje entre elementos es igual a ',num2str(anguloY),'� en direcci�n y.']);
disp(' ');

%PARTE III: C�LCULO DE NIVEL RELATIVO DE L�BULOS LATERALES
%III.1. Se encuentra al m�ximo global
[maximoGlobalZ] = max(maximos(:,3));

%III.2. C�lculo del nivel relativo de los l�bulos laterales
NivelLL = 20*log10(maximoGlobalZ);
disp([num2str(rombos),num2str(rombos),' C�LCULO DEL NIVEL RELATIVO DE L�BULOS LATERALES ',num2str(rombos),num2str(rombos)]);
disp([' El nivel relativo de los l�bulos laterales es: ',num2str(NivelLL),' dB.']);
disp(' ');
    
%PARTE IV: C�LCULO DE MINIMOS O NULOS

%IV.1 Se renombran los ejes
X=ejeX;
Y=ejeY;
Z=ejeZ;

%IV.2: Planteamiento de condiciones
if N >= 4 && N < 8
    n = 12000;
elseif N >= 8 && N < 16
    n = 17000;
elseif N >= 16 
    n = 20000;
end
condicion = 1.5; 

%IV.3. Rutina para calcular m�nimos o nulos  
minimos = [];
for i = 1:n
    [minZ, minIndice] = min(Z(:));
    [minXIndice, minYIndice] = ind2sub(size(Z), minIndice);
    minX = X(minXIndice, minYIndice);
    minY = Y(minXIndice, minYIndice);
    if isempty(minimos)
        plot3(minX, minY, minZ, '.','Color', colorminimosChebyshev,'Linewidth', 1.1);
        minimos = [minimos; [minX, minY, minZ]];
    else
        distancias = sqrt(sum(bsxfun(@minus, minimos, [minX, minY, minZ]).^2,2));
        if all(distancias > condicion)
            plot3(minX, minY, minZ, '.','Color', colorminimosChebyshev,'Linewidth', 1.1);
            minimos = [minimos; [minX, minY, minZ]];
        end
    end
    Z(minXIndice, minYIndice) = Inf;
end

%PARTE V: C�LCULO DE ANCHO DE HAZ A -3dB Y ANCHO DE HAZ PRINCIPAL -> Para todos los m�dulos que usan esta funci�n
  
% V.1. Gr�fica de ancho de haz a - 3 dB en gr�fica cartesiana en 3D
hold on
contour3(ejeX,ejeY,ejeZ,[0.707,0.707],'--','Color', coloranchohazChebyshev, 'Linewidth', 1.45)

%V.2. Cortes del diagrama en posici�n del l�bulo principal para theta y phi -> c�lculo de ancho haz principal, ancho de haz a - 3 dB y nulos del corte
%V.2.1. Caso para cualquier n�mero de elementos
% - Se llama funci�n fAnchoHaz3DBPlanoXYChebyshev
[anchoDeHaz3dBParaTheta,anchoDeHaz3dBParaPhi,mDesfasajeAmbosParaPhi,posicionMinDesfasajeAmbosParaPhiPositivo,maxDesfasajeAmbosParaPhi,posicionMaxDesfasajePhiParaAmbos,anchoHazDesfasajeAmbosParaPhi, mDesfasajeAmbosParaTheta, posicionMinDesfasajeAmbosParaThetaPositivo,maxDesfasajeAmbosParaTheta,posicionMaxDesfasajeAmbosParaTheta,anchoHazDesfasajeAmbosParaTheta] = fAnchoHaz3DBPlanoXYChebyshev(ejeY,ejeZ,ejeX,pTheta,pPhi,NivelLL);
%V.2.1.1. Corte en PHI (patr�n 2D THETA-AF) -> Muestra por consola ancho de haz principal, ancho de haz a - 3 dB y nulos en el patr�n.
disp([num2str(rombos),num2str(rombos),' CORTE DEL DIAGRAMA EN ',num2str(phi),num2str(letraL),num2str(letraP),' = ',num2str(pPhi),'� ',num2str(flecha1),' ANCHO DE HAZ PRINCIPAL, ANCHO DE HAZ A - 3 DB y NULOS EN EL CORTE ',num2str(rombos),num2str(rombos)]);
disp([' ',num2str(flecha1),' A continuaci�n, los resultados del ancho de haz principal, ancho a - 3 dB y nulos del corte en ',num2str(phi),num2str(letraL),num2str(letraP),' = ',num2str(pPhi),'� ']);
disp(' ');
% - Ancho de haz principal -> se aplican ciertas condiciones
if anchoHazDesfasajeAmbosParaPhi == 0
    disp(['     ',num2str(circulo),' No se pudo calcular el ancho principal']);
    disp(['        ',num2str(flecha2),' Posiblemente, el l�bulo principal sale del siguiente intervalo: (-90�<',num2str(theta),'<90�).']);
else
    if anchoDeHaz3dBParaPhi > anchoHazDesfasajeAmbosParaPhi
       disp(['     ',num2str(circulo),' No se pudo calcular el ancho principal']);
       disp(['        ',num2str(flecha2),' Posiblemente, el l�bulo principal sale del siguiente intervalo: (-90�<',num2str(theta),'<90�).']);
    else
       disp(['     ',num2str(circulo),' Ancho de haz principal = ' num2str(anchoHazDesfasajeAmbosParaPhi) '�']);
    end
end
disp(' ');
% - Ancho de haz a - 3dB -> se aplican ciertas condiciones
if anchoDeHaz3dBParaPhi == 0
    disp(['     ',num2str(circulo),' No se pudo calcular el ancho de haz a - 3 dB.']);
    disp(['        ',num2str(flecha2),' El l�bulo principal sale del siguiente intervalo: (-90�<',num2str(theta),'<90�).']);
else
    disp(['     ',num2str(circulo),' Ancho de haz a - 3 dB = ' num2str(anchoDeHaz3dBParaPhi) '�']);
end
disp(' ');
% - Posiciones de nulos en el corte del patr�n
disp(['     ',num2str(circulo),' Las posiciones de los nulos (',num2str(theta),num2str(letraN),',|AF|',num2str(letraN),') son las siguientes:']);
tam = size(mDesfasajeAmbosParaPhi);
cantMinimos = tam(2);
for impMin = 1:1:cantMinimos
     xPosicionLobuloMin = mDesfasajeAmbosParaPhi(impMin);
     yPosicionLobuloMin = posicionMinDesfasajeAmbosParaPhiPositivo(impMin);
    [imprimirMinimos] = fSimbolosMinTheta(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
    disp(imprimirMinimos);
    disp(' ');
end
% - Posiciones de l�bulos laterales en el corte del patr�n
disp(['     ',num2str(circulo),' Las posiciones de los l�bulos laterales (',num2str(theta),num2str(letraL),num2str(letraL),',|AF|',num2str(letraL),num2str(letraL),') son las siguientes:']);
tam = size(maxDesfasajeAmbosParaPhi);
tamMaximos = tam(2);
for impMax = 1:1:tamMaximos
     xPosicionLobulo = maxDesfasajeAmbosParaPhi(impMax);
     yPosicionLobulo = posicionMaxDesfasajePhiParaAmbos(impMax);
     [imprimirMaximos] = fSimbolosMaxTheta(xPosicionLobulo,yPosicionLobulo,impMax,tamMaximos);
    disp(imprimirMaximos);
    disp(' ');
end

%V.2.1.2. Corte en THETA (patr�n 2D PHI-AF) -> Muestra por consola ancho de haz principal, ancho de haz a - 3 dB y nulos en el patr�n.
disp([num2str(rombos),num2str(rombos),' CORTE DEL DIAGRAMA EN ',num2str(theta),num2str(letraL),num2str(letraP),' = ',num2str(pTheta),'� ',num2str(flecha1),' ANCHO DE HAZ PRINCIPAL, ANCHO DE HAZ A - 3 DB y NULOS EN EL CORTE ',num2str(rombos),num2str(rombos)]);
disp([' ',num2str(flecha1),' A continuaci�n, los resultados del ancho de haz principal, ancho a - 3 dB y nulos del corte en ',num2str(theta),num2str(letraL),num2str(letraP),' = ',num2str(pPhi),'� ']);
disp(' ');
% - Ancho de haz principal -> se aplican ciertas condiciones
if anchoHazDesfasajeAmbosParaTheta == 0
    disp(['     ',num2str(circulo),' No se pudo calcular el ancho principal']);
    disp(['        ',num2str(flecha2),' Posiblemente, el l�bulo principal sale del siguiente intervalo: (-90�<',num2str(phi),'<90�).']);
else
    if anchoDeHaz3dBParaTheta > anchoHazDesfasajeAmbosParaTheta
       disp(['     ',num2str(circulo),' No se pudo calcular el ancho principal']);
       disp(['        ',num2str(flecha2),' Posiblemente, el l�bulo principal sale del siguiente intervalo: (-90�<',num2str(phi),'<90�).']);
    else
       disp(['     ',num2str(circulo),' Ancho de haz principal = ' num2str(anchoHazDesfasajeAmbosParaTheta) '�']);
    end
end
disp(' ');
% - Ancho de haz a - 3dB -> se aplican ciertas condiciones
if anchoDeHaz3dBParaTheta == 0
    disp(['     ',num2str(circulo),' No se pudo calcular el ancho de haz a - 3 dB.']);
    disp(['        ',num2str(flecha2),' El l�bulo principal sale del siguiente intervalo: (-90�<',num2str(phi),'<90�).']);
else
    disp(['     ',num2str(circulo),' Ancho de haz a - 3 dB = ' num2str(anchoDeHaz3dBParaTheta) '�']);
end
disp(' ');
% - Posiciones de nulos en el corte del patr�n
disp(['     ',num2str(circulo),' Las posiciones de los nulos (',num2str(phi),num2str(letraN),',|AF|',num2str(letraN),') son las siguientes:']);
tam = size(mDesfasajeAmbosParaTheta);
cantMinimos = tam(2);
for impMin = 1:1:cantMinimos
     xPosicionLobuloMin = mDesfasajeAmbosParaTheta(impMin);
     yPosicionLobuloMin = posicionMinDesfasajeAmbosParaThetaPositivo(impMin);
    [imprimirMinimos] = fSimbolosMinPhi(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
    disp(imprimirMinimos);
    disp(' ');
end
% - Posiciones de l�bulos laterales en el corte del patr�n
disp(['     ',num2str(circulo),' Las posiciones de los l�bulos laterales (',num2str(phi),num2str(letraL),num2str(letraL),',|AF|',num2str(letraL),num2str(letraL),') son las siguientes:']);
tam = size(maxDesfasajeAmbosParaTheta);
tamMaximos = tam(2);
for impMax = 1:1:tamMaximos
     xPosicionLobulo = maxDesfasajeAmbosParaTheta(impMax);
     yPosicionLobulo = posicionMaxDesfasajeAmbosParaTheta(impMax);
     [imprimirMaximos] = fSimbolosMaxPhi(xPosicionLobulo,yPosicionLobulo,impMax,tamMaximos);
    disp(imprimirMaximos);
    disp(' ');
end

%PARTE VI: C�LCULO DE LA DIRECTIVIDAD
disp([num2str(rombos),num2str(rombos),' DIRECTIVIDAD M�XIMA ',num2str(rombos),num2str(rombos)]);
disp(['   ',num2str(circulo),' Directividad m�xima en adimensional = ',num2str(directividad),' adim']);
disp(' ');
directividaddB = 10*log10(directividad);
disp(['   ',num2str(circulo),' Directividad m�xima en dB = ',num2str(directividaddB),' dB']);
disp(' ');

%PARTE VII: C�LCULO DE CORTE DE DIAGRAMA DE RADIACI�N   
%VII.1. No hay corte del diagrama ni en theta ni en phi
disp([num2str(rombos),num2str(rombos),' OTROS CORTES DEL DIAGRAMA DE RADIACI�N ',num2str(rombos),num2str(rombos)]);
if angulocortePhi == 100 && angulocorteTheta == 100
    disp(['     ',num2str(circulo),' No se solicitaron otros cortes del diagrama de radiaci�n (ni en theta ni en phi).']);

%VII.2. Corte del diagrama en theta
elseif angulocorteTheta ~= 100 && angulocortePhi == 100
% - Se llama a funci�n fRutinaCorteThetaChebyshev
    [minimosTheta,posicionThetaPositivo,maximosTheta,posicionmaxTheta] = fRutinaCorteThetaChebyshev(ejeY,ejeZ,ejeX,angulocorteTheta);
    disp(['     ',num2str(circulo),' Corte del diagrama en ',num2str(theta),' = ',num2str(angulocorteTheta),'�.']);
% - Se muestran los nulos del corte en theta
    disp(['      ',num2str(flecha1),' Las posiciones de los nulos (',num2str(phi),num2str(letraN),',|AF|',num2str(letraN),') en ',num2str(theta),' = ',num2str(angulocorteTheta),'� son las siguientes:']);
    tam = size(minimosTheta);
    cantMinimos = tam(2);
    for impMin = 1:1:cantMinimos
         xPosicionLobuloMin = minimosTheta(impMin);
         yPosicionLobuloMin = posicionThetaPositivo(impMin);
        [imprimirMinimos] = fSimbolosMinPhi(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
        disp(imprimirMinimos);
        disp(' ');
    end
% - Se muestran los maximos del corte en theta
    disp(['      ',num2str(flecha1),' Las posiciones de los m�ximos (',num2str(phi),num2str(letraL),num2str(letraL),',|AF|',num2str(letraL),num2str(letraL),') en ',num2str(theta),' = ',num2str(angulocorteTheta),'� son las siguientes:']);
    tam = size(maximosTheta);
    tamMaximos = tam(2);
    for impMax = 1:1:tamMaximos
        xPosicionLobulo = maximosTheta(impMax);
        yPosicionLobulo = posicionmaxTheta(impMax);
        [imprimirMaximos] = fSimbolosMaxPhi(xPosicionLobulo,yPosicionLobulo,impMax,tamMaximos);
        disp(imprimirMaximos);
        disp(' ');
    end
    disp(' ');

%VII.3. Corte del diagrama en phi
elseif angulocortePhi ~= 100 && angulocorteTheta == 100
% - Se llama a funci�n fRutinaCortePhi
    [minimosPhi,posicionPhiPositivo,maximosPhi,posicionmaxPhi] = fRutinaCortePhiChebyshev(ejeY,ejeZ,ejeX,angulocortePhi);
   disp(['     ',num2str(circulo),' Corte del diagrama en ',num2str(phi),' = ',num2str(angulocortePhi),'�.']);
   % - Se muestran los nulos del corte en phi
   disp(['      ',num2str(flecha1),' Las posiciones de los nulos (',num2str(theta),num2str(letraN),',|AF|',num2str(letraN),') en ',num2str(phi),' = ',num2str(angulocortePhi),'� son las siguientes:']);
   tam = size(minimosPhi);
   cantMinimos = tam(2);
   for impMin = 1:1:cantMinimos
         xPosicionLobuloMin = minimosPhi(impMin);
         yPosicionLobuloMin = posicionPhiPositivo(impMin);
        [imprimirMinimos] = fSimbolosMinTheta(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
        disp(imprimirMinimos);
        disp(' ');
   end
% - Posiciones de m�ximos en el corte del patr�n
    disp(['      ',num2str(flecha1),' Las posiciones de los m�ximos (',num2str(theta),num2str(letraL),num2str(letraL),',|AF|',num2str(letraL),num2str(letraL),') en ',num2str(phi),' = ',num2str(angulocortePhi),'� son las siguientes:']);
    tam = size(maximosPhi);
    tamMaximos = tam(2);
    for impMax = 1:1:tamMaximos
         xPosicionLobulo = maximosPhi(impMax);
         yPosicionLobulo = posicionmaxPhi(impMax);
        [imprimirMaximos] = fSimbolosMaxTheta(xPosicionLobulo,yPosicionLobulo,impMax,tamMaximos);
        disp(imprimirMaximos);
        disp(' ');
    end
    disp(' ');

%VII.4. Corte del diagrama en theta y en phi
elseif angulocortePhi ~= 100 && angulocorteTheta ~= 100
%VII.4.1. Se llama a funci�n fRutinaCorteThetaChebyshev    
   [minimosTheta,posicionThetaPositivo,maximosTheta,posicionmaxTheta] = fRutinaCorteThetaChebyshev(ejeY,ejeZ,ejeX,angulocorteTheta);
   disp(['     ',num2str(circulo),' Corte del diagrama en ',num2str(theta),' = ',num2str(angulocorteTheta),'�.']);
  % - Se muestran los nulos del corte en theta
   disp(['      ',num2str(flecha1),' Las posiciones de los nulos (',num2str(phi),num2str(letraN),',|AF|',num2str(letraN),') en ',num2str(theta),' = ',num2str(angulocorteTheta),'� son las siguientes:']);   
   tam = size(minimosTheta);
   cantMinimos = tam(2);
   for impMin = 1:1:cantMinimos
         xPosicionLobuloMin = minimosTheta(impMin);
         yPosicionLobuloMin = posicionThetaPositivo(impMin);
        [imprimirMinimos] = fSimbolosMinPhi(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
        disp(imprimirMinimos);
        disp(' ');
   end
   % - Se muestran los maximos del corte en theta
    disp(['      ',num2str(flecha1),' Las posiciones de los m�ximos (',num2str(phi),num2str(letraL),num2str(letraL),',|AF|',num2str(letraL),num2str(letraL),') en ',num2str(theta),' = ',num2str(angulocorteTheta),'� son las siguientes:']);
    tam = size(maximosTheta);
    tamMaximos = tam(2);
    for impMax = 1:1:tamMaximos
        xPosicionLobulo = maximosTheta(impMax);
        yPosicionLobulo = posicionmaxTheta(impMax);
        [imprimirMaximos] = fSimbolosMaxPhi(xPosicionLobulo,yPosicionLobulo,impMax,tamMaximos);
        disp(imprimirMaximos);
        disp(' ');
    end
    
%VII.4.2. Se llama a funci�n fRutinaCortePhi    
    [minimosPhi,posicionPhiPositivo,maximosPhi,posicionmaxPhi] = fRutinaCortePhiChebyshev(ejeY,ejeZ,ejeX,angulocortePhi);
   disp(['     ',num2str(circulo),' Corte del diagrama en ',num2str(phi),' = ',num2str(angulocortePhi),'�.']);
% - Se muestran los nulos del corte en phi
   disp(['      ',num2str(flecha1),' Las posiciones de los nulos (',num2str(theta),num2str(letraN),',|AF|',num2str(letraN),') en ',num2str(phi),' = ',num2str(angulocortePhi),'� son las siguientes:']);
   tam = size(minimosPhi);
   cantMinimos = tam(2);
   for impMin = 1:1:cantMinimos
         xPosicionLobuloMin = minimosPhi(impMin);
         yPosicionLobuloMin = posicionPhiPositivo(impMin);
        [imprimirMinimos] = fSimbolosMinTheta(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
        disp(imprimirMinimos);
        disp(' ');
   end
% - Posiciones de m�ximos en el corte del patr�n
    disp(['      ',num2str(flecha1),' Las posiciones de los m�ximos (',num2str(theta),num2str(letraL),num2str(letraL),',|AF|',num2str(letraL),num2str(letraL),') en ',num2str(phi),' = ',num2str(angulocortePhi),'� son las siguientes:']);
    tam = size(maximosPhi);
    tamMaximos = tam(2);
    for impMax = 1:1:tamMaximos
         xPosicionLobulo = maximosPhi(impMax);
         yPosicionLobulo = posicionmaxPhi(impMax);
        [imprimirMaximos] = fSimbolosMaxTheta(xPosicionLobulo,yPosicionLobulo,impMax,tamMaximos);
        disp(imprimirMaximos);
        disp(' ');
    end
end
    disp(' ');

disp('--------------------------------------------------------------------------------------------------------------');



