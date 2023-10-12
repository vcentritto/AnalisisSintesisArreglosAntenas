function[colorcurva,colorminimos,colorprincipal,colorsecundarios,coloranchohaz3db] = fColoresLineal

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fColoresLineal?
%   - Todos los módulos usados para arreglos lineales

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fColoresLineal?
%   Vectores de colores RGB para graficar el diagrama de radiación y sus
%   características más importantes.

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%   La función no necesita parámetros de entrada

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     colorcurva -------------------> Vector de colores RGB para curva 
%                                     en diagrama de radiación.
%     colorminimos -----------------> Vector de colores RGB para nulos 
%                                     en diagrama de radiación.
%     colorprincipal ---------------> Vector de colores RGB para lóbulo 
%                                     principal en diagrama de radiación.
%     colorsecundarios -------------> Vector de colores RGB para máximos de
%                                     lóbulo laterales en diagrama de radiación.
%     coloranchohaz3dB -------------> Vector de colores RGB para 
%                                     ancho de haz a -3 dB en diagrama de radiación.

% PARTE I: Color de curva
colorcurva = 1/255*[106,90,205];

% PARTE II: Color de nulos en curva
colorminimos = 1/255*[118 59 73];

% PARTE III: Color de máximos de lóbulo principal y de lóbulos secundarios
colorprincipal = 1/255*[219,112,147];
colorsecundarios = 1/255*[190,86,121];

% PARTE IV: Color de ancho de haz a - 3 dB
coloranchohaz3db = 1/255*[219,112,147];
  