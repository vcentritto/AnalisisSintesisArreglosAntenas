function [anchoDeHaz3dBParaTheta,anchoDeHaz3dBParaPhi,mDesfasajeAmbosParaPhi,posicionMinDesfasajeAmbosParaPhiPositivo,maxDesfasajeAmbosParaPhi,posicionMaxDesfasajePhiParaAmbos,anchoHazDesfasajeAmbosParaPhi, mDesfasajeAmbosParaTheta, posicionMinDesfasajeAmbosParaThetaPositivo,maxDesfasajeAmbosParaTheta,posicionMaxDesfasajeAmbosParaTheta,anchoHazDesfasajeAmbosParaTheta] = fAnchoHaz3DBPlanoXYChebyshev(ejeY,ejeZ,ejeX,pTheta,pPhi,NivelLL)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fAnchoHaz3DBPlanoXYChebyshev?
%   - Es una subfunción de fGraficayAnalisisDolphChebyshevMejorado, por lo que aplica en:
%       - Módulo de Dolph-Chebyshev Mejorado.

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fAnchoHaz3DBPlanoXYChebyshev?
% I.  Corte en la posición (en phi) del lóbulo principal.
% II. Corte en la posición (en theta) del lóbulo principal.
%     Se calculan los siguientes parámetros a partir de ambos cortes.
%     - Ancho de haz principal.
%     - Ancho de haz a - 3 dB (numéricamente y gráficamente).
%     - Posiciones de los nulos (numéricamente y gráficamente).
%     - Posiciones de los lóbulos laterales (numéricamente y gráficamente).

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     ejeX ----------------------------> Intervalo de grados de theta (-90>theta>90).
%     ejeY ----------------------------> Intervalo de grados de phi (-90>phi>90)
%     ejeZ ----------------------------> Valores que toma el Factor de Arreglo.
%     pTheta --------------------------> Posición del lóbulo principal en theta.
%     pPhi ----------------------------> Posición del lóbulo principal en phi.
%     NivelLL -------------------------> Nivel relativo de los lóbuloslaterales (calculado)

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     anchoDeHaz3dBParaPhi ------------------------> Ancho de haz a -3dB (corte en phi).
%     mDesfasajeAmbosParaPhi ----------------------> Posiciones de nulos (corte en phi).
%     posicionMinDesfasajeAmbosParaPhiPositivo ----> Altura de los nulos (corte en phi).
%     anchoHazDesfasajeAmbosParaPhi ---------------> Ancho de haz principal (corte en phi).
%     anchoDeHaz3dBParaTheta ----------------------> Ancho de haz a -3dB (corte en theta).
%     mDesfasajeAmbosParaTheta --------------------> Posiciones de nulos (corte en theta).
%     posicionMinDesfasajeAmbosParaThetaPositivo ----> Altura de los nulos (corte en theta).
%     anchoHazDesfasajeAmbosParaTheta -------------> Ancho de haz principal (corte en theta).

% ¿CUÁLES SUBFUNCIONES CONTIENE?:
%     fCondicion1AnchoHazTheta -------------------> Función que aplica condición 1 para cálculo de ancho de haz principal (corte en theta)
%     fCondicion1AnchoHazPhi ---------------------> Función que aplica condición 1 para cálculo de ancho de haz principal (corte en phi)
%     fCondicion2AnchoHazTheta -------------------> Función que aplica condición 2 para cálculo de ancho de haz principal (corte en theta)
%     fCondicion2AnchoHazPhi ---------------------> Función que aplica condición 2 para cálculo de ancho de haz principal (corte en phi) 

%PARÁMETROS Y SÍMBOLOS INICIALES
colorminimos3dB = 1/255*[199 21 133]; 
colormaximos3dB = 1/255*[218 112 214];  
coloranchohaz3dB = 1/255*[220 20 60]; 
colorcurva3dB = 1/255*[53 0 124]; 
colorlpChebyshev = 1/255*[220 20 60];
v = [0.5,0.5];
nivelRelativoAdim = 10^(NivelLL/20);


%PARTE I: CORTE DEL DIAGRAMA DE RADIACIÓN EN PHI (GRÁFICA 2D THETA-AF)-> Para todos los módulos que usan esta función
figure('Name','Corte del diagrama de radiación (en posición phi del lóbulo principal)');
% I.1. Rutina para obtener corte del patrón en phi = posición del lóbulo principal
[cortesAnchoPhi,vcortesPhi] = contour(ejeX,ejeZ,(ejeY-pPhi),v,'Color', colorcurva3dB,'LineWidth',1.75);

% I.2. Rutina para obtener ancho de haz a - 3 dB
paraXPhi = cortesAnchoPhi(1,:);
paraYPhi = round(cortesAnchoPhi(2,:),1);
valorAnchoPhi = [];
valorAnchoPhi = find(paraYPhi == 0.7);
sizeAnchoPhi = size(valorAnchoPhi);
tamanoAnchoPhi = sizeAnchoPhi(2);
ladoIzquierdoAnchoPhi = paraXPhi(valorAnchoPhi(tamanoAnchoPhi));
ladoDerechoAnchoPhi = paraXPhi(valorAnchoPhi(sizeAnchoPhi(1)));
rangoAnchoPhi = ladoIzquierdoAnchoPhi:1/100:ladoDerechoAnchoPhi;

% I.3. Rutina para obtener ancho de haz principal
%- Se encuentran posiciones de nulos en el corte  
minimosDesfasajeAmbosParaPhi = contour(ejeX,ejeZ,(ejeY-pPhi),v,'Color', colorcurva3dB,'LineWidth',1.75);
minDesfasajeAmbosParaPhi = minimosDesfasajeAmbosParaPhi(2,:);
[posicionMinDesfasajeAmbosParaPhi,indiceMinDesfasajeAmbosParaPhi] = findpeaks(-(minDesfasajeAmbosParaPhi));
equivalenteMinDesfasajeAmbosParaPhi = minimosDesfasajeAmbosParaPhi(1,:);
mDesfasajeAmbosParaPhi = equivalenteMinDesfasajeAmbosParaPhi(indiceMinDesfasajeAmbosParaPhi);
%- Se encuentran posiciones de máximos y de lóbulo principal en el corte.  
maximosDesfasajePhiParaAmbos = minimosDesfasajeAmbosParaPhi(2,:);
[posicionMaxDesfasajePhiParaAmbos,indiceMaxDesfasajePhiParaAmbos] = findpeaks((maximosDesfasajePhiParaAmbos));
equivalenteMaxDesfasajePhiParaAmbos = minimosDesfasajeAmbosParaPhi(1,:);
maxDesfasajeAmbosParaPhi = equivalenteMaxDesfasajePhiParaAmbos(indiceMaxDesfasajePhiParaAmbos);
% - Se continúa con rutina para hallar ancho de haz principal
posicionMax2DesfasajeAmbosParaPhi = posicionMaxDesfasajePhiParaAmbos;
sustitucionCasoPhi = find(posicionMax2DesfasajeAmbosParaPhi == max(posicionMaxDesfasajePhiParaAmbos));
posicionMax2DesfasajeAmbosParaPhi(sustitucionCasoPhi) = 1;
factorRestaCasoPhi = maxDesfasajeAmbosParaPhi(sustitucionCasoPhi);
if factorRestaCasoPhi > 0
    resultadoRestaCasoPhi = abs(mDesfasajeAmbosParaPhi - factorRestaCasoPhi);
else
    resultadoRestaCasoPhi = abs(mDesfasajeAmbosParaPhi + abs(factorRestaCasoPhi));
end    
ordenCasoPhi = sort(resultadoRestaCasoPhi,'ascend');
minimoACasoPhi = ordenCasoPhi(1);
minimoBCasoPhi = ordenCasoPhi(2);
% - Aplica Condición 1 de ancho de haz principal
[indiceMinimoACasoPhi,indiceMinimoBCasoPhi] = fCondicion1AnchoHazPhi(minimoACasoPhi,minimoBCasoPhi,resultadoRestaCasoPhi);
primerMinimoCasoPhi = mDesfasajeAmbosParaPhi(indiceMinimoACasoPhi);
segundoMinimoCasoPhi = mDesfasajeAmbosParaPhi(indiceMinimoBCasoPhi);

% I.4. Cálculo final de ancho de haz principal
if (primerMinimoCasoPhi > factorRestaCasoPhi && segundoMinimoCasoPhi < factorRestaCasoPhi) || (primerMinimoCasoPhi < factorRestaCasoPhi && segundoMinimoCasoPhi > factorRestaCasoPhi)
    if (primerMinimoCasoPhi >= 0 && segundoMinimoCasoPhi >= 0)||(primerMinimoCasoPhi <= 0 && segundoMinimoCasoPhi <= 0) 
        anchoHazDesfasajeAmbosParaPhi = abs(abs(primerMinimoCasoPhi)-abs(segundoMinimoCasoPhi));
    end
    if (primerMinimoCasoPhi >= 0 && segundoMinimoCasoPhi <= 0)||(primerMinimoCasoPhi <= 0 && segundoMinimoCasoPhi >= 0) 
        anchoHazDesfasajeAmbosParaPhi = abs(primerMinimoCasoPhi)+ abs(segundoMinimoCasoPhi);
    end
else
    % - Aplica Condición 2 de ancho de haz principal
    [anchoHazDesfasajeAmbosParaPhi] = fCondicion2AnchoHazPhi(mDesfasajeAmbosParaPhi,ordenCasoPhi,resultadoRestaCasoPhi,primerMinimoCasoPhi,factorRestaCasoPhi);
end

% I.5. Cálculo final de ancho de haz a - 3 dB
% - Condición única de ancho de haz a - 3 dB
if (ladoIzquierdoAnchoPhi > factorRestaCasoPhi && ladoDerechoAnchoPhi < factorRestaCasoPhi) || (ladoIzquierdoAnchoPhi < factorRestaCasoPhi && ladoDerechoAnchoPhi > factorRestaCasoPhi)
    anchoDeHaz3dBParaPhi = abs(ladoIzquierdoAnchoPhi - ladoDerechoAnchoPhi);
else
    anchoDeHaz3dBParaPhi = 0;
end

% I.6. Cálculo de máximos (definitivo)
% - Se busca cuál es el índice del lóbulo principal 
indiceLobuloPrincipalPhi = find(posicionMaxDesfasajePhiParaAmbos>(nivelRelativoAdim+0.1));
% - Se excluye a lóbulo principal de máximos -> quedan lóbulos secundarios
maxDesfasajeAmbosParaPhi(indiceLobuloPrincipalPhi) = []; 
posicionMaxDesfasajePhiParaAmbos(indiceLobuloPrincipalPhi) = [];

% I.7. Gráfica del corte del diagrama de radiación -> incluye mínimos y ancho de haz a - 3 dB
posicionMinDesfasajeAmbosParaPhiPositivo = (-1).*posicionMinDesfasajeAmbosParaPhi;
hold on
grid minor   
% - Aplica condición única de ancho de haz a - 3dB
if anchoDeHaz3dBParaPhi == 0
else
    plot(ladoDerechoAnchoPhi,0.7,'o','Color', coloranchohaz3dB,'LineWidth',1.25);
    plot(ladoIzquierdoAnchoPhi,0.7,'o','Color',coloranchohaz3dB,'LineWidth',1.25);
    plot([ladoDerechoAnchoPhi ladoIzquierdoAnchoPhi],[0.7 0.7],'--','Color',coloranchohaz3dB,'LineWidth',1.1);
end
plot(mDesfasajeAmbosParaPhi,posicionMinDesfasajeAmbosParaPhiPositivo,'*','Color',colorminimos3dB,'LineWidth',1.50); 
plot(maxDesfasajeAmbosParaPhi,posicionMaxDesfasajePhiParaAmbos,'*','Color',colormaximos3dB,'LineWidth',1.50); 
plot(factorRestaCasoPhi,1,'d','Color',colorlpChebyshev,'LineWidth',1.50);  
ax = gca;
set(ax,'FontSize', 13);
title(['Corte del diagrama en \phi_{lp} = ',num2str(pPhi),'º'],'FontSize',20,'FontName', 'Times New Roman');
xlabel("\theta",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xtickformat('degrees');
ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:10:90);
        

%PARTE II: CORTE DEL DIAGRAMA DE RADIACIÓN EN THETA (GRÁFICA 2D PHI-AF)-> Para todos los módulos que usan esta función
figure('Name','Corte del diagrama de radiación (en posición theta del lóbulo principal)');
% II.1. Rutina para obtener corte del patrón en theta = posición del lóbulo principal
[cortesAnchoTheta,vcortesTheta] = contour(ejeY,ejeZ,(ejeX-pTheta),v,'Color',colorcurva3dB,'LineWidth',1.75);

% II.2. Rutina para obtener ancho de haz a - 3 dB
paraXTheta = cortesAnchoTheta(1,:);
paraYTheta = round(cortesAnchoTheta(2,:),1);
valorAnchoTheta = [];
valorAnchoTheta = find(paraYTheta == 0.7);
sizeAnchoTheta = size(valorAnchoTheta);
tamanoAnchoTheta = sizeAnchoTheta(2);
ladoIzquierdoAnchoTheta = paraXTheta(valorAnchoTheta(tamanoAnchoTheta));
ladoDerechoAnchoTheta = paraXTheta(valorAnchoTheta(sizeAnchoTheta(1)));
rangoAnchoTheta = ladoIzquierdoAnchoTheta:1/100:ladoDerechoAnchoTheta;

% II.3. Rutina para obtener ancho de haz principal
% - Se encuentran posiciones de nulos en el corte  
minimosDesfasajeAmbosParaTheta = contour(ejeY,ejeZ,(ejeX-pTheta),v,'Color',colorcurva3dB,'LineWidth',1.75);
minDesfasajeAmbosParaTheta = minimosDesfasajeAmbosParaTheta(2,:);
[posicionMinDesfasajeAmbosParaTheta,indiceMinDesfasajeAmbosParaTheta] = findpeaks(-(minDesfasajeAmbosParaTheta));
equivalenteMinDesfasajeAmbosParaTheta = minimosDesfasajeAmbosParaTheta(1,:);
mDesfasajeAmbosParaTheta = equivalenteMinDesfasajeAmbosParaTheta(indiceMinDesfasajeAmbosParaTheta); 
% - Se encuentran posiciones de máximos y de lóbulo principal en el corte.  
maximosDesfasajeAmbosParaTheta = minimosDesfasajeAmbosParaTheta(2,:);
[posicionMaxDesfasajeAmbosParaTheta,indiceMaxDesfasajeAmbosParaTheta] = findpeaks((maximosDesfasajeAmbosParaTheta));
posicionMinDesfasajeAmbosParaThetaPositivo = (-1).*posicionMinDesfasajeAmbosParaTheta;
equivalenteMaxDesfasajeAmbosParaTheta = minimosDesfasajeAmbosParaTheta(1,:);
maxDesfasajeAmbosParaTheta = equivalenteMaxDesfasajeAmbosParaTheta(indiceMaxDesfasajeAmbosParaTheta);
% - Se continúa con rutina para hallar ancho de haz principal
posicionMax2DesfasajeAmbosParaTheta = posicionMaxDesfasajeAmbosParaTheta;
sustitucionCasoTheta = find(posicionMax2DesfasajeAmbosParaTheta == max(posicionMaxDesfasajeAmbosParaTheta));
posicionMax2DesfasajeAmbosParaTheta(sustitucionCasoTheta) = 1;
factorRestaCasoTheta = maxDesfasajeAmbosParaTheta(sustitucionCasoTheta);
if factorRestaCasoTheta >= 0
    resultadoRestaCasoTheta = abs(mDesfasajeAmbosParaTheta - factorRestaCasoTheta);
else
    resultadoRestaCasoTheta = abs(mDesfasajeAmbosParaTheta + abs(factorRestaCasoTheta));
end    
ordenCasoTheta = sort(resultadoRestaCasoTheta,'ascend');
minimoACasoTheta = ordenCasoTheta(1);
%CONDICIÓN 4 ELEMENTOS
if length(ordenCasoTheta) == 1
    anchoHazDesfasajeAmbosParaTheta = 0;
    anchoDeHaz3dBParaTheta = 0;
    hold on
    grid minor
    plot(mDesfasajeAmbosParaTheta,posicionMinDesfasajeAmbosParaThetaPositivo,'*','Color',colorminimos3dB,'LineWidth',1.50); 
    plot(factorRestaCasoTheta,1,'d','Color',colorminimos3dB,'LineWidth',1.50); 
    ax = gca;
    set(ax,'FontSize', 13);
    title(['Corte del diagrama en \theta_{lp} = ',num2str(pTheta),'º'],'FontSize',20,'FontName', 'Times New Roman');
    xlabel("\phi",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
    xtickformat('degrees');
    ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
    xticks(-90:10:90);
else
    minimoBCasoTheta = ordenCasoTheta(2);
    % - Aplica Condición 2 de ancho de haz principal
    [indiceMinimoACasoTheta,indiceMinimoBCasoTheta] = fCondicion1AnchoHazTheta(minimoACasoTheta,minimoBCasoTheta,resultadoRestaCasoTheta);
    primerMinimoCasoTheta = mDesfasajeAmbosParaTheta(indiceMinimoACasoTheta);
    segundoMinimoCasoTheta = mDesfasajeAmbosParaTheta(indiceMinimoBCasoTheta);

    % II.4. Cálculo final de ancho de haz principal
    if (primerMinimoCasoTheta > factorRestaCasoTheta && segundoMinimoCasoTheta < factorRestaCasoTheta) || (primerMinimoCasoTheta < factorRestaCasoTheta && segundoMinimoCasoTheta > factorRestaCasoTheta)
        if (primerMinimoCasoTheta >= 0 && segundoMinimoCasoTheta >= 0)||(primerMinimoCasoTheta <= 0 && segundoMinimoCasoTheta <= 0) 
            anchoHazDesfasajeAmbosParaTheta = abs(abs(primerMinimoCasoTheta)-abs(segundoMinimoCasoTheta));
        end
        if (primerMinimoCasoTheta >= 0 && segundoMinimoCasoTheta <= 0)||(primerMinimoCasoTheta <= 0 && segundoMinimoCasoTheta >= 0) 
            anchoHazDesfasajeAmbosParaTheta = abs(primerMinimoCasoTheta)+ abs(segundoMinimoCasoTheta);
        end
    else
        % - Aplica Condición 2 de ancho de haz principal
        [anchoHazDesfasajeAmbosParaTheta] = fCondicion1AnchoHazTheta(mDesfasajeAmbosParaTheta,ordenCasoTheta,resultadoRestaCasoTheta,primerMinimoCasoTheta,factorRestaCasoTheta);
    end

    % II.5. Cálculo final de ancho de haz a - 3 dB
    % - Condición única de ancho de haz a - 3 dB
    if (ladoIzquierdoAnchoTheta > factorRestaCasoTheta && ladoDerechoAnchoTheta < factorRestaCasoTheta) || (ladoIzquierdoAnchoTheta < factorRestaCasoTheta && ladoDerechoAnchoTheta > factorRestaCasoTheta)
        anchoDeHaz3dBParaTheta = abs(ladoIzquierdoAnchoTheta - ladoDerechoAnchoTheta);
    else
        anchoDeHaz3dBParaTheta = 0;
    end

    % I.6. Cálculo de máximos (definitivo)
    % - Se busca cuál es el índice del lóbulo principal
    indiceLobuloPrincipalTheta = find(posicionMaxDesfasajeAmbosParaTheta>(nivelRelativoAdim+0.1));
    % - Se excluye a lóbulo principal de máximos -> quedan lóbulos secundarios
    maxDesfasajeAmbosParaTheta(indiceLobuloPrincipalTheta) = [];
    posicionMaxDesfasajeAmbosParaTheta(indiceLobuloPrincipalTheta) = [];

    % II.7. Gráfica del corte del diagrama de radiación -> incluye mínimos y ancho de haz a - 3 dB
    hold on
    grid minor   
    % - Aplica condición única de ancho de haz a - 3dB
    if anchoDeHaz3dBParaTheta == 0
    else 
        plot(ladoDerechoAnchoTheta,0.7,'o','Color',coloranchohaz3dB,'LineWidth',1.25);
        plot(ladoIzquierdoAnchoTheta,0.7,'o','Color',coloranchohaz3dB,'LineWidth',1.25);
        plot([ladoDerechoAnchoTheta ladoIzquierdoAnchoTheta],[0.7 0.7],'--','Color',coloranchohaz3dB,'LineWidth',1.1);
    end
    plot(mDesfasajeAmbosParaTheta,posicionMinDesfasajeAmbosParaThetaPositivo,'*','Color',colorminimos3dB,'LineWidth',1.50); 
    plot(factorRestaCasoTheta,1,'d','Color',colorlpChebyshev,'LineWidth',1.50); 
    plot(maxDesfasajeAmbosParaTheta,posicionMaxDesfasajeAmbosParaTheta,'*','Color',colormaximos3dB,'LineWidth',1.50); 
    ax = gca;
    set(ax,'FontSize', 13);
    title(['Corte del diagrama en \theta_{lp} = ',num2str(pTheta),'º'],'FontSize',20,'FontName', 'Times New Roman');
    xlabel("\phi",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
    xtickformat('degrees');
    ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
    xticks(-90:10:90);
end




