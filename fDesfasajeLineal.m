function [Fase,anguloZVariacionFase] = fDesfasajeLineal(N,anguloZ,pTheta,d,casoAnalisisoSintesis)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fDesfasajeLineal?
%   - Módulo de Análisis de arreglos lineales. 
%   - Los siguientes módulos pertenecientes al Módulo de Síntesis de arreglos lineales:
%      - Módulo de variación de la fase entre elementos para arreglos lineales.
%      - Módulo de Dolph-Chebyshev.

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fDesfasajeLineal?
% I. Para módulo de análisis de arreglos lineales: Se genera la distribución de fases 
%    (vector) según los datos de entrada ingresados por el usuario (desfasaje en dirección z)
% II.Para ambos módulos de síntesis de lineales: Se calcula el desfasaje en dirección z
%    a partir de las posición del lóbulo principal (en theta) ingresadas por el usuario. 
%    Posteriormente, se genera la distribución de fases (vector).

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     N ---------------------> Número de elementos del arreglo (N).
%     d ---------------------> Distancia inter-elemento (d).
%     anguloZ ---------------> Desfasaje entre elementos.
%     pTheta ----------------> Posición del lóbulo principal en theta.
%     casoAnalisisoSintesis -> Decisión entre análisis o síntesis (método de variación de fases)

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     Fase --------------------> Distribución de fases (vector con fase de cada excitación del arreglo)
%     anguloZVariacionFase -----> Desfasaje entre elementos obtenido a partir del método de síntesis de variación de fases (un único valor).

% PARTE I: DISTRIBUCIÓN DE FASE -> Para módulo de análisis de arreglos en el plano.
if casoAnalisisoSintesis == 1
    %I.1. Se genera el vector de fases 
    Fase =  [0];
    for i = 2:1:N
        Fase(i,1)= Fase(i-1,1)+ anguloZ;
    end    
    % I.2. Simplificación de valor de fase (si es menor a 359° o -359°)
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
   % I.4. Relleno de vector anguloZVariacionFase (se usa en módulo de síntesis de variación de fase)
    anguloZVariacionFase = 0;
    
% PARTE II: CÁLCULO DE DESFASAJES/DISTRIBUCIÓN DE FASE -> Para los módulos de síntesis de arreglos en el plano
elseif casoAnalisisoSintesis == 2
    % II.1. Cálculo de desfasajes en dirección z.
    pThetaR = pTheta*(pi/180);
    anguloZVariacionFase = -d*2*pi*cos(pThetaR);
    % II.2. Se genera la matriz de fases    
    Fase = [0];  
    for i = 2:1:N
        Fase(i,1)= Fase(i-1,1) + anguloZVariacionFase;
    end 
    Fase = Fase.*(180/pi);
    % I.3. Simplificación de valor de fase (si es menor a 359° o -359°)
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