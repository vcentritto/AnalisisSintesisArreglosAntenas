function [excitacionesFinal,vectorExcitaciones,fc1] = fFactorArregloGraficaLaxpati(excitacionesFinal,excTotal,faLaxpati,nulos, CN, d1,d2)


colorlp = 1/255*[33 0 53]; 
colormaximos = 1/255*[33 0 53]; 


tam = size(excitacionesFinal);
dimExc = tam(1);
vectorExcitaciones = [];
vectorFases = [];
posicion = 1;

if CN >= 4
    for m = 1:1:dimExc
        for n = 1:1:dimExc
            valor = excitacionesFinal(m,n);
            if valor == 0
                %No guardar valor
            else
                vectorExcitaciones(1,posicion) = valor;
                vectorExcitaciones2(1,posicion) = abs(valor);
                vectorFases(1,posicion) = angle(valor)*(180/pi);
                posicion = posicion + 1;
            end
        end
    end
else
    vectorExcitaciones = excitacionesFinal;
    vectorExcitaciones2 = abs(excitacionesFinal);
    vectorFases = angle(excitacionesFinal)*(180/pi);
end

tam2 = size(vectorExcitaciones);
cantNulos = tam2(2);

% PRESENTAR EXCITACIONES
disp(' ');
disp('- EXCITACIONES (MAGNITUD FASE) -:')
for numNulo = 1:1:cantNulos
    disp(['        - Excitación #',num2str(numNulo),'-> Magnitud:', num2str(vectorExcitaciones2(1,numNulo)),'| Fase:: ',num2str(vectorFases(1,numNulo))]);
end

% PRESENTAR GRAFICA 3D
valorMaximo = max(max(faLaxpati));
matrizNormalizada = zeros(length(faLaxpati),length(faLaxpati));
for i = 1:length(faLaxpati)
    for r = 1: length(faLaxpati)
        matrizNormalizada(i,r) = faLaxpati(i,r)/valorMaximo;   
    end
end
fcGrafica = matrizNormalizada;
[colorLaxpati,colornulos,colorcurva] = fColoresLaxpati;
[theta,phi] = meshgrid(-pi/2:1/100:pi/2);

%GRAFICA LINEAL
fGrafica3DLaxpatiLineal(theta,phi,fcGrafica,colorLaxpati);
ejeX = theta.*180/pi;
ejeY = phi.*180/pi;
ejeZ = abs(fcGrafica);
hold on
valoresX = theta*180/pi;
valoresY = phi*180/pi;
valoresZ = abs(fcGrafica);
for reptNulos = 1:1:CN
    for c = 1:1:315
        valorThetaNul = valoresX(1,c);
        if valorThetaNul > nulos(reptNulos,1)
            columnaThetaNulo = c;
            break
        end
    end
    
    for q = 1:1:315
        valorPhiNul = valoresY(q,1);
        if valorPhiNul > nulos(reptNulos,2)
            filaPhiNulo = q;
            break   
        end
    end
    hold on
    plot3(valoresX(1,columnaThetaNulo),valoresY(filaPhiNulo,1),valoresZ(filaPhiNulo,columnaThetaNulo),"*",'Color',colornulos,'Linewidth',3)
end

distanciaMinima = 5;  % Define la distancia mínima aquí
alturaMinima = 0.4;  % Define la altura mínima aquí
anchoBinY = 15;  % Define el ancho de los bins para agrupar las coordenadas Y aquí

maximosLocales = [];
maximosLocalesMatriz = islocalmax(ejeZ);
[maxXIndice, maxYIndice] = find(maximosLocalesMatriz);
for i = 1:length(maxXIndice)
    maxX = ejeX(maxXIndice(i), maxYIndice(i));
    maxY = ejeY(maxXIndice(i), maxYIndice(i));
    maxZ = ejeZ(maxXIndice(i), maxYIndice(i));
    if maxZ > alturaMinima
        if isempty(maximosLocales)
            maximosLocales = [maximosLocales; [maxX, maxY, maxZ]];
        else
            distancias = sqrt(sum(bsxfun(@minus, maximosLocales(:,1:2), [maxX, maxY]).^2,2));
            if min(distancias) > distanciaMinima
                maximosLocales = [maximosLocales; [maxX, maxY, maxZ]];
            end
        end
    end
end

% Agrupa los máximos por su coordenada Y utilizando histc
[~, ~, indicesBinY] = histcounts(maximosLocales(:,2), 'BinWidth', anchoBinY);
gruposY = {};
for i = 1:max(indicesBinY)
    gruposY{i} = maximosLocales(indicesBinY == i,:);
end

% Encuentra el máximo con mayor altura en cada grupo
maximosPorGrupo = [];
for i = 1:length(gruposY)
    [~, indiceMaximo] = max(gruposY{i}(:,3));
    maximosPorGrupo = [maximosPorGrupo; gruposY{i}(indiceMaximo,:)];
end

% Encuentra el máximo con mayor altura de todos los máximos
[~, indiceMaximoGlobal] = max(maximosLocales(:,3));
maximoGlobal = maximosLocales(indiceMaximoGlobal,:);

% Excluye el máximo global de los máximos por grupo
maximosPorGrupo(maximosPorGrupo(:,1) == maximoGlobal(1) & maximosPorGrupo(:,2) == maximoGlobal(2) & maximosPorGrupo(:,3) == maximoGlobal(3), :) = [];

% Grafica los máximos con mayor altura en cada grupo (excluyendo el máximo global)
for i = 1:size(maximosPorGrupo, 1)
    plot3(maximosPorGrupo(i, 1), maximosPorGrupo(i, 2), maximosPorGrupo(i, 3), '*','Color', colormaximos,'Linewidth', 2);
end

% Grafica el máximo con mayor altura de todos los máximos en el mismo figure
plot3(maximoGlobal(1), maximoGlobal(2), maximoGlobal(3), 'd','Color', colorlp,'Linewidth', 2);
% contour3(ejeX,ejeY,ejeZ,[0.707,0.707],'--','Color', colorlp, 'Linewidth', 1.45)
hold off

%GRAFICA LOGARITMICA
fGrafica3DLaxpatiLogaritmica(theta,phi,fcGrafica,colorLaxpati);
hold on
valoresX = theta*180/pi;
valoresY = phi*180/pi;
valoresZ = 20*log10(abs(fcGrafica));
for reptNulos = 1:1:CN
    for c = 1:1:315
        valorThetaNul = valoresX(1,c);
        if valorThetaNul > nulos(reptNulos,1)
            columnaThetaNulo = c;
            break
        end
    end
    
    for q = 1:1:315
        valorPhiNul = valoresY(q,1);
        if valorPhiNul > nulos(reptNulos,2)
            filaPhiNulo = q;
            break   
        end
    end
    hold on
    plot3(valoresX(1,columnaThetaNulo),valoresY(filaPhiNulo,1),valoresZ(filaPhiNulo,columnaThetaNulo),"*",'Color',colornulos,'Linewidth',2)
end
hold off

% GRAFICA ESFERICA
fGraficaEsfericaLaxpati(theta,phi,fcGrafica,colorLaxpati);

% PRESENTAR CORTES DE NULOS

kd1 = 2*pi*d1;
kd2 = 2*pi*d2;
fi1 = 0;
fi2 = pi/2;
theta = -pi/2:(1/100):pi/2;
if CN == 3    
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        figure('Name','Corte del diagrama en phi para mostrar nulos');
        hold on
        plot(theta.*(180/pi),20*log10(fc1),'Color', colorcurva,'Linewidth',1.25);
        ax = gca;
        set(ax, 'FontSize', 14)
        grid on                         
        grid minor
        title([' Nulo ',num2str(numGrafica),' \Rightarrow (\theta_{n}, \phi_{n}) = (',num2str(nulos(numGrafica,1)),'°, ',num2str(nulos(numGrafica,2)),'°) \rightarrow corte en \phi_{n} = ',num2str(nulos(numGrafica,2)),'°'],'FontSize', 18,'FontName', 'Times New Roman');
        xlabel("\theta",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
        xtickformat('degrees')
        xticks(-90:10:90);
        ylabel("AF_{(dB)}",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fc1);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Color', colornulos,'Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Color', colornulos,'Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end                    
    end
elseif CN == 4
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fcTotal = fc1.*fc2;
        fcTotal = fcTotal / max(fcTotal);
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 5
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fcTotal = fc1.*fc2;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 6
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fcTotal = fc1.*fc2;
        figure('Name','Corte del diagrama en phi para mostrar nulos');
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal),'Color', colorcurva,'Linewidth',1.25);
        ax = gca;
        set(ax, 'FontSize', 14)
        grid on                         
        grid minor
        title([' Nulo ',num2str(numGrafica),' \Rightarrow (\theta_{n}, \phi_{n}) = (',num2str(nulos(numGrafica,1)),'°, ',num2str(nulos(numGrafica,2)),'°) \rightarrow corte en \phi_{n} = ',num2str(nulos(numGrafica,2)),'°'],'FontSize', 18,'FontName', 'Times New Roman');
        xlabel("\theta",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
        xtickformat('degrees')
        xticks(-90:10:90);
        ylabel("AF_{(dB)}",'FontSize', 14,'FontWeight','bold','FontName', 'Times New Roman');
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Color', colornulos,'Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Color', colornulos,'Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
    end
elseif CN == 7  
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fcTotal = fc1.*fc2.*fc3;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 8
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fcTotal = fc1.*fc2.*fc3;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 9
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fcTotal = fc1.*fc2.*fc3;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 10
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fcTotal = fc1.*fc2.*fc3.*fc4;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 11
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fcTotal = fc1.*fc2.*fc3.*fc4;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 12
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fcTotal = fc1.*fc2.*fc3.*fc4;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 13
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 14  
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 15
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 16
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fc6 = excTotal(6,1)*exp(Arg1)+excTotal(6,2)*exp(Arg2)+excTotal(6,3)*exp(-Arg1)+excTotal(6,4)*exp(-Arg2);
        fc6 = fc6 / max(fc6);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5.*fc6;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 17
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fc6 = excTotal(6,1)*exp(Arg1)+excTotal(6,2)*exp(Arg2)+excTotal(6,3)*exp(-Arg1)+excTotal(6,4)*exp(-Arg2);
        fc6 = fc6 / max(fc6);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5.*fc6;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 18
     for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fc6 = excTotal(6,1)*exp(Arg1)+excTotal(6,2)*exp(Arg2)+excTotal(6,3)*exp(-Arg1)+excTotal(6,4)*exp(-Arg2);
        fc6 = fc6 / max(fc6);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5.*fc6;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
     end
elseif CN == 19
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fc6 = excTotal(6,1)*exp(Arg1)+excTotal(6,2)*exp(Arg2)+excTotal(6,3)*exp(-Arg1)+excTotal(6,4)*exp(-Arg2);
        fc6 = fc6 / max(fc6);
        fc7 = excTotal(7,1)*exp(Arg1)+excTotal(7,2)*exp(Arg2)+excTotal(7,3)*exp(-Arg1)+excTotal(7,4)*exp(-Arg2);
        fc7 = fc7 / max(fc7);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5.*fc6.*fc7;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 20
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fc6 = excTotal(6,1)*exp(Arg1)+excTotal(6,2)*exp(Arg2)+excTotal(6,3)*exp(-Arg1)+excTotal(6,4)*exp(-Arg2);
        fc6 = fc6 / max(fc6);
        fc7 = excTotal(7,1)*exp(Arg1)+excTotal(7,2)*exp(Arg2)+excTotal(7,3)*exp(-Arg1)+excTotal(7,4)*exp(-Arg2);
        fc7 = fc7 / max(fc7);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5.*fc6.*fc7;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 21  
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fc6 = excTotal(6,1)*exp(Arg1)+excTotal(6,2)*exp(Arg2)+excTotal(6,3)*exp(-Arg1)+excTotal(6,4)*exp(-Arg2);
        fc6 = fc6 / max(fc6);
        fc7 = excTotal(7,1)*exp(Arg1)+excTotal(7,2)*exp(Arg2)+excTotal(7,3)*exp(-Arg1)+excTotal(7,4)*exp(-Arg2);
        fc7 = fc7 / max(fc7);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5.*fc6.*fc7;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 22
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fc6 = excTotal(6,1)*exp(Arg1)+excTotal(6,2)*exp(Arg2)+excTotal(6,3)*exp(-Arg1)+excTotal(6,4)*exp(-Arg2);
        fc6 = fc6 / max(fc6);
        fc7 = excTotal(7,1)*exp(Arg1)+excTotal(7,2)*exp(Arg2)+excTotal(7,3)*exp(-Arg1)+excTotal(7,4)*exp(-Arg2);
        fc7 = fc7 / max(fc7);
        fc8 = excTotal(8,1)*exp(Arg1)+excTotal(8,2)*exp(Arg2)+excTotal(8,3)*exp(-Arg1)+excTotal(8,4)*exp(-Arg2);
        fc8 = fc8 / max(fc8);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5.*fc6.*fc7.*fc8;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 23
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fc6 = excTotal(6,1)*exp(Arg1)+excTotal(6,2)*exp(Arg2)+excTotal(6,3)*exp(-Arg1)+excTotal(6,4)*exp(-Arg2);
        fc6 = fc6 / max(fc6);
        fc7 = excTotal(7,1)*exp(Arg1)+excTotal(7,2)*exp(Arg2)+excTotal(7,3)*exp(-Arg1)+excTotal(7,4)*exp(-Arg2);
        fc7 = fc7 / max(fc7);
        fc8 = excTotal(8,1)*exp(Arg1)+excTotal(8,2)*exp(Arg2)+excTotal(8,3)*exp(-Arg1)+excTotal(8,4)*exp(-Arg2);
        fc8 = fc8 / max(fc8);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5.*fc6.*fc7.*fc8;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
elseif CN == 24
    for numGrafica = 1:1:CN
        Arg1 = j*kd1*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi1);
        Arg2 = j*kd2*sin(theta)*cos((nulos(numGrafica,2)*pi/180)-fi2);
        fc1 = excTotal(1,1)*exp(Arg1)+excTotal(1,2)*exp(Arg2)+excTotal(1,3)*exp(-Arg1)+excTotal(1,4)*exp(-Arg2);
        fc1 = fc1 / max(fc1);
        fc2 = excTotal(2,1)*exp(Arg1)+excTotal(2,2)*exp(Arg2)+excTotal(2,3)*exp(-Arg1)+excTotal(2,4)*exp(-Arg2);
        fc2 = fc2 / max(fc2);
        fc3 = excTotal(3,1)*exp(Arg1)+excTotal(3,2)*exp(Arg2)+excTotal(3,3)*exp(-Arg1)+excTotal(3,4)*exp(-Arg2);
        fc3 = fc3 / max(fc3);
        fc4 = excTotal(4,1)*exp(Arg1)+excTotal(4,2)*exp(Arg2)+excTotal(4,3)*exp(-Arg1)+excTotal(4,4)*exp(-Arg2);
        fc4 = fc4 / max(fc4);
        fc5 = excTotal(5,1)*exp(Arg1)+excTotal(5,2)*exp(Arg2)+excTotal(5,3)*exp(-Arg1)+excTotal(5,4)*exp(-Arg2);
        fc5 = fc5 / max(fc5);
        fc6 = excTotal(6,1)*exp(Arg1)+excTotal(6,2)*exp(Arg2)+excTotal(6,3)*exp(-Arg1)+excTotal(6,4)*exp(-Arg2);
        fc6 = fc6 / max(fc6);
        fc7 = excTotal(7,1)*exp(Arg1)+excTotal(7,2)*exp(Arg2)+excTotal(7,3)*exp(-Arg1)+excTotal(7,4)*exp(-Arg2);
        fc7 = fc7 / max(fc7);
        fc8 = excTotal(8,1)*exp(Arg1)+excTotal(8,2)*exp(Arg2)+excTotal(8,3)*exp(-Arg1)+excTotal(8,4)*exp(-Arg2);
        fc8 = fc8 / max(fc8);
        fcTotal = fc1.*fc2.*fc3.*fc4.*fc5.*fc6.*fc7.*fc8;
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fcTotal));
        valoresX = theta.*(180/pi);
        valoresZ = 20*log10(fcTotal);
        for variar = 1:1:315
            valorIter = valoresX(variar);
            if valorIter > nulos(numGrafica,1)
                %ENCONTRO EL NULO PARA GRAFICAR
                posicion = variar-1;
                valorZ1 = abs(valoresZ(variar));
                valorZ2 = abs(valoresZ(posicion));
                if valorZ1 > valorZ2
                    plot(valoresX(variar),valoresZ(variar),'*','Linewidth',1.50)
                    break 
                else
                    plot(valoresX(posicion),valoresZ(posicion),'*','Linewidth',1.50)
                    break 
                end      
            else
                %NO HA ENCONTRADO EL NULO
            end
        end
        xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
        xticks(-90:10:90);
        ax.FontSize = 13;
        ylabel("|S| (en dB)",'FontSize', 14,'FontName', 'Times New Roman');
        title([' Nulo',' ',num2str(numGrafica),' (\theta, \phi) : (',num2str(nulos(numGrafica,1)),'° , ',num2str(nulos(numGrafica,2)),'°)'],'FontSize', 18,'FontName', 'Times New Roman');
        grid on                         %Colocando una malla
        grid minor                      %Hace malla más pequeño
    end
else
   disp('No se puede realizar con los datos ingresados.') 
end