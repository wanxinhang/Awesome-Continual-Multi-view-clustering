function H = fourier( X,m,t )
%FOURIER �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

