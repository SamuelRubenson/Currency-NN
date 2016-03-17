function [ sum ] = GetClassError( data,weights,theta,nH )

%Obtain average classification error

p = size(data,1);
sum = 0;
for i = 1:p
  O = RunNetwork(data(i,1:end-1)',weights,theta,nH); %%
  sum = sum + abs((data(i,end)-sign(O{end})));
end
sum = sum/p/2;

end

