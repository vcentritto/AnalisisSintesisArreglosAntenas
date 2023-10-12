function [Fase] = fDesfasajePlanoXY(N,anguloX,anguloY,pTheta,pPhi,d,casoAnalisisoSintesis)

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fDesfasajePlanoXY?
%   - Módulo de Análisis de arreglos en el plano. 
%   - Los siguientes módulos pertenecientes al Módulo de Síntesis de arreglos en el plano:
%      - Módulo de variación de la fase entre elementos para arreglos en el plano.
%      - Módulo de Dolph-Chebyshev Mejorado.

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fDesfasajePlanoXY?
% I. Para módulo de análisis de arreglos en el plano: Se genera la distribución de fases 
%    (matriz)según los datos de entrada ingresados por el usuario (desfasajes en dirección x e y)
% II.Para ambos módulos de síntesis de arreglos en el plano: Se calculan los desfasajes en dirección x e y
%    a partir de las posiciones del lóbulo principal (en theta y phi) ingresadas por el usuario. 
%    Posteriormente, se genera la distribución de fases (matriz).

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     N ---------------------> Número de elementos del arreglo (N = Nx = Ny).
%     d ---------------------> Distancia inter-elemento (d = dx = dy).
%     ánguloX ---------------> Desfasaje entre elementos en dirección "x".
%     ánguloY ---------------> Desfasaje entre elementos en dirección "y".
%     pTheta ----------------> Posición del lóbulo principal en theta.
%     pPhi ------------------> Posición del lóbulo principal en phi.
%     casoAnalisisoSintesis -> Decisión entre módulo de análisis y módulo
%     de síntesis

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     Fase --------> Distribución de fases (matriz con fase de cada excitación del arreglo)

% PARTE I: DISTRIBUCIÓN DE FASE EN PLANO XY -> Para módulo de análisis de arreglos en el plano.
if casoAnalisisoSintesis == 1
    %I.1. Se genera la matriz de fases    
    Fase =  [0];
    % - Se van sumando (algebraicamente) de forma progresiva los desfasajes
    for i = 2:1:N
        Fase(i,1)= Fase(i-1,1)+ anguloY;
    end
    for w = 1:1:N
        valor = Fase(w,1);
        for a = 2:1:N
            Fase(w,a) = valor + anguloX;
            valor = Fase(w,a);
        end
    end
    % - Condición de fases
    for i = 1:1:N
        for w = 1:1:N
            if Fase(i,w) > 360
                Fase(i,w) = Fase(i,w) - 360*floor(Fase(i,w)/360);
            end
            if Fase(i,w) < -360
                Fase(i,w) = Fase(i,w) - 360*(floor(Fase(i,w)/360)+1);
            end
        end
    end    
    % I.2. Se genera matriz de fases (en radianes)
    Fase = Fase.*(pi/180);
    
% PARTE II: CÁLCULO DE DESFASAJES (X e Y)/DISTRIBUCIÓN DE FASE EN PLANO XY -> Para los módulos de síntesis de arreglos en el plano
elseif casoAnalisisoSintesis == 2
    %II.1. Cálculo de desfasajes en dirección x e y.
    pThetaR = pTheta*(pi/180);
    pPhiR = pPhi*(pi/180);
    anguloX = -d*2*pi*sin(pThetaR)*cos(pPhiR);
    anguloY = -d*2*pi*sin(pThetaR)*sin(pPhiR);
    anguloX = anguloX*(180/pi);
    anguloY = anguloY*(180/pi);
    %II.2. Se genera la matriz de fases
    % - Se van sumando (algebraicamente) de forma progresiva los desfasajes
    Fase = zeros(N,N);  
    for i = 2:1:N
        Fase(i,1)= Fase(i-1,1) + anguloY;
    end
    for w = 1:1:N
        valor = Fase(w,1);
        for a = 2:1:N
            Fase(w,a) = valor + anguloX;
            valor = Fase(w,a);
        end
    end
    % - Condición de fases
    for i = 1:1:N
        for w = 1:1:N
            if Fase(i,w) > 360
                Fase(i,w) = Fase(i,w) - 360*floor(Fase(i,w)/360);
            end
            if Fase(i,w) < -360
                Fase(i,w) = Fase(i,w) - 360*(floor(Fase(i,w)/360)+1);
            end
        end
    end    
    % II.3. Se genera matriz de fases (en radianes)
    Fase = Fase.*(pi/180);                  
end
    