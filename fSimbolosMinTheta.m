function [imprimirMinimos] = fSimbolosMinTheta(xPosicionLobuloMin,yPosicionLobuloMin,impMin,cantMinimos)

flecha2 = char(8594);
letraN = char(8345);            
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

if cantMinimos <= 40
    if impMin == 1
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),',|AF|',num2str(letraN),num2str(numero1),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 2
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),',|AF|',num2str(letraN),num2str(numero2),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 3
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),',|AF|',num2str(letraN),num2str(numero3),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 4
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero4),',|AF|',num2str(letraN),num2str(numero4),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 5
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero5),',|AF|',num2str(letraN),num2str(numero5),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 6
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero6),',|AF|',num2str(letraN),num2str(numero6),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 7
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero7),'|AF|',num2str(letraN),num2str(numero7),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 8
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero8),'|AF|',num2str(letraN),num2str(numero8),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 9
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero9),'|AF|',num2str(letraN),num2str(numero9),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 10
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero0),',|AF|',num2str(letraN),num2str(numero1),num2str(numero0),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 11
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero1),',|AF|',num2str(letraN),num2str(numero1),num2str(numero1),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 12
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero2),',|AF|',num2str(letraN),num2str(numero1),num2str(numero2),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 13
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero3),',|AF|',num2str(letraN),num2str(numero1),num2str(numero3),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 14
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero4),',|AF|',num2str(letraN),num2str(numero1),num2str(numero4),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 15
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero5),',|AF|',num2str(letraN),num2str(numero1),num2str(numero5),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 16
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero6),',|AF|',num2str(letraN),num2str(numero1),num2str(numero6),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 17
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero7),',|AF|',num2str(letraN),num2str(numero1),num2str(numero7),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 18
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero8),',|AF|',num2str(letraN),num2str(numero1),num2str(numero8),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 19
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero1),num2str(numero9),',|AF|',num2str(letraN),num2str(numero1),num2str(numero9),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 20
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero0),',|AF|',num2str(letraN),num2str(numero2),num2str(numero0),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 21
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero1),',|AF|',num2str(letraN),num2str(numero2),num2str(numero1),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 22
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero2),',|AF|',num2str(letraN),num2str(numero2),num2str(numero2),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 23
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero3),',|AF|',num2str(letraN),num2str(numero2),num2str(numero3),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 24
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero4),',|AF|',num2str(letraN),num2str(numero2),num2str(numero4),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 25
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero5),',|AF|',num2str(letraN),num2str(numero2),num2str(numero5),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 26
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero6),',|AF|',num2str(letraN),num2str(numero2),num2str(numero6),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 27
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero7),',|AF|',num2str(letraN),num2str(numero2),num2str(numero7),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 28
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero8),',|AF|',num2str(letraN),num2str(numero2),num2str(numero8),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 29
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero2),num2str(numero9),',|AF|',num2str(letraN),num2str(numero2),num2str(numero9),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 30
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero0),',|AF|',num2str(letraN),num2str(numero3),num2str(numero0),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 31
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero1),',|AF|',num2str(letraN),num2str(numero3),num2str(numero1),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 32
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero2),',|AF|',num2str(letraN),num2str(numero3),num2str(numero2),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 33
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero3),',|AF|',num2str(letraN),num2str(numero3),num2str(numero3),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 34
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero4),',|AF|',num2str(letraN),num2str(numero3),num2str(numero4),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 35
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero5),',|AF|',num2str(letraN),num2str(numero3),num2str(numero5),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 36
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero6),',|AF|',num2str(letraN),num2str(numero3),num2str(numero6),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 37
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero7),',|AF|',num2str(letraN),num2str(numero3),num2str(numero7),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 38
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero8),',|AF|',num2str(letraN),num2str(numero3),num2str(numero8),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 39
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero3),num2str(numero9),',|AF|',num2str(letraN),num2str(numero3),num2str(numero9),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    elseif impMin == 40
        imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(numero4),num2str(numero0),',|AF|',num2str(letraN),num2str(numero4),num2str(numero0),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
    end
else
    imprimirMinimos = (['       ',num2str(flecha2),'(',num2str(theta),num2str(letraN),num2str(impMin),',|AF|',num2str(letraN),num2str(impMin),') = (',num2str(xPosicionLobuloMin),'°,',num2str(yPosicionLobuloMin),')']);
end
