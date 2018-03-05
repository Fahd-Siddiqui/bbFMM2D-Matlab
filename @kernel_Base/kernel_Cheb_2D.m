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
function [K] = kernel_Cheb_2D(obj, M,xVec,N,yVec)
% Evaluate kernel at Chebyshev nodes
% mbym = [];
% nbyn = [];
% 
% for j= 1 : M
%     for i= 1 : M
%         mbym = [mbym ; xVec(i , 1) , xVec(j , 2)];
%     end
% end
% 
% 
% for j= 1 : N
%     for i= 1 : N
%          nbyn = [nbyn ; yVec(i , 1) , yVec(j , 2)];
%     end
% end
% 
%  K = obj.kernel_2D(M * M , mbym , N * N , nbyn);
%  
 
%mbym=zeros(M*M,2);
%nbyn=zeros(N*N,2);


% for i= 1:M:M*M
%     mbym(i: i + M-1, 1) = xVec(1: M, 1);
%     mbym(i: i + M-1, 2) = xVec((i-1) / M+1, 2);
% end
% 
% for i=1:N: N * N
%     nbyn(i: i + N-1, 1) = yVec(1: N, 1);
%     nbyn(i: i + N-1, 2) = yVec((i-1) / N+1, 2);
% end


mbym=combvec(xVec(:,1)',xVec(:,2)')';
nbyn=combvec(yVec(:,1)',yVec(:,2)')';
K = obj.kernel_2D(M * M , mbym , N * N , nbyn);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
