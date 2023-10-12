function [anchoDeHaz3dBParaTheta,anchoDeHaz3dBParaPhi,mDesfasajeAmbosParaPhi,posicionMinDesfasajeAmbosParaPhiPositivo,anchoHazDesfasajeAmbosParaPhi, mDesfasajeAmbosParaTheta, posicionMinDesfasajeAmbosParaThetaPositivo,anchoHazDesfasajeAmbosParaTheta] = fAnchoHaz3DBPlanoXY(ejeY,ejeZ,ejeX,xLobPrin,yLobPrin)

% �CU�LES M�DULOS USAN LA FUNCI�N fAnchoHaz3DBPlanoXY?
%   - Es una subfunci�n de fGraficayAnalisisPlano, por lo que aplica en:
%       - M�dulo de an�lisis de arreglos en el plano. 
%       - M�dulo de variaci�n de la fase entre elementos para arreglos en el plano.

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fAnchoHaz3DBPlanoXY?
% I.  Corte en la posici�n (en phi) del l�bulo principal.
% II. Corte en la posici�n (en theta) del l�bulo principal.
%     Se calculan los siguientes par�metros a partir de ambos cortes.
%     - Ancho de haz principal.
%     - Ancho de haz a - 3 dB (num�ricamente y gr�ficamente).
%     - Posiciones de los nulos (num�ricamente y gr�ficamente).

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     ejeX ----------------------------> Intervalo de grados de theta (-90>theta>90).
%     ejeY ----------------------------> Intervalo de grados de phi (-90>phi>90)
%     ejeZ ----------------------------> Valores que toma el Factor de Arreglo.
%     yLobPrin ------------------------> Posici�n del l�bulo principal (en phi = eje "y" de MATLAB)
%     xLobPrin ------------------------> Posici�n del l�bulo principal (en theta = eje "x" de MATLAB)

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     anchoDeHaz3dBParaPhi ------------------------> Ancho de haz a -3dB (corte en phi).
%     mDesfasajeAmbosParaPhi ----------------------> Posiciones de nulos (corte en phi).
%     posicionMinDesfasajeAmbosParaPhiPositivo ----> Altura de los nulos (corte en phi).
%     anchoHazDesfasajeAmbosParaPhi ---------------> Ancho de haz principal (corte en phi).
%     anchoDeHaz3dBParaTheta ----------------------> Ancho de haz a -3dB (corte en theta).
%     mDesfasajeAmbosParaTheta --------------------> Posiciones de nulos (corte en theta).
%     posicionMinDesfasajeAmbosParaThetaPositivo ----> Altura de los nulos (corte en theta).
%     anchoHazDesfasajeAmbosParaTheta -------------> Ancho de haz principal (corte en theta).

% �CU�LES SUBFUNCIONES CONTIENE?:
%     fCondicion1AnchoHazTheta -------------------> Funci�n que aplica condici�n 1 para c�lculo de ancho de haz principal (corte en theta)
%     fCondicion1AnchoHazPhi ---------------------> Funci�n que aplica condici�n 1 para c�lculo de ancho de haz principal (corte en phi)
%     fCondicion2AnchoHazTheta -------------------> Funci�n que aplica condici�n 2 para c�lculo de ancho de haz principal (corte en theta)
%     fCondicion2AnchoHazPhi ---------------------> Funci�n que aplica condici�n 2 para c�lculo de ancho de haz principal (corte en phi) 

%PAR�METROS Y S�MBOLOS INICIALES
colorminimos3dB = 1/255*[102 85 163]; 
coloranchohaz3dB = 1/255*[103 5 165]; 
colorcurva3dB = 1/255*[47 44 121]; 
v = [0.5,0.5];

%PARTE I: CORTE DEL DIAGRAMA DE RADIACI�N EN PHI (GR�FICA 2D THETA-AF)-> Para todos los m�dulos que usan esta funci�n
figure('Name','Corte del diagrama de radiaci�n (en posici�n phi del l�bulo principal)');
% I.1. Rutina para obtener corte del patr�n en phi = posici�n del l�bulo principal
[cortesAnchoPhi,vcortesPhi] = contour(ejeX,ejeZ,(ejeY-yLobPrin),v,'Color', colorcurva3dB,'LineWidth',1.75);

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
minimosDesfasajeAmbosParaPhi = contour(ejeX,ejeZ,(ejeY-yLobPrin),v,'Color', colorcurva3dB,'LineWidth',1.75);
minDesfasajeAmbosParaPhi = minimosDesfasajeAmbosParaPhi(2,:);
[posicionMinDesfasajeAmbosParaPhi,indiceMinDesfasajeAmbosParaPhi] = findpeaks(-(minDesfasajeAmbosParaPhi));
equivalenteMinDesfasajeAmbosParaPhi = minimosDesfasajeAmbosParaPhi(1,:);
mDesfasajeAmbosParaPhi = equivalenteMinDesfasajeAmbosParaPhi(indiceMinDesfasajeAmbosParaPhi);
%- Se encuentran posiciones de m�ximos y de l�bulo principal en el corte.  
maximosDesfasajePhiParaAmbos = minimosDesfasajeAmbosParaPhi(2,:);
[posicionMaxDesfasajePhiParaAmbos,indiceMaxDesfasajePhiParaAmbos] = findpeaks((maximosDesfasajePhiParaAmbos));
equivalenteMaxDesfasajePhiParaAmbos = minimosDesfasajeAmbosParaPhi(1,:);
maxDesfasajeAmbosParaPhi = equivalenteMaxDesfasajePhiParaAmbos(indiceMaxDesfasajePhiParaAmbos);
% - Se contin�a con rutina para hallar ancho de haz principal
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
% - Aplica Condici�n 1 de ancho de haz principal
[indiceMinimoACasoPhi,indiceMinimoBCasoPhi] = fCondicion1AnchoHazPhi(minimoACasoPhi,minimoBCasoPhi,resultadoRestaCasoPhi);
primerMinimoCasoPhi = mDesfasajeAmbosParaPhi(indiceMinimoACasoPhi);
segundoMinimoCasoPhi = mDesfasajeAmbosParaPhi(indiceMinimoBCasoPhi);

% I.4. C�lculo final de ancho de haz principal
if (primerMinimoCasoPhi > factorRestaCasoPhi && segundoMinimoCasoPhi < factorRestaCasoPhi) || (primerMinimoCasoPhi < factorRestaCasoPhi && segundoMinimoCasoPhi > factorRestaCasoPhi)
    if (primerMinimoCasoPhi >= 0 && segundoMinimoCasoPhi >= 0)||(primerMinimoCasoPhi <= 0 && segundoMinimoCasoPhi <= 0) 
        anchoHazDesfasajeAmbosParaPhi = abs(abs(primerMinimoCasoPhi)-abs(segundoMinimoCasoPhi));
    end
    if (primerMinimoCasoPhi >= 0 && segundoMinimoCasoPhi <= 0)||(primerMinimoCasoPhi <= 0 && segundoMinimoCasoPhi >= 0) 
        anchoHazDesfasajeAmbosParaPhi = abs(primerMinimoCasoPhi)+ abs(segundoMinimoCasoPhi);
    end
else
    % - Aplica Condici�n 2 de ancho de haz principal
    [anchoHazDesfasajeAmbosParaPhi] = fCondicion2AnchoHazPhi(mDesfasajeAmbosParaPhi,ordenCasoPhi,resultadoRestaCasoPhi,primerMinimoCasoPhi,factorRestaCasoPhi);
end

% I.5. C�lculo final de ancho de haz a - 3 dB
% - Condici�n �nica de ancho de haz a - 3 dB
if (ladoIzquierdoAnchoPhi > factorRestaCasoPhi && ladoDerechoAnchoPhi < factorRestaCasoPhi) || (ladoIzquierdoAnchoPhi < factorRestaCasoPhi && ladoDerechoAnchoPhi > factorRestaCasoPhi)
    anchoDeHaz3dBParaPhi = abs(ladoIzquierdoAnchoPhi - ladoDerechoAnchoPhi);
else
    anchoDeHaz3dBParaPhi = 0;
end

% I.6. Gr�fica del corte del diagrama de radiaci�n -> incluye m�nimos y ancho de haz a - 3 dB
posicionMinDesfasajeAmbosParaPhiPositivo = (-1).*posicionMinDesfasajeAmbosParaPhi;
hold on
grid minor   
% - Aplica condici�n �nica de ancho de haz a - 3dB
if anchoDeHaz3dBParaPhi == 0
else
    plot(ladoDerechoAnchoPhi,0.7,'o','Color', coloranchohaz3dB,'LineWidth',1.25);
    plot(ladoIzquierdoAnchoPhi,0.7,'o','Color',coloranchohaz3dB,'LineWidth',1.25);
    plot([ladoDerechoAnchoPhi ladoIzquierdoAnchoPhi],[0.7 0.7],'--','Color',coloranchohaz3dB,'LineWidth',1.1);
end
plot(mDesfasajeAmbosParaPhi,posicionMinDesfasajeAmbosParaPhiPositivo,'*','Color',colorminimos3dB,'LineWidth',1.50); 
plot(factorRestaCasoPhi,1,'d','Color',colorminimos3dB,'LineWidth',1.50);  
ax = gca;
set(ax,'FontSize', 13);
title(['Corte del diagrama en \phi_{0} = ',num2str(yLobPrin),'�'],'FontSize',20,'FontName', 'Times New Roman');
xlabel("\theta",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xtickformat('degrees');
ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
xticks(-90:15:90);
        

%PARTE II: CORTE DEL DIAGRAMA DE RADIACI�N EN THETA (GR�FICA 2D PHI-AF)-> Para todos los m�dulos que usan esta funci�n
figure('Name','Corte del diagrama de radiaci�n (en posici�n theta del l�bulo principal)');
% II.1. Rutina para obtener corte del patr�n en theta = posici�n del l�bulo principal
[cortesAnchoTheta,vcortesTheta] = contour(ejeY,ejeZ,(ejeX-xLobPrin),v,'Color',colorcurva3dB,'LineWidth',1.75);

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
minimosDesfasajeAmbosParaTheta = contour(ejeY,ejeZ,(ejeX-xLobPrin),v,'Color',colorcurva3dB,'LineWidth',1.75);
minDesfasajeAmbosParaTheta = minimosDesfasajeAmbosParaTheta(2,:);
[posicionMinDesfasajeAmbosParaTheta,indiceMinDesfasajeAmbosParaTheta] = findpeaks(-(minDesfasajeAmbosParaTheta));
equivalenteMinDesfasajeAmbosParaTheta = minimosDesfasajeAmbosParaTheta(1,:);
mDesfasajeAmbosParaTheta = equivalenteMinDesfasajeAmbosParaTheta(indiceMinDesfasajeAmbosParaTheta); 
% - Se encuentran posiciones de m�ximos y de l�bulo principal en el corte.  
maximosDesfasajeAmbosParaTheta = minimosDesfasajeAmbosParaTheta(2,:);
[posicionMaxDesfasajeAmbosParaTheta,indiceMaxDesfasajeAmbosParaTheta] = findpeaks((maximosDesfasajeAmbosParaTheta));
posicionMinDesfasajeAmbosParaThetaPositivo = (-1).*posicionMinDesfasajeAmbosParaTheta;
equivalenteMaxDesfasajeAmbosParaTheta = minimosDesfasajeAmbosParaTheta(1,:);
maxDesfasajeAmbosParaTheta = equivalenteMaxDesfasajeAmbosParaTheta(indiceMaxDesfasajeAmbosParaTheta);
% - Se contin�a con rutina para hallar ancho de haz principal
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
% Condici�n que ocurre con cuatro elementos -> encuentra un solo m�nimo o ninguno
if length(ordenCasoTheta) == 1
    anchoHazDesfasajeAmbosParaTheta = 0;
    anchoDeHaz3dBParaTheta = 0;
    hold on
    grid minor
    plot(mDesfasajeAmbosParaTheta,posicionMinDesfasajeAmbosParaThetaPositivo,'*','Color',colorminimos3dB,'LineWidth',1.50); 
    plot(factorRestaCasoTheta,1,'d','Color',colorminimos3dB,'LineWidth',1.50); 
    ax = gca;
    set(ax,'FontSize', 13);
    title(['Corte del diagrama en \theta_{0} = ',num2str(xLobPrin),'�'],'FontSize',20,'FontName', 'Times New Roman');
    xlabel("\phi",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
    xtickformat('degrees');
    ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
    xticks(-90:10:90);
else
    minimoBCasoTheta = ordenCasoTheta(2);
    % - Aplica Condici�n 2 de ancho de haz principal
    [indiceMinimoACasoTheta,indiceMinimoBCasoTheta] = fCondicion1AnchoHazTheta(minimoACasoTheta,minimoBCasoTheta,resultadoRestaCasoTheta);
    primerMinimoCasoTheta = mDesfasajeAmbosParaTheta(indiceMinimoACasoTheta);
    segundoMinimoCasoTheta = mDesfasajeAmbosParaTheta(indiceMinimoBCasoTheta);

    % II.4. C�lculo final de ancho de haz principal
    if (primerMinimoCasoTheta > factorRestaCasoTheta && segundoMinimoCasoTheta < factorRestaCasoTheta) || (primerMinimoCasoTheta < factorRestaCasoTheta && segundoMinimoCasoTheta > factorRestaCasoTheta)
        if (primerMinimoCasoTheta >= 0 && segundoMinimoCasoTheta >= 0)||(primerMinimoCasoTheta <= 0 && segundoMinimoCasoTheta <= 0) 
            anchoHazDesfasajeAmbosParaTheta = abs(abs(primerMinimoCasoTheta)-abs(segundoMinimoCasoTheta));
        end
        if (primerMinimoCasoTheta >= 0 && segundoMinimoCasoTheta <= 0)||(primerMinimoCasoTheta <= 0 && segundoMinimoCasoTheta >= 0) 
            anchoHazDesfasajeAmbosParaTheta = abs(primerMinimoCasoTheta)+ abs(segundoMinimoCasoTheta);
        end
    else
        % - Aplica Condici�n 2 de ancho de haz principal
        [anchoHazDesfasajeAmbosParaTheta] = fCondicion1AnchoHazTheta(mDesfasajeAmbosParaTheta,ordenCasoTheta,resultadoRestaCasoTheta,primerMinimoCasoTheta,factorRestaCasoTheta);
    end

    % II.5. C�lculo final de ancho de haz a - 3 dB
    % - Condici�n �nica de ancho de haz a - 3 dB
    if (ladoIzquierdoAnchoTheta > factorRestaCasoTheta && ladoDerechoAnchoTheta < factorRestaCasoTheta) || (ladoIzquierdoAnchoTheta < factorRestaCasoTheta && ladoDerechoAnchoTheta > factorRestaCasoTheta)
        anchoDeHaz3dBParaTheta = abs(ladoIzquierdoAnchoTheta - ladoDerechoAnchoTheta);
    else
        anchoDeHaz3dBParaTheta = 0;
    end

    % II.6. Gr�fica del corte del diagrama de radiaci�n -> incluye m�nimos y ancho de haz a - 3 dB
    hold on
    grid minor   
    % - Aplica condici�n �nica de ancho de haz a - 3dB
    if anchoDeHaz3dBParaTheta == 0
    else 
        plot(ladoDerechoAnchoTheta,0.7,'o','Color',coloranchohaz3dB,'LineWidth',1.25);
        plot(ladoIzquierdoAnchoTheta,0.7,'o','Color',coloranchohaz3dB,'LineWidth',1.25);
        plot([ladoDerechoAnchoTheta ladoIzquierdoAnchoTheta],[0.7 0.7],'--','Color',coloranchohaz3dB,'LineWidth',1.1);
    end
    plot(mDesfasajeAmbosParaTheta,posicionMinDesfasajeAmbosParaThetaPositivo,'*','Color',colorminimos3dB,'LineWidth',1.50); 
    plot(factorRestaCasoTheta,1,'d','Color',colorminimos3dB,'LineWidth',1.50);  
    ax = gca;
    set(ax,'FontSize', 13);
    title(['Corte del diagrama en \theta_{0} = ',num2str(xLobPrin),'�'],'FontSize',20,'FontName', 'Times New Roman');
    xlabel("\phi",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
    xtickformat('degrees');
    ylabel("|AF|",'FontSize', 14,'FontWeight', 'bold','FontName', 'Times New Roman');
    xticks(-90:15:90);
end





