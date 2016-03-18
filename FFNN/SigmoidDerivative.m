function [ out] = SigmoidDerivative( x )
  out = 0.2*(1-tanh(0.2*x).^2);
end

