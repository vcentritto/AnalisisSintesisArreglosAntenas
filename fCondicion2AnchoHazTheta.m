function [anchoHazDesfasajeAmbosParaTheta] = fCondicion2AnchoHazTheta(mDesfasajeAmbosParaTheta,ordenCasoTheta,resultadoRestaCasoTheta,primerMinimoCasoTheta,factorRestaCasoTheta)

% �CU�LES M�DULOS USAN LA FUNCI�N fCondicion2AnchoHazTheta?
%   - Es una subfunci�n de fAnchoHaz3DBPlanoXY, por lo que aplica en los  mismos m�dulos que esta �ltima. 

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fCondicion2AnchoHazTheta?
% I.  Aplica la condici�n 2 en el c�lculo del ancho del haz principal (corte en theta).
%     Funciona como una herramienta para calcular un tercer nulo adyacente al l�bulo principal, 
%     en caso de que el primer y segundo nulo adyacente no est�n a la izquierda y derecha (o viceversa)
%     del l�bulo principal. 
%     Ayuda a encontrar de forma correcta el ancho de haz principal.

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     mDesfasajeAmbosParaTheta,ordenCasoTheta,primerMinimoCasoTheta,factorRestaCasoTheta ---------> Par�metros de entrada necesarios para la rutina del ancho de haz principal

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     anchoHazDesfasajeAmbosParaTheta -------------> Ancho de haz a - 3 dB (corte theta)

% PARTE I: APLICA CONDICI�N 2 DE C�LCULO DE ANCHO DE HAZ PRINCIPAL (CORTE THETA)
minimoCCasoTheta = ordenCasoTheta(3);
indiceMinimoCCasoTheta = find(resultadoRestaCasoTheta == minimoCCasoTheta);
tercerMinimoCasoTheta = mDesfasajeAmbosParaTheta(indiceMinimoCCasoTheta);
if (primerMinimoCasoTheta > factorRestaCasoTheta && tercerMinimoCasoTheta < factorRestaCasoTheta) || (primerMinimoCasoTheta < factorRestaCasoTheta && tercerMinimoCasoTheta > factorRestaCasoTheta)
    if (primerMinimoCasoTheta >= 0 && tercerMinimoCasoTheta >= 0)||(primerMinimoCasoTheta <= 0 && tercerMinimoCasoTheta <= 0) 
        anchoHazDesfasajeAmbosParaTheta = abs(abs(primerMinimoCasoTheta)-abs(tercerMinimoCasoTheta));
    end
    if (primerMinimoCasoTheta >= 0 && tercerMinimoCasoTheta <= 0)||(primerMinimoCasoTheta <= 0 && tercerMinimoCasoTheta >= 0) 
        anchoHazDesfasajeAmbosParaTheta = abs(primerMinimoCasoTheta)+ abs(tercerMinimoCasoTheta);
    end
else
    anchoHazDesfasajeAmbosParaTheta = 0;
end