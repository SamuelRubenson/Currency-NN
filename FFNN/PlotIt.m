function [  ] = PlotIt( H,C,nIterations,modu,weights,theta,nH,train,val )

figure(1),clf
plot([1 modu:modu:nIterations],H)
title('Energy')
xlabel('Iterations')
ylabel('H')
legend('Training','Validation')


figure(2),clf
plot([1 modu:modu:nIterations],C)
title('Classification Error')
xlabel('Iterations')
ylabel('C')
legend('Training','Validation')

% Create a mesh to obtain classification boundary
interval = -2:0.1:2;
out = zeros(length(interval),length(interval));
[X, Y] = meshgrid(interval,interval);
for x=1:size(X,1)
  for y=1:size(Y,2)
    tmp = RunNetwork([interval(x); interval(y)],weights,theta,nH);
    out(x,y) = tmp{end};
  end
end


figure(3), clf
hold on
s = surf(X,Y,out','EdgeColor', 'None', 'facecolor', 'interp');
colormap copper
view(2);
scatter3(train(train(:,3)>0,1),train(train(:,3)>0,2),...
  ones(size(train(train(:,3)>0,2))),50,'fill','MarkerFaceColor',[0.4940 0.1840 0.5560])
scatter3(train(train(:,3)<0,1),train(train(:,3)<0,2),...
  ones(size(train(train(:,3)<0,2))),50,'fill','MarkerFaceColor',[0.8500 0.3250 0.0980])

s = surf(X,Y,out','EdgeColor', 'None', 'facecolor', 'interp');
colormap copper
view(2);
scatter3(val(val(:,3)>0,1),val(val(:,3)>0,2),...
  ones(size(val(val(:,3)>0,2))),50,'fill','MarkerFaceColor',[0.4940 0.1840 0.5560])
scatter3(val(val(:,3)<0,1),val(val(:,3)<0,2),...
  ones(size(val(val(:,3)<0,2))),50,'fill','MarkerFaceColor',[0.8500 0.3250 0.0980])
title('Calssification boundary')
end

