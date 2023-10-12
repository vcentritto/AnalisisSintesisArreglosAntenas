function [imprimirMaximos] = fSimbolosMaxTheta(xPosicionLobulo,yPosicionLobulo,impMax,tamMaximos)

flecha2 = char(8594);
letraL = char(8343);
theta = char(952);
numero0 = char(8320);
numero1 = char(8321);
numero2 = char(8322);
numero3 = char(8323);
numero4 = char(8324);
numero5 = char(8325);
numero6 = char(8326);
numero7 = char(8327);
numero8 = char(8328);
numero9 = char(8329);

if tamMaximos <= 40
    if impMax == 1
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 2
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 3
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 4
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 5
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 6
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 7
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),'|AF|',num2str(letraL),num2str(letraL),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 8
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),'|AF|',num2str(letraL),num2str(letraL),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 9
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),'|AF|',num2str(letraL),num2str(letraL),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 10
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 11
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 12
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 13
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 14
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 15
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 16
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 17
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 18
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 19
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 20
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 21
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 22
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 23
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 24
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 25
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 26
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 27
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 28
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 29
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 30
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 31
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 32
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 33
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 34
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 35
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 36
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 37
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 38
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 39
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    elseif impMax == 40
        imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
    end
else
    imprimirMaximos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(impMax),',|AF|',num2str(letraL),num2str(letraL),num2str(impMax),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),')']);
end
