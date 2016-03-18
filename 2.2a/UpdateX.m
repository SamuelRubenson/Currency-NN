function [ out ] = UpdateX(x,v,dt)

%   N = size(x,1);
%   n = size(x,2);
%   newX = zeros(N,n);
%   
%   for i = 1:N
%     for j = 1:n
%       newX(i,j) = x(i,j) + v(i,j)*dt;
%     end
%   end
%   out = newX;
%   
  out = x + v*dt;
  
end

