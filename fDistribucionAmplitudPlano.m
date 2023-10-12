function [Amplitudes] = fDistribucionAmplitudPlano(N, verif)

% �CU�LES M�DULOS USAN LA FUNCI�N fDistribucionAmplitudPlano?
%   - M�dulo de An�lisis de arreglos en el plano. 
%   - M�dulo de S�ntesis de variaci�n de la fase entre elementos para arreglos en el plano.

% �QU� SE PUEDE ENCONTRAR EN LA FUNCI�N fDistribucionAmplitud?
% I. Para todos los m�dulos: se encuentra la distribuci�n de amplitud (matriz) seg�n los datos de 
%    entrada ingresados por el usuario (distribuci�n de amplitud uniforme o no uniforme).
%    La funci�n tiene las siguientes caracter�sticas:
%    - Se genera una matriz con distribuci�n de amplitud uniforme 
%    - Se genera una matriz con distribuci�n de amplitud no uniforme. Esta  permite: 
%    el ensanchamiento del l�bulo principal en el eje theta, en el eje phi o en el eje theta y eje phi

% �CU�LES SON LOS PAR�METROS DE ENTRADA? 
%     N ---------------------> N�mero de elementos del arreglo (Nx = Ny = Nz).
%     verif -----------------> Decisi�n entre distribuci�n de amplitud uniforme o no uniforme

% �CU�LES SON LOS PAR�METROS DE SALIDA? 
%     Amplitudes ------> Distribuci�n de amplitud (matriz con amplitud de cada excitaci�n del arreglo). 

%S�mbolo
flecha1 = char(8658);
flecha2 = char(8594);
circulo = char(8226);
numero0 = char(8320);
       
%PARTE I: C�LCULO DE DISTRUBUCI�N DE AMPLITUD (generaci�n de matriz de amplitud)-> Para todos los m�dulos que usan esta funci�n
%I.1. Distribuci�n de amplitud uniforme
totalExc = N*N;
if verif == 1     
    disp("�IMPORTANTE!"); 
    disp(['       ',num2str(flecha1),' La distribuci�n de amplitud uniforme implica que las ',num2str(totalExc),' excitaciones tienen igual amplitud.']);
    disp(['       ',num2str(flecha1),' En este caso, se estableci� I',num2str(numero0),' = 1.']);
    disp('--------------------------------------------------------------------------------------------------------------');
    Amplitudes = ones(N,N);
%I.2. Distribuci�n de amplitud no uniforme
elseif verif == 2 
    disp("�IMPORTANTE!"); 
    disp(['       ',num2str(flecha1),' Distribuci�n de amplitud no uniforme implica que las ',num2str(totalExc),' excitaciones pueden tener diferente amplitud.']);
    disp(['       ',num2str(flecha1),' En consecuencia, el l�bulo principal se ensancha.']);
    tam = N;
    Amplitudes = ones(N,N);
    ciclo = 1;
    %Se definen las opciones 
    while ciclo == 1
        disp('-------------------------------------------------------------------------------------------------------------');
        disp("�ATENCI�N!"); 
        disp(['       ',num2str(flecha1),' Ahora va a ingresar la distribuci�n de amplitud en una matriz de ',num2str(N),'x',num2str(N),' elementos.']);
        disp('---------------------------------------------------------------------------------------------------------------');            
        disp(['       ',num2str(flecha1),' Tiene las siguientes opciones: ']);
        disp('          1. Ingresar las amplitudes por fila.')
        disp('          2. Ingresar las amplitudes por columna.')
        disp('          3. Ingresar cada amplitud en la matriz (una a una).')
        cam = input('        Seleccione: ');
        disp('--------------------------------------------------------------------------------------------------------------');            
        %I.2.1. Amplitudes por fila
        if cam == 1
            Amplitudes = ones(tam,tam);
            for i = 1:1:tam
                valor = input(['         ',num2str(circulo),' En la fila ',num2str(i),' ',num2str(flecha2),' ingrese la amplitud: ']);
                disp(' ');
                Amplitudes(i,:) = valor; 
            end
            disp('--------------------------------------------------------------------------------------------------------------');            
            disp(['       ',num2str(flecha1),' La matriz resultante es la siguiente: ']);
            disp(' ');
            disp(Amplitudes);
            disp('--------------------------------------------------------------------------------------------------------------');
            ciclo = 2;
        %I.2.2. Amplitudes por columna
        elseif cam == 2
            for i = 1:1:tam
                valor = input(['         ',num2str(circulo),' En la columna ',num2str(i),' ',num2str(flecha2),' ingrese la amplitud: ']);
                Amplitudes(:,i) = valor; 
                disp(' ');
            end  
            disp('--------------------------------------------------------------------------------------------------------------');            
            disp(['       ',num2str(flecha1),' La matriz resultante es la siguiente: ']);
            disp(Amplitudes);
            disp(' ');
            disp('--------------------------------------------------------------------------------------------------------------');  
            ciclo = 2;
         %I.2.3. Amplitud una a una en matriz                  
         elseif cam == 3
          for i = 1:1:tam
            for j = 1:1:tam
                valor = input(['         ',num2str(circulo),' En la posici�n (',num2str(i),',',num2str(j),') ',num2str(flecha2),' ingrese la amplitud: ']);
                disp(' ');
                Amplitudes(i,j) = valor; 
            end
          end
         disp('--------------------------------------------------------------------------------------------------------------');            
         disp(['       ',num2str(flecha1),' La matriz resultante es la siguiente: ']);
         disp(' ');
         disp(Amplitudes)
         disp('--------------------------------------------------------------------------------------------------------------');  
         ciclo = 2;
         %I.2.4. Opci�n incorrecta 
         else
            disp("�IMPORTANTE!"); 
            disp(['       ',num2str(flecha1),' Ingres� una opci�n que NO es v�lida.'])
            disp(['       ',num2str(flecha1),' Debe intentar de nuevo.'])
        end
    end
end

