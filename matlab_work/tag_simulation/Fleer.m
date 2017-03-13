classdef Fleer
    % Fleer Type of agent
    %   Attempts to escape visibility of other agents to raise its score.
    
    properties
        score
    end
    
    methods(Static)
        function movt = returnAction(surroundings)
            movt = 0;
            numAgents = 0;
            for idx = 1:numel(surroundings)
                if (surroundings(idx) ~= 0 && surroundings(idx) ~= -1 && ~isnan(surroundings(idx)))
                    numAgents = numAgents + 1;
                end
            end
            % this represents the "prob" we will head left-right-up-down
            % as agents are found, we multiply some elems by 0.4, for ex.
            prob = [1, 1, 1, 1];
            
            %           i
            %        e  a  f
            %     l  d  X  b  j
            %        h  c  g  
            %           k
 
            % handle any agents or walls in a-b-c-d. 
            borderPos = [3, 2, 1, 2; 3, 4, 2, 1; 2, 3, 3, 4; 4, 3, 4, 3];
            for i = 1:4
                if (surroundings(borderPos(i, 1), borderPos(i, 2)) ~= 0)
                    prob(borderPos(i, 3)) = 0; % don't move in that direction
                    if (surroundings(borderPos(i, 1), borderPos(i, 2)) ~= -1)
                        prob = prob * 0.2; % it's an agent, so set all probs to a fraction
                        prob(borderPos(i, 4)) = prob(borderPos(i, 4)) / 0.2;
                        % restore chance of moving in the other direction
                    end
                end
            end
            
            % handle any agents in e-f-g-h
            diagonPos = [2, 2, 2, 4; 2, 4, 1, 4; 4, 2, 2, 3; 4, 4, 1, 3];
            for i = 1:4
                % if there is an agent in e-f-g-h
                if (Fleer.isAgent(surroundings(diagonPos(i, 1), diagonPos(i, 2))))
                    prob = prob * 0.4; % multiply all by 0.4
                    prob(diagonPos(i,3))= 2*prob(diagonPos(i,3));
                    prob(diagonPos(i,4))= 2*prob(diagonPos(i,4));
                    % restore the l-r-u-d directions away from the agent
                end
            end
            
            % handle any agents in i-j-k-l.
            distantPos = [1, 3, 4; 3, 1, 2; 5, 3, 3; 3, 5, 1];
            for i = 1:4
                % if there is an agent in i-j-k-l
                if (Fleer.isAgent(surroundings(distantPos(i, 1), distantPos(i, 2)) ~= 0))
                    % slightly disad. all directions except the one away
                    prob = prob * 0.9;
                    prob(distantPos(i, 3)) = prob(distantPos(i, 3)) / 0.9;
                end
            end
            
            % extract the best moves and randomly pick from those
            max = 0.0000001;
            for i = 1:4
                % this is a little complicated to allow for picking >2
                % moves that have the same probability with equal chance
                if prob(i) > max
                    movt = i;
                    max = prob(i);
                elseif prob(i) == max
                        movt = horzcat(movt, i); % don't pre-allocate
                end
            end
            
            % pick a random movt from the desired listed movements.
            movt = movt(randi(size(movt, 2)));
        end
        
        function bool = isAgent(value)
            if (value == 0 || value == -1)
                bool = false;
            else
                bool = true;
            end
        end 
    end
    
end

