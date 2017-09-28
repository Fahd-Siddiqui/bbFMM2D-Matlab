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

function assign_Cousin(node , neighborNumber)
% Assigns cousins to children of the node  

if neighborNumber == 1 && ~node.neighbor(1).isEmpty
    %% Assigning cousins and neighbor to NeighborNumber # 1 child # 1.
    node.child(1).interaction(node.child(1).nInteraction+1) = node.neighbor(1).child(1);
    node.child(1).interaction(node.child(1).nInteraction+2) = node.neighbor(1).child(2);
    node.child(1).interaction(node.child(1).nInteraction+3) = node.neighbor(1).child(3);
    node.child(1).neighbor(1) =	node.neighbor(1).child(4);
    node.child(1).nInteraction = node.child(1).nInteraction + 3;
    node.child(1).nNeighbor    = node.child(1).nNeighbor + 1;
        
    %% Assigning cousins and neighbor to NeighborNumber # 1 child # 2.
    node.child(2).nInteraction = node.child(2).nInteraction + 1;
    node.child(2).interaction(node.child(2).nInteraction) =	node.neighbor(1).child(1);
    node.child(2).nInteraction = node.child(2).nInteraction + 1;
    node.child(2).interaction(node.child(2).nInteraction) =	node.neighbor(1).child(2);
    node.child(2).nInteraction = node.child(2).nInteraction + 1;
    node.child(2).interaction(node.child(2).nInteraction) =	node.neighbor(1).child(3);
    node.child(2).nInteraction = node.child(2).nInteraction + 1;
    node.child(2).interaction(node.child(2).nInteraction) =	node.neighbor(1).child(4);

    %% Assigning cousins and neighbor to NeighborNumber # 1 child # 3.
    node.child(3).nInteraction = node.child(3).nInteraction + 1;
    node.child(3).interaction(node.child(3).nInteraction) =	node.neighbor(1).child(1);
    node.child(3).nInteraction = node.child(3).nInteraction + 1;
    node.child(3).interaction(node.child(3).nInteraction) =	node.neighbor(1).child(2);
    node.child(3).nInteraction = node.child(3).nInteraction + 1;
    node.child(3).interaction(node.child(3).nInteraction) =	node.neighbor(1).child(3);
    node.child(3).nInteraction = node.child(3).nInteraction + 1;
    node.child(3).interaction(node.child(3).nInteraction) =	node.neighbor(1).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 1 child # 4. 
    node.child(4).nInteraction = node.child(4).nInteraction + 1;
    node.child(4).interaction(node.child(4).nInteraction) = node.neighbor(1).child(1);
    node.child(4).nInteraction = node.child(4).nInteraction + 1;
    node.child(4).interaction(node.child(4).nInteraction) = node.neighbor(1).child(2);
    node.child(4).nInteraction = node.child(4).nInteraction + 1;
    node.child(4).interaction(node.child(4).nInteraction) = node.neighbor(1).child(3);
    node.child(4).nInteraction = node.child(4).nInteraction + 1;
    node.child(4).interaction(node.child(4).nInteraction) = node.neighbor(1).child(4);
    
    
elseif(neighborNumber==2 && ~node.neighbor(2).isEmpty )
    %% Assigning cousins and neighbor to NeighborNumber # 2 child # 1. 
    node.child(1).nInteraction = node.child(1).nInteraction + 1;
    node.child(1).interaction(node.child(1).nInteraction) = node.neighbor(2).child(1);
    node.child(1).nInteraction = node.child(1).nInteraction + 1;
    node.child(1).interaction(node.child(1).nInteraction) = node.neighbor(2).child(2);
    node.child(1).neighbor(2)					=	node.neighbor(2).child(3);
    node.child(1).neighbor(3)					=	node.neighbor(2).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 2 child # 2.
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(2).child(1);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(2).child(2);
    node.child(2).neighbor(1)					=	node.neighbor(2).child(3);
    node.child(2).neighbor(2)					=	node.neighbor(2).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 2 child # 3.
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(2).child(1);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(2).child(2);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(2).child(3);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(2).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 2 child # 4.
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(2).child(1);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(2).child(2);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(2).child(3);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(2).child(4);
    node.child(1).nNeighbor					=	node.child(1).nNeighbor+2;
    node.child(2).nNeighbor					=	node.child(2).nNeighbor+2;
    
        
elseif neighborNumber==3 && ~node.neighbor(3).isEmpty
    %% Assigning cousins and neighbor to NeighborNumber # 3 child # 1.
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(3).child(1);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(3).child(2);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(3).child(3);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(3).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 3 child # 2.
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(3).child(1);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(3).child(2);
    node.child(2).neighbor(3)					=	node.neighbor(3).child(3);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(3).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 3 child # 3.
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(3).child(1);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(3).child(2);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(3).child(3);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(3).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 3 child # 4.
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(3).child(1);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(3).child(2);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(3).child(3);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(3).child(4);
    node.child(2).nNeighbor					=	node.child(2).nNeighbor+1;
    
        
elseif(neighborNumber==4 && ~node.neighbor(4).isEmpty )
    %% Assigning cousins and neighbor to NeighborNumber # 4 child # 1.
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(4).child(1);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(4).child(2);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(4).child(3);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(4).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 4 child # 2.
    node.child(2).neighbor(4)					=	node.neighbor(4).child(1);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(4).child(2);
    node.child(2).neighbor(5)					=	node.neighbor(4).child(3);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(4).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 4 child # 3.
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(4).child(1);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(4).child(2);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(4).child(3);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(4).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 4 child # 4.
    node.child(4).neighbor(3)					=	node.neighbor(4).child(1);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(4).child(2);
    node.child(4).neighbor(4)					=	node.neighbor(4).child(3);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(4).child(4);
    node.child(2).nNeighbor					=	node.child(2).nNeighbor+2;
    node.child(4).nNeighbor					=	node.child(4).nNeighbor+2;
        
    
elseif(neighborNumber==5 && ~node.neighbor(5).isEmpty )
    %% Assigning cousins and neighbor to NeighborNumber # 5 child # 1.
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(5).child(1);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(5).child(2);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(5).child(3);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(5).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 5 child # 2.
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(5).child(1);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(5).child(2);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(5).child(3);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(5).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 5 child # 3.
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(5).child(1);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(5).child(2);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(5).child(3);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(5).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 5 child # 4.
    node.child(4).neighbor(5)					=	node.neighbor(5).child(1);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(5).child(2);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(5).child(3);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(5).child(4);
    node.child(4).nNeighbor					=	node.child(4).nNeighbor+1;

    
elseif(neighborNumber==6 && ~node.neighbor(6).isEmpty )
    %% Assigning cousins and neighbor to NeighborNumber # 6 child # 1.
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(6).child(1);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(6).child(2);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(6).child(3);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(6).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 6 child # 2.
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(6).child(1);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(6).child(2);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(6).child(3);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(6).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 6 child # 3.
    node.child(3).neighbor(6)					=	node.neighbor(6).child(1);
    node.child(3).neighbor(5)					=	node.neighbor(6).child(2);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(6).child(3);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(6).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 6 child # 4.
    node.child(4).neighbor(7)					=	node.neighbor(6).child(1);
    node.child(4).neighbor(6)					=	node.neighbor(6).child(2);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(6).child(3);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(6).child(4);
    node.child(3).nNeighbor					=	node.child(3).nNeighbor+2;
    node.child(4).nNeighbor					=	node.child(4).nNeighbor+2;
    
   
elseif (neighborNumber==7 && ~node.neighbor(7).isEmpty )
    %% Assigning cousins and neighbor to NeighborNumber # 7 child # 1.
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(7).child(1);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(7).child(2);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(7).child(3);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(7).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 7 child # 2.
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(7).child(1);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(7).child(2);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(7).child(3);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(7).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 7 child # 3.
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(7).child(1);
    node.child(3).neighbor(7)					=	node.neighbor(7).child(2);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(7).child(3);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(7).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 7 child # 4.
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(7).child(1);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(7).child(2);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(7).child(3);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(7).child(4);
    node.child(3).nNeighbor					=	node.child(3).nNeighbor+1;
        
    
elseif (neighborNumber==8 && ~node.neighbor(8).isEmpty )
    %% Assigning cousins and neighbor to NeighborNumber # 8 child # 1.
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(8).child(1);
    node.child(1).neighbor(8)					=	node.neighbor(8).child(2);
    node.child(1).nInteraction=node.child(1).nInteraction+1;
    node.child(1).interaction(node.child(1).nInteraction)	=	node.neighbor(8).child(3);
    node.child(1).neighbor(7)					=	node.neighbor(8).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 8 child # 2.
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(8).child(1);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(8).child(2);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(8).child(3);
    node.child(2).nInteraction=node.child(2).nInteraction+1;
    node.child(2).interaction(node.child(2).nInteraction)	=	node.neighbor(8).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 8 child # 3.
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(8).child(1);
    node.child(3).neighbor(1)					=	node.neighbor(8).child(2);
    node.child(3).nInteraction=node.child(3).nInteraction+1;
    node.child(3).interaction(node.child(3).nInteraction)	=	node.neighbor(8).child(3);
    node.child(3).neighbor(8)					=	node.neighbor(8).child(4);
    
    %% Assigning cousins and neighbor to NeighborNumber # 8 child # 4.
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(8).child(1);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(8).child(2);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(8).child(3);
    node.child(4).nInteraction=node.child(4).nInteraction+1;
    node.child(4).interaction(node.child(4).nInteraction)	=	node.neighbor(8).child(4);
    node.child(1).nNeighbor					=	node.child(1).nNeighbor+2;
    node.child(3).nNeighbor					=	node.child(3).nNeighbor+2;
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
