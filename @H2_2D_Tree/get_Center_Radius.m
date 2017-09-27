%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%                   BLACK BOX FAST MULTIPOLE METHOD 2D                        %
%                             Version 1.0                                     %
%          Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang            %
%          Written for MATLAB by : Ali Rezaei, Fahd Siddiqui                  %
%                                                                             %
% =========================================================================== %
% LICENSE: MOZILLA 2.0                                                        %
%   This Source Code Form is subject to the terms of the Mozilla Public       %
%   License, v. 2.0. If a copy of the MPL was not distributed with this       %
%   file, You can obtain one at http://mozilla.org/MPL/2.0/.                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ center, radius ] = get_Center_Radius( location )
% Computes the center and radius of the circle square containing a set of data
% (locations)
maxX = max(location(: , 1));
maxY = max(location(: , 2));

minX = min(location(: , 1));
minY = min(location(: , 2));

center(1) =	0.5 * (maxX + minX);
center(2) =	0.5 * (maxY + minY);
radius(1) =	0.5 * (maxX - minX);
radius(2) =	0.5 * (maxY - minY);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
