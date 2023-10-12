function [Fase] = fDesfasajePlanoXY(N,anguloX,anguloY,pTheta,pPhi,d,casoAnalisisoSintesis)

% �CU�LES M�DULOS USAN LA FUNCI�N fDesfasajePlanoXY?
%   - M�dulo de An�lisis de arreglos en el plano. 
%   - Los siguientes m�dulos pertenecientes al M�dulo de S�ntesis de arreglos en el plano:
%      - M�dulo de variaci�n de la fase entre elementos para arreglos en el plano.
%      - M�dulo de Dolph-Chebyshev Mejorado.

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fDesfasajePlanoXY?
% I. Para m�dulo de an�lisis de arreglos en el plano: Se genera la distribuci�n de fases 
%    (matriz)seg�n los datos de entrada ingresados por el usuario (desfasajes en direcci�n x e y)
% II.Para ambos m�dulos de s�ntesis de arreglos en el plano: Se calculan los desfasajes en direcci�n x e y
%    a partir de las posiciones del l�bulo principal (en theta y phi) ingresadas por el usuario. 
%    Posteriormente, se genera la distribuci�n de fases (matriz).

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     N ---------------------> N�mero de elementos del arreglo (N = Nx = Ny).
%     d ---------------------> Distancia inter-elemento (d = dx = dy).
%     �nguloX ---------------> Desfasaje entre elementos en direcci�n "x".
%     �nguloY ---------------> Desfasaje entre elementos en direcci�n "y".
%     pTheta ----------------> Posici�n del l�bulo principal en theta.
%     pPhi ------------------> Posici�n del l�bulo principal en phi.
%     casoAnalisisoSintesis -> Decisi�n entre m�dulo de an�lisis y m�dulo
%     de s�ntesis

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     Fase --------> Distribuci�n de fases (matriz con fase de cada excitaci�n del arreglo)

% PARTE I: DISTRIBUCI�N DE FASE EN PLANO XY -> Para m�dulo de an�lisis de arreglos en el plano.
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
    % - Condici�n de fases
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
    
% PARTE II: C�LCULO DE DESFASAJES (X e Y)/DISTRIBUCI�N DE FASE EN PLANO XY -> Para los m�dulos de s�ntesis de arreglos en el plano
elseif casoAnalisisoSintesis == 2
    %II.1. C�lculo de desfasajes en direcci�n x e y.
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
    % - Condici�n de fases
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
    