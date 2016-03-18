function [ out ] = UpdateV(v,w,c1,c2,x,xPbi,xSb,dt,vMax)
  
  N = size(xPbi,1);
  n = size(xPbi,2);
  newV = v;
  
%   for i = 1:N
%     for j = 1:n
%       r = rand; q = rand;
%       newV(i,j) = w*v(i,j) + c1*q*(xPbi(i,j)-x(i,j))/dt +...
%           c2*r*(xSb(j)-x(i,j))/dt;
%       if abs(newV(i,j)) >= vMax
%         newV(i,j) = sign(newV(i,j))*vMax;
%       end
%     end
%   end
%   out = newV;
  
  xSb = repmat(xSb(:)',N,1);
  r = rand(N,n); q = rand(N,n);
  newV = w*v + c1*q.*(xPbi-x)/dt + c2*r.*(xSb-x)/dt;
  newV(abs(newV)>=vMax) = vMax*sign(newV(abs(newV)>=vMax));
  out = newV;
  
end

