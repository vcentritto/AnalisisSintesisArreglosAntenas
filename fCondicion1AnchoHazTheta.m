function [indiceMinimoACasoTheta,indiceMinimoBCasoTheta] = fCondicion1AnchoHazTheta(minimoACasoTheta,minimoBCasoTheta,resultadoRestaCasoTheta)

% �CU�LES M�DULOS USAN LA FUNCI�N fCondicion1AnchoHazTheta?
%   - Es una subfunci�n de fAnchoHaz3DBPlanoXY, por lo que aplica en los  mismos m�dulos que esta �ltima. 

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fCondicion1AnchoHazTheta?
% I.  Aplica la condici�n 1 en el c�lculo del ancho del haz principal (corte en theta)
%     Funciona como una herramienta para calcular correctamente el ancho de
%     haz principal cuando la posici�n del l�bulo principal en phi = 0�

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     minimoACasoTheta, minimoBCasoTheta,resultadoRestaCasoTheta ---------> Par�metros de entrada necesarios para la rutina del ancho de haz principal

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     indiceMinimoACasoTheta ----------------------> Posici�n de nulo m�s cercano a l�bulo principal.
%     indiceMinimoBCasoTheta ----------------------> Posici�n de segundo nulo m�s cercano a l�bulo principal.

% PARTE I: APLICA CONDICI�N 1 DE C�LCULO DE ANCHO DE HAZ PRINCIPAL (CORTE THETA)
if (minimoACasoTheta == minimoBCasoTheta)
        indiceMinimoACasoTheta = find(resultadoRestaCasoTheta == minimoACasoTheta);
        indiceMinimoACasoTheta = indiceMinimoACasoTheta(1);
        indiceMinimoBCasoTheta = find(resultadoRestaCasoTheta == minimoBCasoTheta);
        indiceMinimoBCasoTheta = indiceMinimoBCasoTheta(2);
else
        indiceMinimoACasoTheta = find(resultadoRestaCasoTheta == minimoACasoTheta);
        indiceMinimoBCasoTheta = find(resultadoRestaCasoTheta == minimoBCasoTheta);
end