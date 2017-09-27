%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%                   BLACK BOX FAST MULTIPOLE METHOD 2D                        %
%                             Version 1.0                                     %
%          Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang            %
%          Written for MATLAB by : Ali Rezaei, Fahd Siddiqui                  %
%                                                                             %
% =========================================================================== %
% LICENSE: MOZILLA 2.0                                                        %
% This Source Code Form is subject to the terms of the Mozilla Public         %
% License, v. 2.0. If a copy of the MPL was not distributed with this         %
% file, You can obtain one at http://mozilla.org/MPL/2.0/.                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef H2_2D_Node < handle
% H2_2D_NODE Class for the nodes of the FMM Tree
% Defines the nodes of the FMM tree alongwith its properties
    properties
        charge
        chargeComputed
        center
        child
        interaction
        index
        isEmpty=true
        isLeaf=true
        isRoot
        location
        N
        neighbor
        nInteraction
        nLevel
        nNeighbor
        nodeCharge
        nodeNumber
        nodePotential
        parent
        potential
        R
        radius
        scaledCnode
    end
    methods
        function node = H2_2D_Node(nLevel, nodeNumber)
            % Constructor initializes each node of the FMM Tree
            if nargin 
                node.child          = H2_2D_Node;              
                node.interaction    = H2_2D_Node;
                node.neighbor       = H2_2D_Node;
                node.parent         = H2_2D_Node;
                node.center         = [0 0];
                node.charge         = 0;
                node.chargeComputed	= false;
                node.index          = [];
                node.isEmpty		= true;
                node.isLeaf		    = true;
                node.isRoot         = false;
                node.location       = [];
                node.N              = 0;
                node.nInteraction	= 0;
                node.nLevel	        = nLevel;
                node.nNeighbor      = 0;
                node.nodeNumber     = nodeNumber;
                node.nodeCharge     = [];
                node.nodePotential  = [];
                node.potential      = [];
                node.R              = [];
                node.radius         = [0 0];
                node.scaledCnode    = [];
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
