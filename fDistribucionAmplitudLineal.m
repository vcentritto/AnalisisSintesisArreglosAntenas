function [Amplitudes] = fDistribucionAmplitudLineal(N, verif)

% �CU�LES M�DULOS USAN LA FUNCI�N fDistribucionAmplitudLineal?
%   - M�dulo de an�lisis de arreglos lineales. 
%   - M�dulo de variaci�n de la fase entre elementos para arreglos lineales.

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fDistribucionAmplitud?
% I. Para todos los m�dulos: se encuentra la distribuci�n de amplitud (vector) seg�n los datos de 
%    entrada ingresados por el usuario (distribuci�n de amplitud uniforme o no uniforme).
%    La funci�n tiene las siguientes caracter�sticas:
%    - Se genera un vector con distribuci�n de amplitud uniforme 
%    - Se genera un vector con distribuci�n de amplitud no uniforme. Esta  permite: 
%    el ensanchamiento del l�bulo principal en el eje theta, en el eje phi o en el eje theta y eje phi

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     N ---------------------> N�mero de elementos del arreglo (Nx = Ny = Nz).
%     verif -----------------> Decisi�n entre distribuci�n de amplitud uniforme o no uniforme

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     Amplitudes -------> Distribuci�n de amplitud (vector con amplitud de cada excitaci�n del arreglo). 

%S�mbolo
flecha1 = char(8658);
flecha2 = char(8594);
numero0 = char(8320);
circulo = char(8226);

%PARTE I: C�LCULO DE DISTRUBUCI�N DE AMPLITUD (generaci�n de vector de amplitud)-> Para todos los m�dulos que usan esta funci�n
%I.1. Distribuci�n de amplitud uniforme
if verif == 1   
    disp("�IMPORTANTE!"); 
    disp(['       ',num2str(flecha1),' Distribuci�n de amplitud uniforme implica que las ',num2str(N),' excitaciones tienen igual amplitud.']);
    disp(['       ',num2str(flecha1),' En este caso, se estableci� I',num2str(numero0),' = 1.']);
    disp('--------------------------------------------------------------------------------------------------------------');
    Amplitudes = ones(1,N);
%I.2. Distribuci�n de amplitud no uniforme
elseif verif == 2  
    disp("�IMPORTANTE!"); 
    disp(['       ',num2str(flecha1),' Distribuci�n de amplitud no uniforme implica que las ',num2str(N),' excitaciones pueden tener diferente amplitud.']);
    disp(['       ',num2str(flecha1),' En consecuencia, el l�bulo principal se ensancha.']);
    disp('--------------------------------------------------------------------------------------------------------------');   
    disp("�ATENCI�N!"); 
    disp(['       ',num2str(flecha1),' Ahora va a ingresar cada amplitud en un vector de 1x',num2str(N),' elementos.']);
    disp('---------------------------------------------------------------------------------------------------------------');            
    tam = N;
    Amplitudes = ones(1,tam);
    for i = 1:1:tam
        valor = input(['         ',num2str(circulo),' En la posici�n (1,', num2str(i),') ',num2str(flecha2),' ingrese la amplitud: ']);
        disp(' ');
        Amplitudes(1,i) = valor; 
    end
    disp('--------------------------------------------------------------------------------------------------------------');            
    disp(['       ',num2str(flecha1),' El vector resultante es la siguiente: ']);
    disp(' ');
    disp(Amplitudes)
    disp('--------------------------------------------------------------------------------------------------------------');        
 end
    
