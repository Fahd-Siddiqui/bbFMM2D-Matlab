%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%                   BLACK BOX FAST MULTIPOLE METHOD 2D                        %
%                             Version 1.0                                     %
%          Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang            %
%          Written for MATLAB by : Ali Rezaei, Fahd Siddiqui                  %
%           https://github.com/DrFahdSiddiqui/bbFMM2D-Matlab                  %
%                                                                             %
% =========================================================================== %
% LICENSE: MOZILLA 2.0                                                        %
%   This Source Code Form is subject to the terms of the Mozilla Public       %
%   License, v. 2.0. If a copy of the MPL was not distributed with this       %
%   file, You can obtain one at http://mozilla.org/MPL/2.0/.                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef ExampleKernel2 <handle 
% Class for defining the custom kernel function used to compute the
% potential. Make copies of this file and define other such classes if
% computations with multiple kernels are desired.

    methods (Static)
        function [kernel] = kernel_2D(~,x,~,y) % Do not change this name
            % Euclidean norm kernel. Implemented using meshgrid.
            [i1,j1] = meshgrid(x(:,1),y(:,1));
            [i2,j2] = meshgrid(x(:,2),y(:,2));
            kernel = sqrt( (i1 - j1) .^ 2 + (i2 - j2) .^2 );
        end
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
