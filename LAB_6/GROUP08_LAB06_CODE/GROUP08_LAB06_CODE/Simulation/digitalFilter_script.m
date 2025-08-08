%------------------------------------
%-- Group 8 - Laboratory 6
%-- Simple digital filter
%-- MATLAB script for reference model of the digital filter
%------------------------------------
% 
% 

MEM_A = randi([-128, 127], 1, 1024, 'int8'); % Initialize input samples  
MEM_B = zeros(1, 1024, 'int16');             % Initialize storage for filtered output  

coeff = [-0.5, -2, 4, 0.25]; % Filter coefficients  

% Compute first three output values separately  
X0 = double(MEM_A(1));  
MEM_B(1) = int8(max(min(coeff(1) * X0, 127), -128));  

X1 = double(MEM_A(2));  
MEM_B(2) = int8(max(min(coeff(1) * X1 + coeff(2) * X0, 127), -128));  

X2 = double(MEM_A(3));  
MEM_B(3) = int8(max(min(coeff(1) * X2 + coeff(2) * X1 + coeff(3) * X0, 127), -128));  

% Apply filtering from index 3 onward  
for n = 4:1024  
    X0 = double(MEM_A(n));  
    X1 = double(MEM_A(n-1));  
    X2 = double(MEM_A(n-2));  
    X3 = double(MEM_A(n-3));  
    
    Y = coeff(1) * X0 + coeff(2) * X1 + coeff(3) * X2 + coeff(4) * X3;  
    Y = max(min(Y, 127), -128); % Saturate result to 8-bit range  
    MEM_B(n) = int8(Y);  
end  

disp('Filtered output (MEM_B):');  
disp(MEM_B);  