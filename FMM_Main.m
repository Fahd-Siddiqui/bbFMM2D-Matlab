%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all

%% Get Input Data From Files

% Read data from input file
Data            = load('Input/test_input_M.txt');
location   = Data(:,1:2);           % Locations of the charges matrix
charges    = Data(:,3:end);         % Sets of Charges
N          = length(location);      % Number of points (DOF)
m          = size(charges,2);       % Number of charge vectors
nChebNodes = 5;                     % Number of Chebyshev nodes( >= 3)

fprintf('\n Number of charges: %d \n',N);
fprintf('\n Number of sets of charges: %d \n',m);
fprintf('\n Number of Chebyshev Nodes: %d \n', nChebNodes);



%% Fast Matrix Vector Product

% 1 Building FMM Tree
import kernel_Base.Calculate_potential

tic;
ATree = H2_2D_Tree(nChebNodes, charges, location, N, m); % FMM Tree
fprintf('\n Total time taken for FMM(build tree) is: %f  seconds\n', toc);

% 2 Calculating Potential 
tic;
kex1=ExampleKernel1; % Name of custom kernel
potential_kex1 = Calculate_potential(kex1, ATree);
fprintf('\n Total time taken for FMM(calculations) is: %f seconds\n', toc);



%% Exact Matrix Vector Product

% Calculate potential Exact
tic
Q = kex1.kernel_2D(N , location , N , location);
potential_exact = Q * charges;
fprintf('\n Total time taken for Exact(calculations) is: %f seconds\n', toc);
% Error Calculation
fprintf('\n Maximum Error is: %0.3e \n', norm(potential_exact-potential_kex1)/norm(potential_exact));
