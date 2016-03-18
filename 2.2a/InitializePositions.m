function [ positions ] = InitializePositions( N,n,xMin,xMax )

    positions=zeros(N,n);
    for i=1:N
      for j=1:n
        positions(i,j) = xMin + rand*(xMax-xMin);
      end
    end
    
end

