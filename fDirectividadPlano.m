function [directividad] = fDirectividadPlano(N,d,matrizExcitaciones)
% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fDirectividadPlano?
%   - Módulo de Análisis de arreglos en el plano. 
%   - Los siguientes módulos pertenecientes al Módulo de Síntesis de arreglos en el plano:
%      - Módulo de variación de la fase entre elementos para arreglos en el plano.
%      - Módulo de Dolph-Chebyshev Mejorado.

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fFactorDeArregloPlanoXY?
% I. Para todos los módulos: se calcula la directividad del arreglo en el plano xy.

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%     N ------------------> Número de elementos del arreglo (N = Nx = Ny).
%     d ------------------> Distancia inter-elemento (d = dx = dy) .
%     matrizExcitaciones -> Matriz con la excitación Amplitud-Fase de cada elemento.

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     directividad ------> Directividad máxima del arreglo en el plano.


tita = 0:(1/100):pi;        
phi = 0:(1/100):2*pi;    


[TITA,PHI] = meshgrid(tita,phi);                
factorx=sin(TITA).*cos(PHI);
factory=sin(TITA).*sin(PHI);

dtita=0.01;
dphi=0.01;

AF = zeros(1,1);    


for m = 1:1:N
   for n = 1:1:N
       AF = (matrizExcitaciones(m,n)*exp(j*2*pi*(n-1)*d*(factorx)).*exp(j*2*pi*(m-1)*d*(factory))) + AF;    
   end
end 

Prad=sum(sum(abs(AF).^2.*sin(tita)*dtita*dphi));
directividad = 4*pi*max(max(abs(AF).^2))/Prad;


end

