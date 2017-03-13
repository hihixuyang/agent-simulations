function [ gameState, types, colors] = loadGameState( agents, boardSize )
%LOADGAMESTATE This function initializes a game state
%   Called exactly once by runSim. Returns a matrix with all the
%   information about the board, including the positions and numbers of the
%   agents as well as the types.

nums = cellfun(@sum, agents(:,2));
totalAgents = sum(nums);

if boardSize < totalAgents * 1.25
    boardSize = round(totalAgents * 1.25);
end

 % We will surround the board with a 2-thick layer of -1's for walls.
gameState = zeros(boardSize + 4, boardSize + 4);
for i = 1:(boardSize + 4)
    gameState(i, 1) = -1;
    gameState(i, 2) = -1;
    gameState(i, boardSize + 3) = -1;
    gameState(i, boardSize + 4) = -1;
    gameState(1, i) = -1;
    gameState(2, i) = -1;
    gameState(boardSize + 3, i) = -1;
    gameState(boardSize + 4, i) = -1;
end

types = zeros(4, totalAgents);
% types explanation
% each column of types refers to a unique agent, represented by index
% row 1 = type of agent, 1 - numTypes
% row 2 and 3 represent the current (x, y) coordinates of the agent
% row 4 represents the agent's last desired move and is for updateGameState

counter = 1;
numTypes = int64(size(nums, 1));

for row = 1:numTypes
    for insert = 1:cellfun(@sum, agents(row ,2))
        types(1, counter) = row;
        counter = counter + 1;
    end    
end

inc = (boardSize) / (totalAgents + 5);
inc = cast(inc, 'int32');

positionCounter = 1;
for col = randperm(size(types, 2))
    types(2, col) = positionCounter;
    types(3, col) = positionCounter;
    gameState(positionCounter + 2, positionCounter + 2) = positionCounter;
    positionCounter = positionCounter + inc;
end



% load colors
colors = zeros(size(types, 2), 3);
for i = 1:size(types, 2)
    idx = types(1, i) - 1;
    if (idx == 0) 
        idx = 3;
    end % ^ obscure code that assigns idx to the right val. for the 3 types
    colors(i, idx) = 1;
end
disp(colors);

end

