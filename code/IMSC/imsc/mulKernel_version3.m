function [ U_m, S_m ] = mulKernel_version3( U,S,lambda2)
%MULKERNEL 此处显示有关此函数的摘要
%   此处显示详细说明
U_n=U;
S_n=S;

maxiter=1;
v=length(U);
I1=eye(v);
eps1=1e-6;
eps2=1e-10;
e=ones(v,1);
% alpha=ones(v+1,1)./(v+1);
% alpha=alpha.^(1/rho);
alpha=ones(v+1,1);
%[nn,~]=size(U_c);
%     obj=getobj_version2( U_m,S_m,U_c,S_c,U,S,U_n,S_n,alpha,lambda1,lambda2)
%     objall=[obj];
objall=[];
for i=1:maxiter

    % Update K
    A_U=U_n{1};
    A_S=S_n{1}.*alpha(v+1);
    for j=2:v
        [A_U,A_S]=inc_eig(A_U,A_S,U_n{j},alpha(j).*S_n{j});
    end;
    A_S=A_S./(sum(alpha));
    r1=lambda2./sum(alpha);
    diag_A_S=diag(A_S);
    idx=find(diag_A_S>sqrt(r1));
    U_m=A_U(:,idx);
    S_m=A_S(idx,idx);
%     obj=getobj_version2( U_m,S_m,U_c,S_c,U,S,U_n,S_n,alpha,lambda1,lambda2)
%     objall=[objall,obj];
%     plot(objall);
%     pause(0.1);
%     hold on;
    %update K^{(i)}
%     for j=1:v
%         r2=alpha(j)./(alpha(j)+lambda1);
%         r3=1-r2;
%         r4=lambda2./(alpha(j)+lambda1);
%         [B_U,B_S]=inc_eig(U_m,r2.*S_m,U{j},r3.*S{j});
%         diag_B_S=diag(B_S);
%         idx=find(diag_B_S>sqrt(r4));
%         U_n{j}=B_U(:,idx);
%         S_n{j}=B_S(idx,idx);
%     end
% %      obj=getobj_version2( U_m,S_m,U_c,S_c,U,S,U_n,S_n,alpha,lambda1,lambda2)
%      objall=[objall,obj];
%      plot(objall);
%      pause(0.1);
%      hold on;
    %update alpha
%     for j=1:v
%         [U_tmp,S_tmp]=inc_eig(U_m,S_m,U_n{j},-S_n{j});
%         alpha_S{j}=S_tmp;
%     end
%     [U_tmp,S_tmp]=inc_eig(U_m,S_m,U_c,-S_c);
%     alpha_S{v+1}=S_tmp;
%     clear U_tmp S_tmp;
%     for j=1:v+1
%         diag_alpha_S=diag(alpha_S{j});
%         beta(j)=sum(diag_alpha_S.^2);
%     end
%     r_j=max(beta,eps).^(1/(rho-1));
%     r_j_sum=(sum(r_j.^rho)).^(1/rho);
%     alpha=r_j./r_j_sum
%  %   sum(alpha.^rho)
%     obj=getobj_version2( U_m,S_m,U_c,S_c,U,S,U_n,S_n,alpha,lambda1,lambda2)
%     objall=[objall,obj];
%     plot(objall);
%     pause(0.1);
%     hold on;
end
end

