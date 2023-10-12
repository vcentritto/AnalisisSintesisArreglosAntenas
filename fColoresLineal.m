function[colorcurva,colorminimos,colorprincipal,colorsecundarios,coloranchohaz3db] = fColoresLineal

% �CU�LES M�DULOS USAN LA FUNCI�N fColoresLineal?
%   - Todos los m�dulos usados para arreglos lineales

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fColoresLineal?
%   Vectores de colores RGB para graficar el diagrama de radiaci�n y sus
%   caracter�sticas m�s importantes.

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%   La funci�n no necesita par�metros de entrada

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     colorcurva -------------------> Vector de colores RGB para curva 
%                                     en diagrama de radiaci�n.
%     colorminimos -----------------> Vector de colores RGB para nulos 
%                                     en diagrama de radiaci�n.
%     colorprincipal ---------------> Vector de colores RGB para l�bulo 
%                                     principal en diagrama de radiaci�n.
%     colorsecundarios -------------> Vector de colores RGB para m�ximos de
%                                     l�bulo laterales en diagrama de radiaci�n.
%     coloranchohaz3dB -------------> Vector de colores RGB para 
%                                     ancho de haz a -3 dB en diagrama de radiaci�n.

% PARTE I: Color de curva
colorcurva = 1/255*[106,90,205];

% PARTE II: Color de nulos en curva
colorminimos = 1/255*[118 59 73];

% PARTE III: Color de m�ximos de l�bulo principal y de l�bulos secundarios
colorprincipal = 1/255*[219,112,147];
colorsecundarios = 1/255*[190,86,121];

% PARTE IV: Color de ancho de haz a - 3 dB
coloranchohaz3db = 1/255*[219,112,147];
  