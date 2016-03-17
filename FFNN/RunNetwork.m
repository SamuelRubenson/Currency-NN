function [ out ] =  RunNetwork(input,weights,theta,nH)

out = cell(length(nH)+2,1);
out{1} = input;

% Each layer depend on the previous
for i = 1:length(nH)+1
  out{i+1} = Sigmoid(weights{i}*out{i}-theta{i});
end

end
