function [ gameState, types ] = updateGameState( gameState, types )

   fog = [1,1;1,2;1,4;1,5;2,1;2,5;4,1;4,5;5,1;5,2;5,4;5,5];
   
   % for each agent
   for agent = 1:size(types, 2)
       xPos = types(2, agent) + 2;
       yPos = types(3, agent) + 2;
       surroundings = gameState(xPos-2:xPos+2, yPos-2:yPos+2);
       
       for row = 1:size(fog, 1)
           surroundings(fog(row, 1), fog(row, 2)) = NaN;
       end % surroundings are now constructed
           
       % put the agents desired move into its type column's 4th row
       if (types(1, agent) == 1)
           types(4, agent) = Blind.returnAction(surroundings);
       elseif (types(1, agent) == 2)
           types(4, agent) = Chaser.returnAction(surroundings);
       else 
           types(4, agent) = Fleer.returnAction(surroundings);
       end
   end
   
   % execute the turns. randperm() is useful for randomizing order.
   turnOrder = randperm(size(types, 2));  
   for i = 1:size(types, 2)
       ag = turnOrder(i);
       row = types(2, ag) + 2;
       col = types(3, ag) + 2;
       if (types(4, ag) == 3 && gameState(row - 1, col) == 0)
           types(2, ag) = types(2, ag) - 1;
           gameState(row - 1, col) = gameState(row, col);
           gameState(row, col) = 0;
       elseif (types(4, ag) == 4 && gameState(row + 1, col) == 0)
           types(2, ag) = types(2, ag) + 1;
           gameState(row + 1, col) = gameState(row, col);
           gameState(row, col) = 0;
       elseif (types(4, ag) == 2 && gameState(row, col + 1) == 0)
           types(3, ag) = types(3, ag) + 1;
           gameState(row, col + 1) = gameState(row, col);
           gameState(row, col) = 0;
       elseif (types(4, ag) == 1 && gameState(row, col - 1) == 0)
           types(3, ag) = types(3, ag) - 1;
           gameState(row, col - 1) = gameState(row, col);
           gameState(row, col) = 0;
       end
   end
end