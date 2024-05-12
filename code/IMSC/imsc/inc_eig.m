function [U_r,S_r]=inc_eig(U1,S1,U2,S2)
    eps=1e-10;
    [n1,n2]=size(U1);
    tmp1=U1'*U2;
    C1=U2-U1*tmp1;
    if max(max(abs(C1)))<eps
        tmp2=U1'*U2;
        tmp3=tmp2*S2*tmp2';
        K=S1+tmp3;
        K=(K+K')./2;
        [a,b]=eig(K);
        U_r=U1*a;
        S_r=sparse(b);
    else
    clear tmp1;
    C1(abs(C1)<eps)=0;
    P1=orth(C1);
    R1=P1'*C1;
    [m1,m2]=size(R1);
    
 
    I1=eye(n2);
    O1=zeros(m1,n2);
    SS1=[I1,U1'*U2;O1,R1];
    SS2=[S1,zeros(n2,m2);zeros(m2,n2),S2];
    K=SS1*SS2*SS1';
    K=(K+K')./2;
    [a,b]=eig(K);

    left=[U1,P1];
    U_r=left*a;
    S_r=sparse(b);
    end
%    max(max(abs(U_r*S_r*U_r'-(U1*S1*U1'+U2*S2*U2'))))
end

