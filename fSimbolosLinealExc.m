function [imprimirExc] = fSimbolosLinealExc(Amplitudes,FaseG,numeroExcitacionX,N)

flecha2 = char(8594);
angulo = char(8736);
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

if N <= 40
    if numeroExcitacionX == 1
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 2
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 3
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 4
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero4),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 5
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero5),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 6
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero6),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 7
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero7),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 8
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero8),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 9
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero9),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 10
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero0),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 11
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero1),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 12
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero2),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 13
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero3),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 14
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero4),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 15
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero5),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 16
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero6),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 17
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero7),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 18
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero8),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 19
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero1),num2str(numero9),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 20
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero0),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 21
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero1),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 22
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero2),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 23
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero3),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 24
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero4),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 25
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero5),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 26
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero6),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 27
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero7),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 28
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero8),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 29
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero2),num2str(numero9),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 30
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero0),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 31
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero1),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 32
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero2),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 33
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero3),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 34
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero4),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 35
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero5),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 36
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero6),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 37
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero7),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 38
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero8),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 39
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero3),num2str(numero9),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    elseif numeroExcitacionX == 40
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numero4),num2str(numero0),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
    end
else
        imprimirExc = (['    ',num2str(flecha2),' I',num2str(numeroExcitacionX),' = (',num2str(Amplitudes(numeroExcitacionX)),' ',num2str(angulo),' ',num2str(FaseG(numeroExcitacionX)),'°)']);
end
