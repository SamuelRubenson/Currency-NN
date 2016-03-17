function [ out] = SigmoidDerivative( x )
  out = 0.5*(1-tanh(0.5*x).^2);
end

