function [ theta ] = InitializeThresh(nI,nH,nO)
  
  % Random Initialization of thresh(bias) in each layer
  
  theta = {};
  all = [nH nO];
  for i = 1:length(nH)+1
    temp = 2*rand(all(i),1) - 1;
    theta{i} = temp;
  end


end

