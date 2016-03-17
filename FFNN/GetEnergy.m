function [ sum ] = GetEnergy( data,weights,theta,nH )

%%%%%%
% Get the measurment of squared errors
sum = 0;
for i = 1:size(data,1); 
  O = RunNetwork(data(i,1:end-1)',weights,theta,nH); %%
  sum = sum + 0.5*(data(i,end)-O{end})^2;
end

end

