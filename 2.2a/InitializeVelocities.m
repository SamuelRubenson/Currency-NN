function [ velocities ] = InitializeVelocities( N,n,xMin,xMax,alpha,dt)

  velocities = zeros(N,n);
  for i=1:N
    for j=1:n
      velocities(i,j) = (xMin - xMax)/2 + rand*(xMax-xMin);
    end
  end
  velocities = (alpha/dt)*velocities;
end

