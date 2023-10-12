function [anchoHazDesfasajeAmbosParaPhi] = fCondicion2AnchoHazPhi(mDesfasajeAmbosParaPhi,ordenCasoPhi,resultadoRestaCasoPhi,primerMinimoCasoPhi,factorRestaCasoPhi)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fCondicion2AnchoHazPhi?
%   - Es una subfunción de fAnchoHaz3DBPlanoXY, por lo que aplica en los  mismos módulos que esta última. 

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fCondicion2AnchoHazPhi?
% I.  Aplica la condición 2 en el cálculo del ancho del haz principal (corte en phi).
%     Funciona como una herramienta para calcular un tercer nulo adyacente al lóbulo principal, 
%     en caso de que el primer y segundo nulo adyacente no estén a la izquierda y derecha (o viceversa)
%     del lóbulo principal. 
%     Ayuda a encontrar de forma correcta el ancho de haz principal.

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     mDesfasajeAmbosParaPhi,ordenCasoPhi,primerMinimoCasoPhi,factorRestaCasoPhi ---------> Parámetros de entrada necesarios para la rutina del ancho de haz principal

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     anchoHazDesfasajeAmbosParaPhi -------------> Ancho de haz a - 3 dB (corte phi)

% PARTE I: APLICA CONDICIÓN 2 DE CÁLCULO DE ANCHO DE HAZ PRINCIPAL (CORTE PHI)
minimoCCasoPhi = ordenCasoPhi(3);
indiceMinimoCCasoPhi = find(resultadoRestaCasoPhi == minimoCCasoPhi);
tercerMinimoCasoPhi = mDesfasajeAmbosParaPhi(indiceMinimoCCasoPhi);
if (primerMinimoCasoPhi > factorRestaCasoPhi && tercerMinimoCasoPhi < factorRestaCasoPhi) || (primerMinimoCasoPhi < factorRestaCasoPhi && tercerMinimoCasoPhi > factorRestaCasoPhi)
    if (primerMinimoCasoPhi >= 0 && tercerMinimoCasoPhi >= 0)||(primerMinimoCasoPhi <= 0 && tercerMinimoCasoPhi <= 0) 
        anchoHazDesfasajeAmbosParaPhi = abs(abs(primerMinimoCasoPhi)-abs(tercerMinimoCasoPhi));
    end
    if (primerMinimoCasoPhi >= 0 && tercerMinimoCasoPhi <= 0)||(primerMinimoCasoPhi <= 0 && tercerMinimoCasoPhi >= 0) 
        anchoHazDesfasajeAmbosParaPhi = abs(primerMinimoCasoPhi)+ abs(tercerMinimoCasoPhi);
    end
else
    anchoHazDesfasajeAmbosParaPhi = 0;
end