function [anchoHazDesfasajeAmbosParaPhi] = fCondicion2AnchoHazPhi(mDesfasajeAmbosParaPhi,ordenCasoPhi,resultadoRestaCasoPhi,primerMinimoCasoPhi,factorRestaCasoPhi)

% �CU�LES M�DULOS USAN LA FUNCI�N fCondicion2AnchoHazPhi?
%   - Es una subfunci�n de fAnchoHaz3DBPlanoXY, por lo que aplica en los  mismos m�dulos que esta �ltima. 

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fCondicion2AnchoHazPhi?
% I.  Aplica la condici�n 2 en el c�lculo del ancho del haz principal (corte en phi).
%     Funciona como una herramienta para calcular un tercer nulo adyacente al l�bulo principal, 
%     en caso de que el primer y segundo nulo adyacente no est�n a la izquierda y derecha (o viceversa)
%     del l�bulo principal. 
%     Ayuda a encontrar de forma correcta el ancho de haz principal.

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     mDesfasajeAmbosParaPhi,ordenCasoPhi,primerMinimoCasoPhi,factorRestaCasoPhi ---------> Par�metros de entrada necesarios para la rutina del ancho de haz principal

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     anchoHazDesfasajeAmbosParaPhi -------------> Ancho de haz a - 3 dB (corte phi)

% PARTE I: APLICA CONDICI�N 2 DE C�LCULO DE ANCHO DE HAZ PRINCIPAL (CORTE PHI)
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