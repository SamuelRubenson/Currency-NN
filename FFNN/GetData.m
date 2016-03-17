function [tr, va] = GetData(s)

train = dlmread(strcat('train_data',s,'.txt'),' ');
val = dlmread(strcat('valid_data',s,'.txt'),' ');

% Normalize training and validation data
m1 = mean(train(:,1));
m2 = mean(train(:,2));
sd1 = std(train(:,1));
sd2 = std(train(:,2));
tr = [ (train(:,1)-m1)/sd1 (train(:,2)-m2)/sd2 train(:,3)];
va = [ (val(:,1)-m1)/sd1 (val(:,2)-m2)/sd2 val(:,3)];


end

