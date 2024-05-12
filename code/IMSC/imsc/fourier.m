function H = fourier( X,m,t )
%FOURIER 此处显示有关此函数的摘要
%   此处显示详细说明
[n,d]=size(X);
mu=zeros(1,d);
Sigma=sparse(eye(d))./(t*t);
W=mvnrnd(mu,Sigma,m);
Z=W*X';
Z1=cos(Z);
Z2=sin(Z);
H=[Z1;Z2];
H=H'./sqrt(m);

end

