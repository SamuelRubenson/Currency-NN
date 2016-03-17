% Classification of data through a Feed Forward Neural Network
% using a (stochastic) backpropagation algorithm for training

clear
nIterations = 30000;
nI = 2; %Number of input neurons (Number of features)
nH = [8]; %Number of neurons in each hidden layer, (vector for several layers)
nO = 1; % Number of output neurons (Dimensions of classification)
eta = .02; % Learning rate

read = nIterations/1000; % How often to read error level

weights = InitializeWeights(nI,nH,nO); 
theta  =   InitializeThresh(nI,nH,nO); % bias

[train, val] = GetData('_new'); % training set, validation set
% third column of data sets is classification (+-1)

E = zeros(nIterations/read+1,2); % to store energy (error) level
E(1,1) = GetEnergy(train,weights,theta,nH); % Error at start for training set
E(1,2) = GetEnergy(val,weights,theta,nH);   % validation set
%
C = zeros(nIterations/read+1,2); % to store classification errors
C(1,1) = GetClassError(train,weights,theta,nH); % Class error at start (training)
C(1,2) = GetClassError(val,weights,theta,nH); % validation

for t = 1:nIterations
  
  index = randi(size(train,1));  % choose random index as training point
  input = train(index,1:2)';
  target = train(index,3);

  output = RunNetwork(input,weights,theta,nH);
  [dW, dT] = GetDeltaWeights(weights,output,theta,target,eta); % to update weights
  
  for i=1:length(nH)+1 % update weights
    weights{i} = weights{i} + dW{i};
    theta{i} = theta{i} + dT{i};
  end
  
  if mod(t,read)==0 % read error level
    E(t/read+1,1) = GetEnergy(train,weights,theta,nH);
    E(t/read+1,2) = GetEnergy(val,weights,theta,nH);
    C(t/read+1,1) = GetClassError(train,weights,theta,nH);
    C(t/read+1,2) = GetClassError(val,weights,theta,nH);
  end

end

PlotIt( E,C,nIterations,read,weights,theta,nH,train,val )
