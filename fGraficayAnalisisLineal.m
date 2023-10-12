function [ejeX,ejeY] = fGraficayAnalisisLineal(ejeX,ejeY,d,anguloZ,pTheta,casoAnalisisoSintesis,casoSintesisChebyshev,nivelLL,directividad)

% �CU�LES M�DULOS USAN LA FUNCI�N fGraficayAnalisisLineal?
%   - M�dulo de An�lisis de arreglos en el plano. 
%   - M�dulo de variaci�n de la fase entre elementos para arreglos en el plano.
%   - M�dulo de Dolph-Chebyshev.

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fGraficayAnalisisLineal?
%  Para todos los m�dulos:
% I.   Representaciones gr�ficas tridimensionales (cartesiana y esf�rica) del diagrama de radiaci�n.
% II.  C�lculo de los m�ximos en el diagrama de radiaci�n. Si es an�lisis: c�lculo de movimiento de l�bulo 
%      principal; si es s�ntesis: c�lculo del desfasaje (direcci�n z)
% III. C�lculo del nivel relativo de los l�bulos laterales.
% IV.  C�lculo de los m�nimos o nulos en el diagrama de radiaci�n.
% V.   C�lculo del ancho de haz a - 3 dB y del ancho de haz principal.
% VI.  Directividad m�xima.


% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     ejeX ----------------------------> Intervalo de valores de theta (desde 0� hasta 180�).
%     ejeY ----------------------------> Valores que toma el factor de arreglo.
%     �nguloZ -------------------------> Desfasaje entre elementos en direcci�n "z".
%     pTheta --------------------------> Posici�n del l�bulo principal en theta
%     d -------------------------------> Distancia inter-elemento.
%     casoAnalisisoSintesis -----------> Decisi�n entre an�lisis o s�ntesis 
%     casoSintesisChebyshev -----------> Identifica si se est� eligiendo s�ntesis Dolph-Chebyshev.
%     nivelLL -------------------------> Nivel relativo de los l�bulos laterales (en Dolph-Chebyshev).
%     directividad --------------------> Valor de directividad m�xima.


% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     ejeX ------> Intervalo de grados de theta.
%     ejeY ------> Intervalo de grados de phi.

%S�MBOLOS Y PAR�METROS INICIALES
%S�mbolos
rombos = char(9830);
flecha1 = char(8658);
flecha2 = char(8594);
letraP = char(8346);
theta = char(952);
letraN = char(8345);            
letraL = char(8343);
circulo = char(8226);

%Se llama a funci�n fColoresLineal
[colorcurva,colorminimos,colorprincipal,colorsecundarios,coloranchohaz3db] = fColoresLineal;

%PARTE I: REPRESENTACIONES GR�FICAS TRIDIMENSIONALES -> Para todos los m�dulos que usan esta funci�n
%I.1. Gr�ficas en coordenadas polares
figure('Name','Diagrama de radiaci�n (en coordenadas polares)');
pax = polaraxes; 
polarplot((ejeX*(pi/180)),ejeY,'Color', colorcurva,'Linewidth',1.25);
thetaticks(0:10:180)
thetalim([0 180]);
rlim([0 1]);
rticks(0:0.2:1)
% labels = pax.ThetaTickLabel; 
% labels{4} = '\theta_0 = 45'; 
% pax.ThetaTickLabel = labels; 
pax.ThetaTickLabel = string(pax.ThetaTickLabel) + char(176);
pax.FontSize = 16;
title('Diagrama de Radiaci�n','FontSize', 22,'FontName', 'Times New Roman');

%I.2. Gr�ficas en coordenadas cartesianas
% - En escala logar�tmica
if casoSintesisChebyshev == 1
    figure('Name','Diagrama de radiaci�n (en coordenadas cartesianas en escala logar�tmica)');
    ax = gca;
    plot(ejeX,20*log10(ejeY),'Color', colorcurva,'Linewidth',1.75); 
    set(ax, 'FontSize', 13)
    grid on                         
    grid minor
    title("Diagrama de Radiaci�n",'FontSize', 22,'FontName', 'Times New Roman');
    xlabel("\theta",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
    xtickformat('degrees')
    ylabel("AF_{(dB)}",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
    xticks(0:10:180);
    ylim([-50 0]);
elseif casoSintesisChebyshev == 2
    figure('Name','Diagrama de radiaci�n (en coordenadas cartesianas en escala logar�tmica)');
    ax = gca;
    plot(ejeX,20*log10(ejeY),'Color', colorcurva,'Linewidth',1.75); 
    set(ax, 'FontSize', 13)
    grid on                         
    grid minor
    title("Diagrama de Radiaci�n",'FontSize', 22,'FontName', 'Times New Roman');
    xlabel("\theta",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
    xtickformat('degrees')
    ylabel("AF_{(dB)}",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
    xticks(0:10:180);
    ylim([-50 0]);
    hold on
    x1 = 0;
    x2 = 180;
    y1 = nivelLL;
    plot([x1, x2], [y1, y1],"-.",'Color', colorsecundarios,'LineWidth',1.50);
    text(5,(nivelLL + 1.5),['NRRL = ',num2str(nivelLL),' dB'],'FontSize', 14,'Color', colorsecundarios,'FontWeight', 'bold','FontName', 'Times New Roman');
    hold off
end

% - En escala lineal
figure('Name','Diagrama de radiaci�n (en coordenadas cartesianas en escala lineal)');
ax = gca;
plot(ejeX,ejeY,'Color', colorcurva,'Linewidth',1.75);
set(ax, 'FontSize', 13)
grid on                         
grid minor
title({'{\bf\fontsize{19} Diagrama de Radiaci�n}'; '{\it\fontsize{14}\color{red} distancia inter-elemento = 0.8\lambda}'},'FontName', 'Times New Roman','FontWeight','Normal')
% title("Diagrama de Radiaci�n ",'FontSize', 22,'FontName', 'Times New Roman');
% subtitle('Distancia inter-elemento = 0.5\lambda','FontSize', 16,'FontName', 'Times New Roman')
xlabel("\theta",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
xtickformat('degrees')
ylabel("|AF|",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
xticks(0:10:180);

%PARTE II: C�LCULO DE M�XIMOS - POSICI�N DEL L�BULO PRINCIPAL - DESFASAJE ENTRE ELEMENTOS -> Para todos los m�dulos que usan esta funci�n
% II.1. C�lculo de m�ximos
% - Se hallan todos los m�ximos
[alturaMaxparaTheta,indiceMaxparaTheta] = findpeaks(ejeY); 
equivalenteMaxparaTheta = ejeX(1,:);
posicionMaxParaTheta = equivalenteMaxparaTheta(indiceMaxparaTheta);
% - Se busca cu�l es el �ndice del l�bulo principal (�ndice y posici�n en x)
indiceLobuloPrincipal = find(alturaMaxparaTheta==1);
posicionLobuloPrincipal = posicionMaxParaTheta(indiceLobuloPrincipal);
% Se excluye a l�bulo principal de m�ximos -> quedan l�bulos secundarios
posicionMaxParaTheta(indiceLobuloPrincipal) = [];   
alturaMaxparaTheta(indiceLobuloPrincipal) = [];

% II.2. Representaci�n gr�fica de m�ximos
hold on
% - L�bulo principal
plot(posicionLobuloPrincipal,1,'d','Color',colorprincipal,'Linewidth',1.50)
% - L�bulos secundarios
plot(posicionMaxParaTheta,alturaMaxparaTheta,'*','Color',colorsecundarios,'Linewidth',1.50)

% II.3. Muestra por consola de l�bulo principal y l�bulos secundarios
% - L�bulo principal
disp(' ');
disp([num2str(rombos),num2str(rombos),' POSICI�N DE L�BULO PRINCIPAL ',num2str(rombos),num2str(rombos)]);
disp([' El l�bulo principal se encuentra en: (',num2str(theta),num2str(letraL),num2str(letraP),' = ',num2str(posicionLobuloPrincipal),'�,|AF|',num2str(letraL),num2str(letraP),' = 1)']);
% - L�bulos secundarios
disp(' ');
disp([num2str(rombos),num2str(rombos),' POSICIONES DE L�BULOS LATERALES ',num2str(rombos),num2str(rombos)]);
disp([' Las posiciones de los l�bulos laterales (',num2str(theta),num2str(letraL),num2str(letraL),',|AF|',num2str(letraL),num2str(letraL),') son las siguientes:']);
tamMaximos = size(posicionMaxParaTheta);
for impMax = 1:1:tamMaximos(2)
        xPosicionLobulo = posicionMaxParaTheta(impMax);
        yPosicionLobulo = alturaMaxparaTheta(impMax);
        [imprimirMaximos] = fSimbolosMaxTheta(xPosicionLobulo,yPosicionLobulo,impMax,tamMaximos);
        disp(imprimirMaximos);
end

%II.4. Movimiento del l�bulo principal (An�lisis) / Desfasaje entre elementos (S�ntesis)
% - Para: M�dulo de an�lisis de arreglos en el plano
if casoAnalisisoSintesis ==1
    anguloRZ = anguloZ*(pi/180);
    movimientoTheta = acosd(-(anguloRZ)/(2*pi*d));
    disp(' ');
    disp([num2str(rombos),num2str(rombos),' �CU�NTO SE MOVI� EL L�BULO PRINCIPAL? ',num2str(rombos),num2str(rombos)]);
    disp([' El l�bulo principal se movi� ',num2str(movimientoTheta),'� en Theta (',num2str(theta),').']);
% Para: M�dulo de variaci�n de la fase entre elementos
elseif casoAnalisisoSintesis == 2
    pThetaR = pTheta*(pi/180);
    desfasajeZ = -d*2*pi*cos(pThetaR);
    desfasajeZ = desfasajeZ*(180/pi);
    disp(' ');
    disp([num2str(rombos),num2str(rombos),' �CU�L ES EL DESFASAJE ENTRE ELEMENTOS EN DIRECCI�N Z? ',num2str(rombos),num2str(rombos)]);
    disp([' El desfasaje entre elementos es igual a ',num2str(desfasajeZ),'� en direcci�n z.']);
end

%PARTE III: C�LCULO DE NIVEL RELATIVO DE L�BULOS LATERALES -> Para todos los m�dulos que usan esta funci�n
NivelLL = 20*log10(max(alturaMaxparaTheta));
disp(' ');
disp([num2str(rombos),num2str(rombos),' NIVEL RELATIVO DE L�BULOS LATERALES ',num2str(rombos),num2str(rombos)]);
disp([' El nivel relativo de los l�bulos laterales es ',num2str(NivelLL),' dB']);

%PARTE IV: C�LCULO DE MINIMOS O NULOS -> Para todos los m�dulos que usan esta funci�n
% IV.1. Se calculan los nulos
[alturaMinparaTheta,indiceMinparaTheta] = findpeaks(-ejeY); 
equivalenteMinparaTheta = ejeX(1,:);
posicionMinParaTheta = equivalenteMinparaTheta(indiceMinparaTheta);

%IV.1. Representaci�n gr�fica de los nulos
hold on
alturaMinparaTheta = (-1)*alturaMinparaTheta;
plot(posicionMinParaTheta,alturaMinparaTheta,'*','Color',colorminimos,'Linewidth',1.50)

%IV.2. Muestra por consola de los nulos
disp(' ');
disp([num2str(rombos),num2str(rombos),' POSICIONES DE NULOS EN EL DIAGRAMA DE RADIACI�N ',num2str(rombos),num2str(rombos)]);
disp([' Las posiciones de los nulos (',num2str(theta),num2str(letraN),',|AF|',num2str(letraN),') son las siguientes:']);
tam = size(posicionMinParaTheta);
cantMinimos = tam(2);
for impMin = 1:1:cantMinimos
     xPosicionLobuloMin = posicionMinParaTheta(impMin);
     yPosicionLobuloMin = alturaMinparaTheta(impMin);
    [imprimirMinimos] = fSimbolosMinTheta(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos);
    disp(imprimirMinimos);
end

%PARTE V: C�LCULO DE ANCHO DE HAZ PRINCIPAL Y ANCHO DE HAZ a - 3 DB -> Para todos los m�dulos que usan esta funci�n
% V.1. Ancho de haz principal
% - C�lculo del ancho de haz principal
resultadoRestaParaTheta = abs(posicionMinParaTheta - posicionLobuloPrincipal);
ordenParaTheta = sort(resultadoRestaParaTheta,'ascend');
minimoAParaTheta = ordenParaTheta(1);
minimoBParaTheta = ordenParaTheta(2);
%Condici�n especial
if (minimoAParaTheta == minimoBParaTheta)
        indiceMinimoAParaTheta = find(resultadoRestaParaTheta == minimoAParaTheta);
        indiceMinimoAParaTheta = indiceMinimoAParaTheta(1);
        indiceMinimoBParaTheta = find(resultadoRestaParaTheta == minimoBParaTheta);
        indiceMinimoBParaTheta = indiceMinimoBParaTheta(2);
else
        indiceMinimoAParaTheta = find(resultadoRestaParaTheta == minimoAParaTheta);
        indiceMinimoBParaTheta = find(resultadoRestaParaTheta == minimoBParaTheta);
end
primerMinimoParaTheta = posicionMinParaTheta(indiceMinimoAParaTheta);
segundoMinimoParaTheta = posicionMinParaTheta(indiceMinimoBParaTheta);
% - Se muestra por consola
disp(' ');
disp([num2str(rombos),num2str(rombos),' ANCHO DE HAZ PRINCIPAL ',num2str(rombos),num2str(rombos)]);
if (((primerMinimoParaTheta > posicionLobuloPrincipal)&&(segundoMinimoParaTheta > posicionLobuloPrincipal))||((primerMinimoParaTheta < posicionLobuloPrincipal)&&(segundoMinimoParaTheta < posicionLobuloPrincipal)))
    disp([' No se puede calcular ancho de haz principal ',num2str(flecha1),' el l�bulo principal sale de la regi�n visible']);
else
    anchoHazParaTheta = abs(abs(segundoMinimoParaTheta)-abs(primerMinimoParaTheta));
    disp([' El ancho de haz principal es ',num2str(anchoHazParaTheta),'�']);
end

% V.2. Ancho de haz a - 3 dB
% - C�lculo del ancho de haz a -3 dB
paraejeX = ejeX;
paraejeY = round(ejeY,1);
valorAncho = find(paraejeY==0.7);
sizeAncho = size(valorAncho);
ladoIzquierdo = paraejeX(valorAncho(sizeAncho(2)));
ladoDerecho = paraejeX(valorAncho(sizeAncho(1)));
% - Se muestra por consola
disp(' ');
disp([num2str(rombos),num2str(rombos),' ANCHO DE HAZ A -3 DB ',num2str(rombos),num2str(rombos)]);
if (((ladoDerecho > posicionLobuloPrincipal)&&(ladoIzquierdo > posicionLobuloPrincipal))||((ladoDerecho < posicionLobuloPrincipal)&&(ladoIzquierdo < posicionLobuloPrincipal)))
    disp([' No se puede calcular ancho de haz a -3 dB ',num2str(flecha1),' el l�bulo principal sale de la regi�n visible']);
else
    anchoHaz3dBParaTheta = abs(ladoIzquierdo-ladoDerecho);
    disp([' El ancho de haz a - 3 dB es ',num2str(anchoHaz3dBParaTheta),'�']);
    %Representaci�n gr�fica del ancho de haz a - 3 dB
    plot(ladoDerecho,0.7,'o','Color',coloranchohaz3db,'Linewidth',1.50);
    plot(ladoIzquierdo,0.7,'o','Color',coloranchohaz3db,'Linewidth',1.50);
    plot([ladoDerecho ladoIzquierdo],[0.7 0.7],'--','Color',coloranchohaz3db,'Linewidth',1.50);
end
disp(' ');

%PARTE VI: DIRECTIVIDAD M�XIMA
disp([num2str(rombos),num2str(rombos),' DIRECTIVIDAD M�XIMA ',num2str(rombos),num2str(rombos)]);
disp(['   ',num2str(circulo),' Directividad m�xima en adimensional = ',num2str(directividad),' adim']);
disp(' ');
directividaddB = 10*log10(directividad);
disp(['   ',num2str(circulo),' Directividad m�xima en dB = ',num2str(directividaddB),' dB']);
disp(' ');
    
disp('--------------------------------------------------------------------------------------------------------------');


