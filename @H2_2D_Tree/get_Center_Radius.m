%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ center, radius ] = get_Center_Radius( location )
% Computes the center and radius of the smallest square containing a set of data (locations)  
maxX = max(location(: , 1));
maxY = max(location(: , 2));

minX = min(location(: , 1));
minY = min(location(: , 2));

center(1) =	0.5 * (maxX + minX);
center(2) =	0.5 * (maxY + minY);
radius(1) =	0.5 * (maxX - minX);
radius(2) =	0.5 * (maxY - minY);

end

