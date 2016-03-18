function [ w ] = InitializeWeights( nI,nH,nO)
  
  % Random Initialization weight in each layer
  
  w = {};
  all = [nI nH nO];
  for i = 1:length(all)-1
    temp = 0.6*rand(all(i+1),all(i))-0.3;
    w{i} = temp;
  end
  
end

