%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ T ] = get_Standard_Chebyshev_Polynomials( nCheb, N, x )
% Computes the evaluation of Chebyshev polynomials at their roots

T = ones(N , nCheb);
if(nCheb > 1)
    T(: , 2) = x;
    for k = 3 : nCheb
        T(: , k) = 2.0 * x .* T(: , k - 1) - T(: , k-2);
    end
end

end

