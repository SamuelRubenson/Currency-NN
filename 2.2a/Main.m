clear
close all
dataSet = [1]; %Training
% DataSet(1) = Pair_i, 1=EUR/USD, 2=GBP/USD, 3=AUD/USD, 4=NZD/USD, 5=USD/CAD,
% 6=USD/JPY, 7=EUR/JPY, 8=GBP/JPY
%dataSetsValidation = [1 2];
timeFrame = 2; inDays = [96, 24, 1];
% timeFrame=Set_i, 1=15min, 2=60min, 3=Daily

data = GetDataSet(dataSet,timeFrame);
%candle(data(:,4), data(:,5), data(:,6), data(:,3))
data = data(1:end,[6,3,4,5]); % close open high low


transactionCost=0.0001;
holdCost = 0.0005/inDays(timeFrame);

daysBack = 100;
n = size(data,2);
T = size(data,1);

nI = n*daysBack; %Number of input neurons (Number of features)
nH = [daysBack daysBack]; %Number of neurons in each hidden layer, (vector for several layers)
nO = 1; % Number of output neurons (Dimensions of classification)

dims = [nI nH nO];
np = 0;
for i = 1:length(dims)-1;
  np = np + dims(i)*dims(i+1);
end
np = np + sum(nH) + nO;


 
 N = 30;  % #of particles
 n = np;   % #of variables
 xMin = -1;
 xMax = 1;
 vMax = 0.2;
 alpha = 1;
 dt = 1; % >0 !
 c1 = 2;
 c2 = 2;
 xPbi = zeros(N,n);  % Minimization
 iOptX = ones(N,1)*10^10;
 xSb = zeros(1,n);  % Minimization
 SwarmOptX = 10^10;
 w = 1.3;
 beta=0.98;
 
 x = InitializePositions(N,n,xMin,xMax);
 v = InitializeVelocities(N,n,xMin,xMax,alpha,dt);
 
 for iIteration = 1:100
   iIteration
   
   figure(1)
   cla
   axis([-10 10 -10 10])
   hold on
   scatter(x(:,1),x(:,2),10,'k','filled')
   
   for i=1:N
     particle = x(i,:);
     value = Evaluate(particle,nI,nH,nO,data,daysBack,transactionCost, holdCost);
     if value < iOptX(i)   % Minimization
       xPbi(i,:) = x(i,:);
       iOptX(i) = value;
     end
     if value < SwarmOptX  % Minimization
       xSb = x(i,:);
       SwarmOptX = value;
     end
   end
 
   v = UpdateV(v,w,c1,c2,x,xPbi,xSb,dt,vMax);
   x = UpdateX(x,v,dt);
   if w > 0.35
     w = w*beta;
   end
   pause(0.1)
 end

disp(sprintf('Optimum = %.5f, at x = %.5f, y = %.5f',...
    SwarmOptX,xSb(1),xSb(2)));

 
  %%
  
  [weights, theta] = getNetwork(xPbi(30,:),nI,nH,nO);
  [action] = getRespons(data,weights,theta,T,daysBack,nH);
  
  figure(2)
  candle(data(:,3),data(:,4),data(:,1),data(:,2))
  hold on
  plot(find(action==0),data(action==0,4)-0.001,'k.')
  plot(find(action==1),data(action==1,4)-0.001,'g.')
  plot(find(action==-1),data(action==-1,4)-0.001,'r.')
 