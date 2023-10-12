function [indiceMinimoACasoPhi,indiceMinimoBCasoPhi] = fCondicion1AnchoHazPhi(minimoACasoPhi,minimoBCasoPhi,resultadoRestaCasoPhi)

% �CU�LES M�DULOS USAN LA FUNCI�N fCondicion1AnchoHazPhi?
%   - Es una subfunci�n de fAnchoHaz3DBPlanoXY, por lo que aplica en los  mismos m�dulos que esta �ltima. 

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fCondicion1AnchoHazPhi?
% I.  Aplica la condici�n 1 en el c�lculo del ancho del haz principal (corte en phi)
%     Funciona como una herramienta para calcular correctamente el ancho de
%     haz principal cuando la posici�n del l�bulo principal en phi = 0�

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     minimoACasoPhi, minimoBCasoPhi,resultadoRestaCasoPhi ---------> Par�metros de entrada necesarios para la rutina del ancho de haz principal

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     indiceMinimoACasoPhi ----------------------> Posici�n de nulo m�s cercano a l�bulo principal.
%     indiceMinimoBCasoPhi ----------------------> Posici�n de segundo nulo m�s cercano a l�bulo principal.

% PARTE I: APLICA CONDICI�N 1 DE C�LCULO DE ANCHO DE HAZ PRINCIPAL (CORTE PHI)
if (minimoACasoPhi == minimoBCasoPhi)
        indiceMinimoACasoPhi = find(resultadoRestaCasoPhi == minimoACasoPhi);
        indiceMinimoACasoPhi = indiceMinimoACasoPhi(1);
        indiceMinimoBCasoPhi = find(resultadoRestaCasoPhi == minimoBCasoPhi);
        indiceMinimoBCasoPhi = indiceMinimoBCasoPhi(2);
else
        indiceMinimoACasoPhi = find(resultadoRestaCasoPhi == minimoACasoPhi);
        indiceMinimoBCasoPhi = find(resultadoRestaCasoPhi == minimoBCasoPhi);
end