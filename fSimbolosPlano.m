function [imprimirMaximos] = fSimbolosPlano(xPosicionLobulo,yPosicionLobulo,zPosicionLobulo,impMax,tamMaximos)

flecha2 = char(8594);
letraL = char(8343);
theta = char(952);
phi = char(966);
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

if tamMaximos <= 100
    if impMax == 1
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 2
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 3
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 4
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 5
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 6
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 7
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 8
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 9
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 10
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 11
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 12
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 13
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 14
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 15
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 16
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 17
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 18
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 19
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 20
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 21
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 22
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 23
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 24
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 25
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 26
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 27
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 28
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 29
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero2),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 30
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 31
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 32
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 33
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 34
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 35
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 36
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 37
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 38
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 39
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero3),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 40
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 41
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 42
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 43
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 44
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 45
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 46
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 47
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 48
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 49
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero4),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 50
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 51
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 52
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 53
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 54
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 55
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 56
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 57
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 58
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 59
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero5),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 60
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 61
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 62
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 63
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 64
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 65
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 66
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 67
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 68
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 69
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero6),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']); 
    elseif impMax == 70
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 71
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 72
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 73
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 74
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 75
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 76
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 77
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 78
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 79
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero7),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 80
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 81
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 82
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 83
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 84
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 85
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 86
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 87
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 88
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 89
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero8),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 90
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 91
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero1),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero1),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero1),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 92
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero2),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero2),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero2),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 93
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero3),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero3),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero3),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 94
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero4),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero4),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero4),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 95
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero5),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero5),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero5),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 96
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero6),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero6),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero6),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 97
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero7),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero7),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero7),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 98
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero8),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero8),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero8),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 99
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero9),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero9),',|AF|',num2str(letraL),num2str(letraL),num2str(numero9),num2str(numero9),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
    elseif impMax == 100
        imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero0),num2str(numero0),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero0),num2str(numero0),',|AF|',num2str(letraL),num2str(letraL),num2str(numero1),num2str(numero0),num2str(numero0),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
 
    
    
    end
else
    imprimirMaximos = (['    ',num2str(flecha2),'(',num2str(theta),num2str(letraL),num2str(letraL),num2str(impMax),',',num2str(phi),num2str(letraL),num2str(letraL),num2str(impMax),',|AF|',num2str(letraL),num2str(letraL),num2str(impMax),') = (',num2str(xPosicionLobulo),'°,',num2str(yPosicionLobulo),'°,',num2str(zPosicionLobulo),')']);
end
