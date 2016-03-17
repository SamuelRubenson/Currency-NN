function [ dW, dT ] = GetDeltaWeights( weights,output,theta,target,eta )

nW = length(weights);
V = output(1:end-1);
weights{nW+1} = (target-output{end});
dW = cell(1,length(V));
dT = cell(1,length(V));
delta = 0;

% Recursion formula for backpropogation
for i = 1:length(V)
  b = weights{end-i}*V{end-i+1}-theta{end-i+1};
  if i==1
    delta = weights{end-i+1}.*SigmoidDerivative(b);
  else
    delta = (delta*weights{end-i+1}) .* SigmoidDerivative(b)';
  end
  dW{end-i+1} = eta*(delta'*V{end-i+1}');
  dT{end-i+1} = -eta*delta';
end

end

