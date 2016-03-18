function [ storeOutputs ] = getRespons(data,weights,theta,T,daysBack,nH)

storeOutputs = zeros(T,1);

for i = 1:T-daysBack
  input = data(i:i+daysBack-1,:);
  output = RunNetwork(input(:),weights,theta,nH);
  storeOutputs(i+daysBack-1) = output{end};
end

storeOutputs(storeOutputs<-0.5)=-1;
storeOutputs(storeOutputs>0.5)=1;
storeOutputs(logical((storeOutputs>-0.5).*(storeOutputs<0.5)))=0;

end

