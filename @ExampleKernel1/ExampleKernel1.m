%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef ExampleKernel1 < handle % Rename the class to 
% Kernel definition used to compute the potential
% Make copies of this file if computations with multiple kernels are desired

    methods (Static)
        function [kernel] = kernel_2D(M,x,N,y) % Do not change this name
            kernel	= zeros(M,N);
            for i= 1 : M
                for j= 1 : N
                    % Define the custom kernel function
                    kernel(i , j) = sqrt((x(i , 1) - y(j , 1)) .^ 2 + (x(i , 2) - y(j , 2)) .^2 );
                end
            end
        end
    end
    
    
end

