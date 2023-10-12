function [ejeZ,ejeX,ejeY] = fGraficayAnalisisPlano(ejeZ,ejeX,ejeY,N,anguloX,anguloY,pTheta,pPhi,d,angulocorteTheta,angulocortePhi,casoAnalisisoSintesis,verif,directividad)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fGraficayAnalisisPlano?
%   - Módulo de análisis de arreglos en el plano. 
%   - Módulo de variación de la fase entre elementos para arreglos en el plano

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fGraficayAnalisisPlano?
% I.    Representaciones gráficas tridimensionales (cartesiana y esférica) del diagrama de radiación.
% II.   Cálculo de los máximos en el diagrama de radiación 
% III.  Si es análisis: cálculo de movimiento de lóbulo principal; si es síntesis: cálculo del desfasaje 
%      (dirección x y dirección y)
% IV.   Cálculo del nivel relativo de los lóbulos laterales.
% V.    Cálculo de los mínimos o nulos en el diagrama de radiación.
% VI.   Cálculo del ancho de haz a - 3 dB y del ancho de haz principal.
% VII.  Cortes del diagrama de radiación que contienen la posición de los nulos.
% VIII. Cálculo de directividad máxima

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     ejeX ----------------------------> Intervalo de grados de theta (-90>theta>90).
%     ejeY ----------------------------> Intervalo de grados de phi(-90>phi>90).
%     ejeZ ----------------------------> Valores que toma el Factor de Arreglo.
%     N -------------------------------> Número de elementos del arreglo (Nx = Ny).
%     anguloX -------------------------> Desfasaje entre elementos en dirección "x".
%     ánguloY -------------------------> Desfasaje entre elementos en dirección "y".
%     pTheta --------------------------> Posición del lóbulo principal en theta
%     pPhi ----------------------------> Posición del lóbulo principal en phi
%     d -------------------------------> Distancia inter-elemento (dx = dy).
%     ángulocorteTheta ----------------> Valor de corte en theta.
%     ángulocortePhi ------------------> Valor de corte en phi.
%     casoAnalisisoSintesis -----------> Decisión entre análisis o síntesis (método de variación de fases)
%     verif ---------------------------> Decisión entre distribución de amplitud uniforme o no uniforme
%     directividad --------------------> Valor de directividad máxima.


% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     ejeX ------> Intervalo de grados de theta.
%     ejeY ------> Intervalo de grados de phi.
%     ejeZ ------> Valores que toma el Factor de Arreglo.

% ¿CUÁLES SUBFUNCIONES CONTIENE?:
%     fColoresPlano ----------------------------> Función de colores para Análisis y Síntesis de Posición de Lóbulo Principal
%     extrema y extrema2------------------------> Función EXTERNA que permite obtener máximos para Análisis y Síntesis de Posición de Lóbulo Principal
%                                                 Referencia: Carlos Adrian Vargas Aguilera (2023). extrema.m, extrema2.m (https://www.mathworks.com/matlabcentral/fileexchange/12275-extrema-m-extrema2-m), MATLAB Central File Exchange. 
%     fAnchoHaz3DBPlanoXY ----------------------> Función que calcula Ancho de Haz a - 3 dB y Ancho de Haz en plano XY para un número de elementos igual 
%                                                 o mayor a 8  
%     fAnchoHaz3DBPlano4NXY --------------------> Función que calcula Ancho de Haz a - 3 dB y Ancho de Haz en plano XY para un número de elementos igual 
%                                                 o mayor a 4 y menor a 8.                                               
%     fAnchoHaz3DBPlanoYZ ----------------------> Función que calcula Ancho de Haz a - 3 dB y Ancho de Haz en plano YZ para cualquier número de elementos

%SÍMBOLOS Y PARÁMETROS INICIALES
%Símbolos
rombos = char(9830);
flecha1 = char(8658);
flecha2 = char(8594);
letraL = char(8343);
letraP = char(8346);
theta = char(952);
phi = char(966);
letraN = char(8345);            
circulo = char(8226);
%Se llama a función fColoresPlano
[colorDUniforme,colorDUniformeEsferica,colorminimosuniforme,colormaximosuniforme,coloranchohazuniforme,colorlpuniforme] = fColoresPlano;

%PARTE I: REPRESENTACIONES GRÁFICAS TRIDIMENSIONALES -> Para todos los módulos que usan esta función

%I.1. Gráfica en coordenadas esféricas

% - En escala lineal
figure('Name','Diagrama de radiación (en coordenadas esféricas en escala lineal)');
x = abs(ejeZ).*sin(ejeX.*(pi/180)).*cos(ejeY.*(pi/180));
y = abs(ejeZ).*sin(ejeX.*(pi/180)).*sin(ejeY.*(pi/180));
z = abs(ejeZ).*cos(ejeX.*(pi/180));
ax = gca;
ax.FontSize = 15;
surf(x,y,z,ejeZ);
shading interp;
colorDUniformeGrafica = flipud(colorDUniforme); 
colormap(colorDUniformeGrafica);
xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([0 1.2])
barra = colorbar('Location', 'eastoutside');
set(barra, 'TickLabelInterpreter', 'latex', 'FontName', 'Times New Roman','FontSize', 16);
ylabel(barra,'|AF|','FontSize',18,'FontName','Times New Roman','FontWeight', 'bold');
caxis([0 1]);
title("Diagrama de Radiación",'FontSize', 22,'FontName', 'Times New Roman');
set(ax,'XTickLabel',[], 'YTickLabel', [], 'ZTickLabel', []);
hold on
grid minor
quiver3(-1.2,0,0,1.2,0,0,2,'k','LineWidth',1);
quiver3(0,-1.2,0,0,1.2,0,2,'k','LineWidth',1);
quiver3(0,0,0,0,0,0.6,2,'k','LineWidth',1);
%Eje Z - Escala numérica
text(0,0,1.25,'Z','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(-0.04,0.02,0,'0','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,0.5,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,0.5,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,1,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,1,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.25,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.75,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
%Eje Y - Escala numérica
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
%Eje X - Escala numérica
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

% - En escala logarítmica
figure('Name','Diagrama de radiación (en coordenadas esféricas en escala logarítmica)');
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
colorDUniformeGraficaEsferica = flipud(colorDUniformeEsferica); 
colormap(colorDUniformeGraficaEsferica);
ax = gca;
ax.FontSize = 15;
xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([0 1.2])
title("Diagrama de Radiación",'FontSize', 22,'FontName', 'Times New Roman');
set(ax,'XTickLabel',[], 'YTickLabel', [], 'ZTickLabel', []);
hold on
grid minor
quiver3(-1.2,0,0,1.2,0,0,2,'k','LineWidth',1);
quiver3(0,-1.2,0,0,1.2,0,2,'k','LineWidth',1);
quiver3(0,0,0,0,0,0.6,2,'k','LineWidth',1);
%Eje Z - Escala numérica
text(0,0,1.25,'Z','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(-0.04,0.02,0,'0','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,0.5,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,0.5,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,1,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,1,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.25,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.75,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
%Eje Y - Escala numérica
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
%Eje X - Escala numérica
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

%I.2. Gráficas en coordenadas cartesianas
% - En escala logarítmica
figure('Name','Diagrama de radiación (en coordenadas cartesianas en escala logarítmica)');
hold on
ax = gca;
ax.FontSize = 15;
surf(ejeX, ejeY, 20*log10(ejeZ));
shading interp;
colorDUniformeGrafica = flipud(colorDUniforme); 
colormap(colorDUniformeGrafica);
grid on
title("Diagrama de Radiación",'FontSize', 22,'FontName', 'Times New Roman');
xlabel("\theta",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
ylabel("\phi",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
zlabel("AF_{(dB)}",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:10:90);
yticks(-90:10:90);
xtickformat('degrees');
ytickformat('degrees');
zlim([-50 0]);
caxis([-50 0]);
view(-30.281,60.0606);
hold off

% - En escala lineal
figure('Name','Diagrama de radiación (en coordenadas cartesianas en escala lineal)');
hold on 
ax = gca;
ax.FontSize = 15;
surf(ejeX,ejeY,ejeZ);
shading interp;
colorDUniformeGrafica = flipud(colorDUniforme); 
colormap(colorDUniformeGrafica);
grid on
title("Diagrama de Radiación",'FontSize', 22,'FontName', 'Times New Roman');
xlabel("\theta",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
ylabel("\phi",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
zlabel("|AF|",'FontSize', 18,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:15:90);
yticks(-90:15:90);
xtickformat('degrees');
ytickformat('degrees');
view(-30.281,60.0606);
     
%PARTE II: CÁLCULO DE MÁXIMOS - POSICIÓN DEL LÓBULO PRINCIPAL - DESFASAJE ENTRE ELEMENTOS -> Para todos los módulos que usan esta función
[zmax,imax] = extrema2(ejeZ); 
ejeXmax = ejeX(imax);
ejeYmax  = ejeY(imax);

%II.1. Ubicación de lóbulo principal
zmax2 = round(zmax);
indUbicLobPrin = find(zmax2 == 1);                                            
xLobPrin = ejeXmax(indUbicLobPrin(1));
yLobPrin = ejeYmax(indUbicLobPrin(1));
zLobPrin = zmax(indUbicLobPrin(1));                                           
tam = size(indUbicLobPrin);
vueltas = tam(1);
for elim = vueltas:-1:1
    ejeXmax(indUbicLobPrin(elim)) = [];
    ejeYmax(indUbicLobPrin(elim)) = [];
    zmax(indUbicLobPrin(elim)) = [];
end

%II.2. Muestra de máximos por consola
tamMax= size(ejeXmax);
tamMaximos = tamMax(1);
disp(' ');
disp([num2str(rombos),num2str(rombos),' POSICIÓN DE LÓBULO PRINCIPAL ',num2str(rombos),num2str(rombos)]);
disp([' El lóbulo principal se encuentra en: (',num2str(theta),num2str(letraL),num2str(letraP),' = ',num2str(xLobPrin),'°,',num2str(phi),num2str(letraL),num2str(letraP),' = ',num2str(yLobPrin),'°,|AF|',num2str(letraL),num2str(letraP),' = ',num2str(zLobPrin),')']);
disp(' ');
disp([num2str(rombos),num2str(rombos),' POSICIONES DE LÓBULOS LATERALES ',num2str(rombos),num2str(rombos)]);
disp([' Las posiciones de los lóbulos laterales (',num2str(theta),num2str(letraL),num2str(letraL),',',num2str(phi),num2str(letraL),num2str(letraL),',|AF|',num2str(letraL),num2str(letraL),') son las siguientes:']);
for impMax = 1:1:tamMaximos
    xPosicionLobulo = ejeXmax(impMax);
    yPosicionLobulo = ejeYmax(impMax);
    zPosicionLobulo = zmax(impMax);
    [imprimirMaximos] = fSimbolosPlano(xPosicionLobulo,yPosicionLobulo,zPosicionLobulo,impMax,tamMaximos);
    disp(imprimirMaximos);
    disp(' ');
end

%II.3. Representación gráfica de los máximos
hold on  
plot3(xLobPrin,yLobPrin,zLobPrin,'d','Color', colorlpuniforme,'LineWidth',1.25)
if (N>=30)
    plot3(ejeXmax,ejeYmax,zmax,'.','Color', colormaximosuniforme,'LineWidth',1.25) 
else
    plot3(ejeXmax,ejeYmax,zmax,'o','Color', colormaximosuniforme,'LineWidth',1.25) 
end

%II.4. Movimiento del lóbulo principal (Análisis) / Desfasaje entre elementos (Síntesis)
% - Para: Módulo de análisis de arreglos en el plano
if casoAnalisisoSintesis ==1
    anguloRX = anguloX*(pi/180);
    anguloRY = anguloY*(pi/180);
   %Movimiento en Theta
    movimientoTheta = asind(sqrt((anguloRX/(2*pi*d))^2 + (anguloRY/(2*pi*d))^2));
    if xLobPrin < 0
        movimientoThetaCSigno = (-1)*movimientoTheta;
        disp([num2str(rombos),num2str(rombos),' ¿CUÁNTO SE MOVIÓ EL LÓBULO PRINCIPAL EN ',num2str(theta),'?',num2str(rombos),num2str(rombos)]);
        disp([' El lóbulo principal se movió ',num2str(movimientoThetaCSigno),'° en Theta (',num2str(theta),').']);
        disp(' ');
    else
        disp([num2str(rombos),num2str(rombos),' ¿CUÁNTO SE MOVIÓ EL LÓBULO PRINCIPAL EN ',num2str(theta),'?',num2str(rombos),num2str(rombos)]);
        disp([' El lóbulo principal se movió ',num2str(movimientoTheta),'° en Theta (',num2str(theta),').']);
        disp(' ');
    end
    %Movimiento en Phi
    movimientoPhi = atand((anguloRY)/(anguloRX));   
    disp([num2str(rombos),num2str(rombos),' ¿CUÁNTO SE MOVIÓ EL LÓBULO PRINCIPAL EN ',num2str(phi),'?',num2str(rombos),num2str(rombos)]);
    disp([' El lóbulo principal se movió ',num2str(movimientoPhi),'° en Phi (',num2str(phi),').']);
    disp(' ');

% Para: Módulo de variación de la fase entre elementos
elseif casoAnalisisoSintesis == 2
    pThetaR = pTheta*(pi/180);
    pPhiR = pPhi*(pi/180);
   % - Desfasaje entre elementos en dirección x
    anguloX = -d*2*pi*sin(pThetaR)*cos(pPhiR);
    anguloX = anguloX * (180/pi);
    disp([num2str(rombos),num2str(rombos),' ¿CUÁL ES EL DESFASAJE ENTRE ELEMENTOS EN DIRECCIÓN X? ',num2str(rombos),num2str(rombos)]);
    disp([' El desfasaje entre elementos es igual a ',num2str(anguloX),'° en dirección x.']);
    disp(' ');
    % - Desfasaje entre elementos en dirección y
    anguloY = -d*2*pi*sin(pThetaR)*sin(pPhiR);
    anguloY = anguloY*(180/pi);
    disp([num2str(rombos),num2str(rombos),' ¿CUÁL ES EL DESFASAJE ENTRE ELEMENTOS EN DIRECCIÓN Y? ',num2str(rombos),num2str(rombos)]);
    disp([' El desfasaje entre elementos es igual a ',num2str(anguloY),'° en dirección y.']);
    disp(' ');
end

%PARTE III: CÁLCULO DE NIVEL RELATIVO DE LÓBULOS LATERALES -> Para todos los módulos que usan esta función
NivelLLCart = max(zmax);
NivelLL = 20*log10(NivelLLCart);
disp([num2str(rombos),num2str(rombos),' NIVEL RELATIVO DE LÓBULOS LATERALES ',num2str(rombos),num2str(rombos)]);
disp([' El nivel relativo de los lóbulos laterales es: ',num2str(NivelLL),' dB.']);
disp(' ');
    
%PARTE IV: CÁLCULO DE MINIMOS O NULOS -> Para todos los módulos que usan esta función

%IV.1 Se renombran los ejes
X=ejeX;
Y=ejeY;
Z=ejeZ;

%IV.2: Planteamiento de condiciones 
if ((N >= 4)&&(N < 8))
    n=20000;
    condicion=1.5;
elseif ((N >= 8)&&(N < 16))
    n=17000;
    condicion=1.5;
elseif ((N >= 16)&&(N < 20))
    n=25000;
    condicion=1.5;
elseif (N >= 20)
    n=30000;
    condicion=0.85;
end

%IV.3. Rutina para calcular mínimos o nulos
% - Para distribución de amplitud uniforme.
if verif == 1
    %Cuando N es igual o mayor a 4 (hasta 8) -> Calcula mínimos regionales
    if ((N >= 4)&&(N < 8))
      minimos = [];
      for i = 1:n
        [minZ, minIndice] = min(Z(:));
        [minXIndice, minYIndice] = ind2sub(size(Z), minIndice);
        minX = X(minXIndice, minYIndice);
        minY = Y(minXIndice, minYIndice);
        if isempty(minimos)
            plot3(minX, minY, minZ, '.','Color', colorminimosuniforme,'Linewidth', 1.1);
            minimos = [minimos; [minX, minY, minZ]];
        else
            distancias = sqrt(sum(bsxfun(@minus, minimos, [minX, minY, minZ]).^2,2));
            if all(distancias > 2)
                plot3(minX, minY, minZ, '.','Color', colorminimosuniforme,'Linewidth', 1.1);
                minimos = [minimos; [minX, minY, minZ]];
            end
        end
        Z(minXIndice, minYIndice) = Inf;
      end
    %Cuando N es igual o mayor a 8 y menor a 32 -> Calcula mínimos locales y regionales
    elseif ((N >= 8)&&(N <= 32)) 
      minimos = [];
      minimosLocales = islocalmin(Z,'MinSeparation',1);
      [minXIndice, minYIndice] = find(minimosLocales);
      for i = 1:length(minXIndice)
         minX = X(minXIndice(i), minYIndice(i));
         minY = Y(minXIndice(i), minYIndice(i));
         minZ = Z(minXIndice(i), minYIndice(i));
        if isempty(minimos)
            plot3(minX, minY, minZ, '.','Color', colorminimosuniforme,'Linewidth', 1);
            minimos = [minimos; [minX, minY, minZ]];
        else
            distancias = sqrt(sum(bsxfun(@minus, minimos, [minX, minY, minZ]).^2,2));
            if all(distancias > condicion)
                plot3(minX, minY, minZ, '.','Color', colorminimosuniforme,'Linewidth', 1);
                minimos = [minimos; [minX, minY, minZ]];
            end
        end
      end
      for i = 1:n
          [minZ, minIndice] = min(Z(:));
          [minXIndice, minYIndice] = ind2sub(size(Z), minIndice);
          minX = X(minXIndice, minYIndice);
          minY = Y(minXIndice, minYIndice);
          if isempty(minimos)
             plot3(minX, minY, minZ, '.','Color', colorminimosuniforme,'Linewidth', 1);
             minimos = [minimos; [minX, minY, minZ]];
          else
             distancias = sqrt(sum(bsxfun(@minus, minimos, [minX, minY, minZ]).^2,2));
             if all(distancias > condicion)
                plot3(minX, minY, minZ, '.','Color', colorminimosuniforme,'Linewidth', 1);
                minimos = [minimos; [minX, minY, minZ]];
             end
          end
          Z(minXIndice, minYIndice) = Inf;
      end  
    end
% - Para distribución de amplitud no uniforme -> Calcula mínimos regionales    
elseif verif == 2
    minimos = [];
    for i = 1:n
        [minZ, minIndice] = min(Z(:));
        [minXIndice, minYIndice] = ind2sub(size(Z), minIndice);
        minX = X(minXIndice, minYIndice);
        minY = Y(minXIndice, minYIndice);
        if isempty(minimos)
            plot3(minX, minY, minZ, '.','Color', colorminimosuniforme,'Linewidth', 1.1);
            minimos = [minimos; [minX, minY, minZ]];
        else
            distancias = sqrt(sum(bsxfun(@minus, minimos, [minX, minY, minZ]).^2,2));
            if all(distancias > condicion)
                plot3(minX, minY, minZ, '.','Color', colorminimosuniforme,'Linewidth', 1.1);
                minimos = [minimos; [minX, minY, minZ]];
            end
        end
        Z(minXIndice, minYIndice) = Inf;
    end

end

%PARTE V: CÁLCULO DE ANCHO DE HAZ A -3dB Y ANCHO DE HAZ PRINCIPAL -> Para todos los módulos que usan esta función
% V.1. Gráfica de ancho de haz a - 3 dB en gráfica cartesiana en 3D
hold on
contour3(ejeX,ejeY,ejeZ,[0.707,0.707],'--','Color', coloranchohazuniforme, 'Linewidth', 1.45)

%V.2. Cortes del diagrama en posición del lóbulo principal para theta y phi -> cálculo de ancho haz principal, ancho de haz a - 3 dB y nulos del corte
%V.2.1. Caso para cualquier número de elementos
% - Se llama función fAnchoHaz3DPlanoXY
[anchoDeHaz3dBParaTheta,anchoDeHaz3dBParaPhi,mDesfasajeAmbosParaPhi,posicionMinDesfasajeAmbosParaPhiPositivo,anchoHazDesfasajeAmbosParaPhi, mDesfasajeAmbosParaTheta, posicionMinDesfasajeAmbosParaThetaPositivo,anchoHazDesfasajeAmbosParaTheta] = fAnchoHaz3DBPlanoXY(ejeY,ejeZ,ejeX,xLobPrin,yLobPrin);
%V.2.1.1. Corte en PHI (patrón 2D THETA-AF) -> Muestra por consola ancho de haz principal, ancho de haz a - 3 dB y nulos en el patrón.
disp([num2str(rombos),num2str(rombos),' CORTE DEL DIAGRAMA EN ',num2str(phi),num2str(letraL),num2str(letraP),' = ',num2str(yLobPrin),'° ',num2str(flecha1),' ANCHO DE HAZ PRINCIPAL, ANCHO DE HAZ A - 3 DB y NULOS EN EL CORTE ',num2str(rombos),num2str(rombos)]);
disp([' ',num2str(flecha1),' A continuación, los resultados del ancho de haz principal, ancho a - 3 dB y nulos del corte en ',num2str(phi),num2str(letraL),num2str(letraP),' = ',num2str(yLobPrin),'° ']);
disp(' ');
% - Ancho de haz principal -> se aplican ciertas condiciones
if anchoHazDesfasajeAmbosParaPhi == 0
    disp(['     ',num2str(circulo),' No se pudo calcular el ancho principal']);
    disp(['        ',num2str(flecha2),' Posiblemente, el lóbulo principal sale del siguiente intervalo: (-90°<',num2str(theta),'<90°).']);
else
    if anchoDeHaz3dBParaPhi > anchoHazDesfasajeAmbosParaPhi
       disp(['     ',num2str(circulo),' No se pudo calcular el ancho principal']);
       disp(['        ',num2str(flecha2),' Posiblemente, el lóbulo principal sale del siguiente intervalo: (-90°<',num2str(theta),'<90°).']);
    else
       disp(['     ',num2str(circulo),' Ancho de haz principal = ' num2str(anchoHazDesfasajeAmbosParaPhi) '°']);
    end
end
disp(' ');
% - Ancho de haz a - 3dB -> se aplican ciertas condiciones
if anchoDeHaz3dBParaPhi == 0
    disp(['     ',num2str(circulo),' No se pudo calcular el ancho de haz a - 3 dB.']);
    disp(['        ',num2str(flecha2),' El lóbulo principal sale del siguiente intervalo: (-90°<',num2str(theta),'<90°).']);
else
    disp(['     ',num2str(circulo),' Ancho de haz a - 3 dB = ' num2str(anchoDeHaz3dBParaPhi) '°']);
end
disp(' ');
% - Posiciones de nulos en el corte del patrón
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
%V.2.1.2. Corte en THETA (patrón 2D PHI-AF) -> Muestra por consola ancho de haz principal, ancho de haz a - 3 dB y nulos en el patrón.
disp([num2str(rombos),num2str(rombos),' CORTE DEL DIAGRAMA EN ',num2str(theta),num2str(letraL),num2str(letraP),' = ',num2str(xLobPrin),'° ',num2str(flecha1),' ANCHO DE HAZ PRINCIPAL, ANCHO DE HAZ A - 3 DB y NULOS EN EL CORTE ',num2str(rombos),num2str(rombos)]);
disp([' ',num2str(flecha1),' A continuación, los resultados del ancho de haz principal, ancho a - 3 dB y nulos del corte en ',num2str(theta),num2str(letraL),num2str(letraP),' = ',num2str(xLobPrin),'° ']);
disp(' ');
% - Ancho de haz principal -> se aplican ciertas condiciones
if anchoHazDesfasajeAmbosParaTheta == 0
    disp(['     ',num2str(circulo),' No se pudo calcular el ancho principal']);
    disp(['        ',num2str(flecha2),' Posiblemente, el lóbulo principal sale del siguiente intervalo: (-90°<',num2str(phi),'<90°).']);
else
    if anchoDeHaz3dBParaTheta > anchoHazDesfasajeAmbosParaTheta
       disp(['     ',num2str(circulo),' No se pudo calcular el ancho principal']);
       disp(['        ',num2str(flecha2),' Posiblemente, el lóbulo principal sale del siguiente intervalo: (-90°<',num2str(phi),'<90°).']);
    else
       disp(['     ',num2str(circulo),' Ancho de haz principal = ' num2str(anchoHazDesfasajeAmbosParaTheta) '°']);
    end
end
disp(' ');
% - Ancho de haz a - 3dB -> se aplican ciertas condiciones
if anchoDeHaz3dBParaTheta == 0
    disp(['     ',num2str(circulo),' No se pudo calcular el ancho de haz a - 3 dB.']);
    disp(['        ',num2str(flecha2),' El lóbulo principal sale del siguiente intervalo: (-90°<',num2str(phi),'<90°).']);
else
    disp(['     ',num2str(circulo),' Ancho de haz a - 3 dB = ' num2str(anchoDeHaz3dBParaTheta) '°']);
end
disp(' ');
% - Posiciones de nulos en el corte del patrón
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

%PARTE VI: DIRECTIVIDAD MÁXIMA
disp([num2str(rombos),num2str(rombos),' DIRECTIVIDAD MÁXIMA ',num2str(rombos),num2str(rombos)]);
disp(['   ',num2str(circulo),' Directividad máxima en adimensional = ',num2str(directividad),' adim']);
disp(' ');
directividaddB = 10*log10(directividad);
disp(['   ',num2str(circulo),' Directividad máxima en dB = ',num2str(directividaddB),' dB']);
disp(' ');
    
%PARTE VII: CÁLCULO DE CORTES DEL DIAGRAMA DE RADIACIÓN
%VII.1. No hay corte del diagrama ni en theta ni en phi
disp([num2str(rombos),num2str(rombos),' OTROS CORTES DEL DIAGRAMA DE RADIACIÓN ',num2str(rombos),num2str(rombos)]);
if angulocortePhi == 100 && angulocorteTheta == 100
    disp(['   ',num2str(circulo),' No se solicitaron otros cortes del diagrama de radiación (ni en theta ni en phi).']);

%VII.2. Corte del diagrama en theta
elseif angulocorteTheta ~= 100 && angulocortePhi == 100
% - Se llama a función fRutinaCorteTheta
    [minimosTheta,posicionThetaPositivo] = fRutinaCorteTheta(ejeY,ejeZ,ejeX,angulocorteTheta);
    disp(['     ',num2str(circulo),' Corte del diagrama en ',num2str(theta),' = ',num2str(angulocorteTheta),'°.']);
% - Se muestran los nulos del corte en theta
    disp(['      ',num2str(flecha1),' Las posiciones de los nulos (',num2str(phi),num2str(letraN),',|AF|',num2str(letraN),') en ',num2str(theta),' = ',num2str(angulocorteTheta),'° son las siguientes:']);
    tam = size(minimosTheta);
    cantMinimos = tam(2);
    for impMin = 1:1:cantMinimos
         xPosicionLobuloMin = minimosTheta(impMin);
         yPosicionLobuloMin = posicionThetaPositivo(impMin);
        [imprimirMinimos] = fSimbolosMinPhi(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
        disp(imprimirMinimos);
        disp(' ');
    end

%VII.3. Corte del diagrama en phi
elseif angulocortePhi ~= 100 && angulocorteTheta == 100
% - Se llama a función fRutinaCortePhi
   [minimosPhi,posicionPhiPositivo] = fRutinaCortePhi(ejeY,ejeZ,ejeX,angulocortePhi);
   disp(['     ',num2str(circulo),' Corte del diagrama en ',num2str(phi),' = ',num2str(angulocortePhi),'°.']);
% - Se muestran los nulos del corte en phi
   disp(['      ',num2str(flecha1),' Las posiciones de los nulos (',num2str(theta),num2str(letraN),',|AF|',num2str(letraN),') en ',num2str(phi),' = ',num2str(angulocortePhi),'° son las siguientes:']);
   tam = size(minimosPhi);
   cantMinimos = tam(2);
   for impMin = 1:1:cantMinimos
         xPosicionLobuloMin = minimosPhi(impMin);
         yPosicionLobuloMin = posicionPhiPositivo(impMin);
        [imprimirMinimos] = fSimbolosMinTheta(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
        disp(imprimirMinimos);
        disp(' ');
    end

%VII.4. Corte del diagrama en theta y en phi
elseif angulocortePhi ~= 100 && angulocorteTheta ~= 100
% - Se llama a función fRutinaCorteTheta    
   [minimosTheta,posicionThetaPositivo] = fRutinaCorteTheta(ejeY,ejeZ,ejeX,angulocorteTheta);
   disp(['     ',num2str(circulo),' Corte del diagrama en ',num2str(theta),' = ',num2str(angulocorteTheta),'°.']);
% - Se muestran los nulos del corte en theta
   disp(['      ',num2str(flecha1),' Las posiciones de los nulos (',num2str(phi),num2str(letraN),',|AF|',num2str(letraN),') en ',num2str(theta),' = ',num2str(angulocorteTheta),'° son las siguientes:']);   
   tam = size(minimosTheta);
   cantMinimos = tam(2);
   for impMin = 1:1:cantMinimos
         xPosicionLobuloMin = minimosTheta(impMin);
         yPosicionLobuloMin = posicionThetaPositivo(impMin);
        [imprimirMinimos] = fSimbolosMinPhi(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
        disp(imprimirMinimos);
        disp(' ');
   end
% - Se llama a función fRutinaCortePhi    
   [minimosPhi,posicionPhiPositivo] = fRutinaCortePhi(ejeY,ejeZ,ejeX,angulocortePhi);
   disp(['     ',num2str(circulo),' Corte del diagrama en ',num2str(phi),' = ',num2str(angulocortePhi),'°.']);
% - Se muestran los nulos del corte en phi
   disp(['      ',num2str(flecha1),' Las posiciones de los nulos (',num2str(theta),num2str(letraN),',|AF|',num2str(letraN),') en ',num2str(phi),' = ',num2str(angulocortePhi),'° son las siguientes:']);
   tam = size(minimosPhi);
   cantMinimos = tam(2);
   for impMin = 1:1:cantMinimos
         xPosicionLobuloMin = minimosPhi(impMin);
         yPosicionLobuloMin = posicionPhiPositivo(impMin);
        [imprimirMinimos] = fSimbolosMinTheta(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
        disp(imprimirMinimos);
        disp(' ');
    end
end

disp('--------------------------------------------------------------------------------------------------------------');

    