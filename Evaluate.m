clear
dataSet = [1]; %Training
% DataSet(1) = Pair_i, 1=EUR/USD, 2=GBP/USD, 3=AUD/USD, 4=NZD/USD, 5=USD/CAD,
% 6=USD/JPY, 7=EUR/JPY, 8=GBP/JPY
%dataSetsValidation = [1 2];
timeFrame = 2;
% timeFrame=Set_i, 1=15min, 2=60min, 3=Daily

data = GetDataSet(dataSet,timeFrame);
%candle(data(:,4), data(:,5), data(:,6), data(:,3))
data = data(:,[6,3,4,5]); % close open high low


daysBack = 100;
n = size(data,2);
T = size(data,1);

nI = n*daysBack; %Number of input neurons (Number of features)
nH = [daysBack/4 daysBack/4]; %Number of neurons in each hidden layer, (vector for several layers)
nO = 1; % Number of output neurons (Dimensions of classification)

weights = InitializeWeights(nI,nH,nO); 
theta  =   InitializeThresh(nI,nH,nO); 


storeOutputs = zeros(T,1);
for i = 1:T-daysBack
  input = data(i:i+daysBack-1,:);
  output = RunNetwork(input(:),weights,theta,nH);
  storeOutputs(i+daysBack-1) = output{end};
end

plot(storeOutputs)