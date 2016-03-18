function [ weights, theta ] = getNetwork(X,nI,nH,nO)

weights = {};
dims = [nI,nH,nO];
for i = 1:length(dims)-1
  tmp =  dims(i)*dims(i+1);
  weights{i} = vec2mat(X(1:tmp),dims(i));
  X(1:tmp)=[];
end

theta = {};
dims = [nH,nO];
for i = 1:length(dims)
  tmp = X(1:dims(i));
  theta{i} = tmp(:);
  X(1:dims(i)) = [];
end

end

