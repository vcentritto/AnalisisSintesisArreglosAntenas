function [excitacionesFinal,vectorExcitaciones,fc1] = fFactorArregloGraficaLaxpati(excitacionesFinal,excTotal,faLaxpati,nulos, CN, d1,d2)


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

[theta,phi] = meshgrid(-pi/2:1/100:pi/2);
figure
xlim([-60 60]);
ylim([-60 60]);
surf(theta*180/pi, phi*180/pi, abs(fcGrafica));
valoresX = theta*180/pi;
valoresY = phi*180/pi;
valoresZ = abs(fcGrafica);
shading interp;
colormap('default');
colorbar;

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
    plot3(valoresX(1,columnaThetaNulo),valoresY(filaPhiNulo,1),valoresZ(filaPhiNulo,columnaThetaNulo),'*','Linewidth',2.5)
end


xlabel("Theta \theta (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
xticks(-90:10:90);
yticks(-90:10:90);
ax.FontSize = 13;
ylabel("Phi \phi (en grados)",'FontSize', 14,'FontName', 'Times New Roman');
zlabel("|S|",'FontSize', 14,'FontName', 'Times New Roman');
title("Diagrama Cartesiano del Factor de Arreglo",'FontSize', 18,'FontName', 'Times New Roman');

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
        figure
        hold on
        plot(theta.*(180/pi),20*log10(fc1));
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