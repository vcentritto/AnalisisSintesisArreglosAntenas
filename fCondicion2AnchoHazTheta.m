function [anchoHazDesfasajeAmbosParaTheta] = fCondicion2AnchoHazTheta(mDesfasajeAmbosParaTheta,ordenCasoTheta,resultadoRestaCasoTheta,primerMinimoCasoTheta,factorRestaCasoTheta)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fCondicion2AnchoHazTheta?
%   - Es una subfunción de fAnchoHaz3DBPlanoXY, por lo que aplica en los  mismos módulos que esta última. 

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fCondicion2AnchoHazTheta?
% I.  Aplica la condición 2 en el cálculo del ancho del haz principal (corte en theta).
%     Funciona como una herramienta para calcular un tercer nulo adyacente al lóbulo principal, 
%     en caso de que el primer y segundo nulo adyacente no estén a la izquierda y derecha (o viceversa)
%     del lóbulo principal. 
%     Ayuda a encontrar de forma correcta el ancho de haz principal.

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     mDesfasajeAmbosParaTheta,ordenCasoTheta,primerMinimoCasoTheta,factorRestaCasoTheta ---------> Parámetros de entrada necesarios para la rutina del ancho de haz principal

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     anchoHazDesfasajeAmbosParaTheta -------------> Ancho de haz a - 3 dB (corte theta)

% PARTE I: APLICA CONDICIÓN 2 DE CÁLCULO DE ANCHO DE HAZ PRINCIPAL (CORTE THETA)
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