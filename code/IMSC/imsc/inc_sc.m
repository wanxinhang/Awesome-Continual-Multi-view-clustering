function [ Y_new,U_n,S_n ] = inc_sc( X,U,S,Y_old,lambda,gamma,m,t,tau )
%INC_SC 此处显示有关此函数的摘要
%   此处显示详细说明
opts.record = 0;
opts.mxitr  = 200;
opts.xtol = 1e-5;
opts.gtol = 1e-5;
opts.ftol = 1e-8;
out.tau = 1e-3;

H=fourier(X,m,t);
[U_c,S_c,~]=svd(H,'econ');
S_c=sparse(S_c).^2;
 clear X H;

 [n,c]=size(Y_old);
 [ U_m1, S_m1 ] = mulKernel_version3( U,S,tau);
 K=U_m1*S_m1*U_m1';
 clear U_m1 S_m1;
  W=knn_new(K,10);
  I=sparse(eye(n));
 d_new=1./max(sqrt(abs(sum(W))),eps);
 L_new_tmp=bsxfun(@times,W,d_new);
 L_new_tmp=bsxfun(@times,L_new_tmp,d_new');
 L_new=I-L_new_tmp;
 L_new=(L_new+L_new')./2;
 clear I d W;
 [V,~]=eigs(L_new,c+1,'sa');
 clear L_new;
 YY=V(:,2:c+1);
 clear V;
 normvect = sqrt(diag(YY*YY'));
 normvect(find(normvect==0.0)) = 1;
 Y_old = inv(diag(normvect)) *YY;
 clear YY;



[U_m, S_m, U_n, S_n,alpha]=mulKernel_version2( U_c,S_c,U,S,lambda,tau );

[n,~]=size(U_n{1});
K=U_m*S_m*U_m';
clear U_m S_m;
 W=knn_new(K,10);
 %W=W.*K;
%W=K;

clear K;

I=sparse(eye(n));
d_new=1./max(sqrt(abs(sum(W))),eps);
L_new_tmp=bsxfun(@times,W,d_new);
L_new_tmp=bsxfun(@times,L_new_tmp,d_new');
L_new=I-L_new_tmp;

L_new=(L_new+L_new')./2;

AA=L_new+gamma.*I;
BB=gamma.*Y_old;
Y_new=Y_old;
clear I d_new L_new_tmp L_new Y_old;
[Y_new, out]= OptStiefelGBB(Y_new, @solveYnew, opts, AA,BB);

end

