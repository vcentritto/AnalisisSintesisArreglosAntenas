function [angulocorteTheta,angulocortePhi] = fCortesDiagrama(opcion,repetir)

f = char(8658);

while opcion == 1
 if repetir ~= 1 && repetir ~= 2
       disp('        - ¿Quiere un corte del diagrama de radiación?');
       disp('           1. Sí');
       disp('           2. No');
       verifCurva = input('        Seleccione: ');
       disp('--------------------------------------------------------------------------------------------------------------');
    if verifCurva == 1 
        disp('        - ¿Dónde quiere realizar dicho corte?');
        disp('           1. En theta');
        disp('           2. En phi'); 
        ejeCurva = input('        Seleccione: ');
        disp('--------------------------------------------------------------------------------------------------------------');
        disp("¡IMPORTANTE!"); 
        disp(['       ',num2str(f),' El valor de corte (en theta o en phi) debe estar entre -90° y 90°.']);
        disp('--------------------------------------------------------------------------------------------------------------');
        if ejeCurva == 1
            angulocorteTheta = input('        - Ingrese el valor de corte en theta: ');
            while (angulocorteTheta < -90 ||  angulocorteTheta > 90)
                disp('--------------------------------------------------------------------------------------------------------------');
                disp("¡EL VALOR DE CORTE EN THETA NO ES VÁLIDO!"); 
                disp(['       ',num2str(f),' RECUERDE: el valor de corte en theta debe estar entre -90° y 90°.']);
                disp('--------------------------------------------------------------------------------------------------------------');
                angulocorteTheta = input('        - Por favor,ingrese el valor de corte en theta: ');
            end
       repetir = 1;
       elseif ejeCurva == 2
            angulocortePhi = input('        - Ingrese el valor de corte en phi: ');
            while (angulocortePhi < -90 ||  angulocortePhi > 90)
                disp('--------------------------------------------------------------------------------------------------------------');
                disp("¡EL VALOR DE CORTE EN PHI NO ES VÁLIDO!"); 
                disp(['       ',num2str(f),' RECUERDE: el valor de corte en phi debe estar entre -90° y 90°.']);
                disp('--------------------------------------------------------------------------------------------------------------');
                angulocortePhi = input('        - Por favor, ingrese el valor de corte en phi: ');
            end
       repetir = 2;
        end
    elseif verifCurva == 2
        angulocortePhi = 100;
        angulocorteTheta = 100;
        opcion = 2;
    else
       disp("¡LA OPCIÓN NO ES VÁLIDA!"); 
       disp(['       ',num2str(f),' A continuación, vuelva a seleccionar una de las opciones.']);
       disp('--------------------------------------------------------------------------------------------------------------');
    end
 elseif repetir == 1
      disp('--------------------------------------------------------------------------------------------------------------');
      disp('        - ¿Quiere un corte del diagrama en phi?');
      disp('           1. Sí');
      disp('           2. No');
      verifCurvaRepetir = input('        Seleccione: ');
      disp('--------------------------------------------------------------------------------------------------------------');
      if verifCurvaRepetir == 1
         angulocortePhi = input('        - Ingrese el valor de corte en phi: ');
         disp('--------------------------------------------------------------------------------------------------------------');
         while (angulocortePhi < -90 ||  angulocortePhi > 90)
           disp("¡EL VALOR DE CORTE EN PHI NO ES VÁLIDO!"); 
           disp(['       ',num2str(f),' RECUERDE: el valor de corte en phi debe estar entre -90° y 90°.']);
           disp('--------------------------------------------------------------------------------------------------------------');
           angulocortePhi = input('        - Por favor, ingrese el valor de corte en phi: ');
           disp('--------------------------------------------------------------------------------------------------------------');
         end 
         opcion = 2;
      else
         angulocortePhi = 100;
         opcion = 2;
       end
 elseif repetir == 2
     disp('--------------------------------------------------------------------------------------------------------------');
     disp('        - ¿Quiere un corte del diagrama en theta?');
     disp('           1. Sí');
     disp('           2. No');
     verifCurvaRepetir = input('        Seleccione: ');
     disp('--------------------------------------------------------------------------------------------------------------');
     if verifCurvaRepetir == 1
        angulocorteTheta = input('        - Ingrese el valor de corte en theta: ');
        disp('--------------------------------------------------------------------------------------------------------------');
        while (angulocorteTheta < -90 ||  angulocorteTheta > 90)
            disp("¡EL VALOR DE CORTE EN PHI NO ES VÁLIDO!"); 
            disp(['       ',num2str(f),' RECUERDE: el valor de corte en theta debe estar entre -90° y 90°.']);
            disp('--------------------------------------------------------------------------------------------------------------');
            angulocorteTheta = input('        - Por favor, ingrese el valor de corte en theta: ');
            disp('--------------------------------------------------------------------------------------------------------------');
        end
        opcion = 2;
     else
        angulocorteTheta = 100;
        opcion = 2;
     end
 end
end