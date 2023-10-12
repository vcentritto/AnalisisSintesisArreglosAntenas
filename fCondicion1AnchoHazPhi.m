function [indiceMinimoACasoPhi,indiceMinimoBCasoPhi] = fCondicion1AnchoHazPhi(minimoACasoPhi,minimoBCasoPhi,resultadoRestaCasoPhi)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fCondicion1AnchoHazPhi?
%   - Es una subfunción de fAnchoHaz3DBPlanoXY, por lo que aplica en los  mismos módulos que esta última. 

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fCondicion1AnchoHazPhi?
% I.  Aplica la condición 1 en el cálculo del ancho del haz principal (corte en phi)
%     Funciona como una herramienta para calcular correctamente el ancho de
%     haz principal cuando la posición del lóbulo principal en phi = 0°

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     minimoACasoPhi, minimoBCasoPhi,resultadoRestaCasoPhi ---------> Parámetros de entrada necesarios para la rutina del ancho de haz principal

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     indiceMinimoACasoPhi ----------------------> Posición de nulo más cercano a lóbulo principal.
%     indiceMinimoBCasoPhi ----------------------> Posición de segundo nulo más cercano a lóbulo principal.

% PARTE I: APLICA CONDICIÓN 1 DE CÁLCULO DE ANCHO DE HAZ PRINCIPAL (CORTE PHI)
if (minimoACasoPhi == minimoBCasoPhi)
        indiceMinimoACasoPhi = find(resultadoRestaCasoPhi == minimoACasoPhi);
        indiceMinimoACasoPhi = indiceMinimoACasoPhi(1);
        indiceMinimoBCasoPhi = find(resultadoRestaCasoPhi == minimoBCasoPhi);
        indiceMinimoBCasoPhi = indiceMinimoBCasoPhi(2);
else
        indiceMinimoACasoPhi = find(resultadoRestaCasoPhi == minimoACasoPhi);
        indiceMinimoBCasoPhi = find(resultadoRestaCasoPhi == minimoBCasoPhi);
end