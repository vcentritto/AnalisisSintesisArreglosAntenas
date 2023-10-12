function [Excitaciones,fc] = fArregloCanonico(nulos,d1,d2)
% Función encargada de asignar tres pares de nulos a variables
% Parámetros de entrada son: 
%     nulos -----------------------------------> Coordenadas de los nulos (Eje Theta y Phi)

% Retorna los valores de:
%     Excitaciones ----------------------------> Son las excitaciones para
%                                                3 nulos
%     fc --------------------------------------> Factor de arreglo para los nulos

nulo1Theta = nulos(1,1);
nulo1Phi = nulos(1,2);
nulo2Theta = nulos(2,1);
nulo2Phi = nulos(2,2);
nulo3Theta = nulos(3,1);
nulo3Phi = nulos(3,2);

theta1 = nulo1Theta*(pi/180);
theta2 = nulo2Theta*(pi/180);
theta3 = nulo3Theta*(pi/180);

phi1 = nulo1Phi*(pi/180);
phi2 = nulo2Phi*(pi/180);
phi3 = nulo3Phi*(pi/180);

% Sistema
kd1 = 2*pi*d1;
kd2 = 2*pi*d2;
fi1 = 0;
fi2 = pi/2;
A = [exp(j*kd2*sin(theta1)*cos(phi1-fi2)) exp(-j*kd1*sin(theta1)*cos(phi1-fi1)) exp(-j*kd2*sin(theta1)*cos(phi1-(fi2)))
    exp(j*kd2*sin(theta2)*cos(phi2-(fi2))) exp(-j*kd1*sin(theta2)*cos(phi2-fi1)) exp(-j*kd2*sin(theta2)*cos(phi2-(fi2))) 
    exp(j*kd2*sin(theta3)*cos(phi3-(fi2))) exp(-j*kd1*sin(theta3)*cos(phi3-fi1)) exp(-j*kd2*sin(theta3)*cos(phi3-(fi2)))];

B = [-exp(j*kd1*sin(theta1)*cos(phi1-fi1)) 
    -exp(j*kd1*sin(theta2)*cos(phi2-fi1)) 
    -exp(j*kd1*sin(theta3)*cos(phi3-fi1)) ];

X = inv(A)*B;
Mag = abs(X);
Fas = angle(X)*(180/pi);

a1 = 1;

a2 = Mag(1)*exp(j*Fas(1)*(pi/180));

a3 = Mag(2)*exp(j*Fas(2)*(pi/180));

a4 = Mag(3)*exp(j*Fas(3)*(pi/180));

Excitaciones = [a1 a2 a3 a4];
[theta,phi] = meshgrid(-pi/2:1/100:pi/2);
fcp = a1*exp(j*kd1.*sin(theta).*cos(phi))+a2*exp(j*kd2.*sin(theta).*sin(phi))+a3*exp(-j*kd1.*sin(theta).*cos(phi))+a4*exp(-j*kd2.*sin(theta).*sin(phi));
valorMaximo = max(max(fcp));
matrizNormalizada = zeros(length(fcp),length(fcp));
for i = 1:length(fcp)
    for r = 1: length(fcp)
        matrizNormalizada(i,r) = fcp(i,r)/valorMaximo;   
    end
end
fc = matrizNormalizada;
