function [directividad] = fDirectividadPlano(N,d,matrizExcitaciones)
% �CU�LES M�DULOS USAN LA FUNCI�N fDirectividadPlano?
%   - M�dulo de An�lisis de arreglos en el plano. 
%   - Los siguientes m�dulos pertenecientes al M�dulo de S�ntesis de arreglos en el plano:
%      - M�dulo de variaci�n de la fase entre elementos para arreglos en el plano.
%      - M�dulo de Dolph-Chebyshev Mejorado.

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fFactorDeArregloPlanoXY?
% I. Para todos los m�dulos: se calcula la directividad del arreglo en el plano xy.

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     N ------------------> N�mero de elementos del arreglo (N = Nx = Ny).
%     d ------------------> Distancia inter-elemento (d = dx = dy) .
%     matrizExcitaciones -> Matriz con la excitaci�n Amplitud-Fase de cada elemento.

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     directividad ------> Directividad m�xima del arreglo en el plano.


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

