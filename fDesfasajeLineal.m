function [Fase,anguloZVariacionFase] = fDesfasajeLineal(N,anguloZ,pTheta,d,casoAnalisisoSintesis)

% �CU�LES M�DULOS USAN LA FUNCI�N fDesfasajeLineal?
%   - M�dulo de An�lisis de arreglos lineales. 
%   - Los siguientes m�dulos pertenecientes al M�dulo de S�ntesis de arreglos lineales:
%      - M�dulo de variaci�n de la fase entre elementos para arreglos lineales.
%      - M�dulo de Dolph-Chebyshev.

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fDesfasajeLineal?
% I. Para m�dulo de an�lisis de arreglos lineales: Se genera la distribuci�n de fases 
%    (vector) seg�n los datos de entrada ingresados por el usuario (desfasaje en direcci�n z)
% II.Para ambos m�dulos de s�ntesis de lineales: Se calcula el desfasaje en direcci�n z
%    a partir de las posici�n del l�bulo principal (en theta) ingresadas por el usuario. 
%    Posteriormente, se genera la distribuci�n de fases (vector).

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     N ---------------------> N�mero de elementos del arreglo (N).
%     d ---------------------> Distancia inter-elemento (d).
%     anguloZ ---------------> Desfasaje entre elementos.
%     pTheta ----------------> Posici�n del l�bulo principal en theta.
%     casoAnalisisoSintesis -> Decisi�n entre an�lisis o s�ntesis (m�todo de variaci�n de fases)

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     Fase --------------------> Distribuci�n de fases (vector con fase de cada excitaci�n del arreglo)
%     anguloZVariacionFase -----> Desfasaje entre elementos obtenido a partir del m�todo de s�ntesis de variaci�n de fases (un �nico valor).

% PARTE I: DISTRIBUCI�N DE FASE -> Para m�dulo de an�lisis de arreglos en el plano.
if casoAnalisisoSintesis == 1
    %I.1. Se genera el vector de fases 
    Fase =  [0];
    for i = 2:1:N
        Fase(i,1)= Fase(i-1,1)+ anguloZ;
    end    
    % I.2. Simplificaci�n de valor de fase (si es menor a 359� o -359�)
    % - Caso Positivo
    for anguloPositivo = 1:N
        while Fase(anguloPositivo) > 359
            Fase(anguloPositivo) = Fase(anguloPositivo) - 360;    
        end
    end
    % - Caso Negativo
    for anguloNegativo = 1:N
        while Fase(anguloNegativo) < -359
            Fase(anguloNegativo) = Fase(anguloNegativo) + 360;    
        end
    end
    % I.3. Se genera vector de fases (en radianes)
    Fase = Fase.*(pi/180);    
   % I.4. Relleno de vector anguloZVariacionFase (se usa en m�dulo de s�ntesis de variaci�n de fase)
    anguloZVariacionFase = 0;
    
% PARTE II: C�LCULO DE DESFASAJES/DISTRIBUCI�N DE FASE -> Para los m�dulos de s�ntesis de arreglos en el plano
elseif casoAnalisisoSintesis == 2
    % II.1. C�lculo de desfasajes en direcci�n z.
    pThetaR = pTheta*(pi/180);
    anguloZVariacionFase = -d*2*pi*cos(pThetaR);
    % II.2. Se genera la matriz de fases    
    Fase = [0];  
    for i = 2:1:N
        Fase(i,1)= Fase(i-1,1) + anguloZVariacionFase;
    end 
    Fase = Fase.*(180/pi);
    % I.3. Simplificaci�n de valor de fase (si es menor a 359� o -359�)
    % - Caso Positivo
     for anguloPositivo = 1:N
        while Fase(anguloPositivo) > 359
            Fase(anguloPositivo) = Fase(anguloPositivo) - 360;    
        end
     end 
    % - Caso Negativo
    for anguloNegativo = 1:N
        while Fase(anguloNegativo) < -359
            Fase(anguloNegativo) = Fase(anguloNegativo) + 360;   
        end
    end
    Fase = Fase.*(pi/180);
    % II.4. Desfasaje en grados.
    anguloZVariacionFase = anguloZVariacionFase*(180/pi);
end