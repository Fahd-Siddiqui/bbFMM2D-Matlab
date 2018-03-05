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
clc
clear all
close all
addpath .

%% GET INPUT DATA FROM DATA FILES ------------------------------------------- %
% Read data from input file
Data       = load('Input/input.txt');
location   = Data(:,1:2);           % Locations of the charges matrix
charges    = Data(:,3:end);         % Sets of Charges
N          = length(location);      % Number of points (DOF)
m          = size(charges,2);       % Number of charge vectors
nChebNodes = 5;                     % Number of Chebyshev nodes( >= 3)

fprintf('\n Number of charges: %d ',N);
fprintf('\n Number of sets of charges: %d ',m);
fprintf('\n Number of Chebyshev Nodes: %d ', nChebNodes);



%% FAST MATRIX VECTOR PRODUCT ----------------------------------------------- %
% 1 Building FMM Tree
tic;
ATree = H2_2D_Tree(nChebNodes, location, N, m); % FMM Tree
fprintf('\n Total time taken for FMM(build tree) is: %f  seconds', toc);


% 2 Calculating Potential
tic;
kex1=ExampleKernel1; % Name of custom kernel
potential_kex1 = kernel_Base.calculate_Potential(kex1, ATree, charges);
fprintf('\n Total time taken for FMM(calculations) is: %f seconds', toc);


%% EXACT MATRIX VECTOR PRODUCT ---------------------------------------------- %
% Calculate potential Exact
tic
fprintf('\n\n Starting exact computation...');
Q = kex1.kernel_2D(N , location , N , location);
potential_exact = Q * charges;
fprintf(' Done.');
fprintf('\n Total time taken for Exact(calculations) is: %f seconds', toc);
% Error Calculation
fprintf('\n Maximum Error is: %0.3e \n', ...
               norm(potential_exact-potential_kex1)/norm(potential_exact));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

