function [fitness] = Evaluate(X,nI,nH,nO,data,daysBack,transactionCost)

T = size(data,1);
n = size(data,2);

[weights, theta] = getNetwork(X,nI,nH,nO);

[storeOutputs] = getRespons(data,weights,theta,T,daysBack,nH);


result = 0;
for iAction = 2:T
  if storeOutputs(iAction)~=storeOutputs(iAction-1)
    result = result - transactionCost*...
      abs(storeOutputs(iAction)-storeOutputs(iAction-1)); % transaction
  end
  result = result + ...
    (data(iAction,1)-data(iAction,2))*storeOutputs(iAction-1);
end

fitness = -result;



