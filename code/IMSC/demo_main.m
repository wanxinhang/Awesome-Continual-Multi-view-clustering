clear all
clc
MaxResSavePath = 'final_res1/';
addpath('util')
addpath('imsc')
% datasetName = {'ar10p','3Sources_3view','proteinFold','bbcsport_2view','mfeat','citeseer','cora','SUNRGBD_fea','Reuters'};
 datasetName = {'VGGFace2_50_4Views','STL10_4Views','YouTubeFace10_4Views'};;
for dataIndex = 1 : length(datasetName)
    rand('state',0)
    dataName = [ datasetName{dataIndex}];
    load(['F:\wxh_work\datasets\Ht_gau\',datasetName{dataIndex},'_Ht','.mat'],'Ht','Y');
    X=Ht;
    y=Y;
    clear Ht Y
    
    c=length(unique(y));
    v=length(X);
    v
    lambda=10;
    gamma=0.01;
    tau=0.01;
    
    for i=1:v
        sigma(i)=optSigma(X{i});
    end
    [n,~]=size(X{1});
    
    m=50;
    H1=fourier(X{1},m,sigma(1));
    H2=fourier(X{2},m,sigma(2));
    
    [U1,S1,~]=svd(H1,'econ');
    U_n{1}=U1;
    S_n{1}=sparse(S1.^2);
    clear U1 S1 H1;
    
    [U2,S2,~]=svd(H2,'econ');
    U_n{2}=U2;
    S_n{2}=sparse(S2.^2);
    clear U2 S2 H2;
    
    
    H3=fourier(X{1},m,sigma(1));
    K=H3*H3';
    W=K;
    % W=knn_new(K,10);
    
    I=sparse(eye(n));
    d=1./max(sqrt(abs(sum(W))),eps);
    L=bsxfun(@times,W,d);
    L=bsxfun(@times,L,d');
    L=I-L;
    L=(L+L')./2;
    clear I d W;
    [V,~]=eigs(L,c+1,'sa');
    clear L;
    YY=V(:,2:c+1);
    clear V;
    normvect = sqrt(diag(YY*YY'));
    normvect(find(normvect==0.0)) = 1;
    Y_new1 = inv(diag(normvect)) *YY;
    clear YY;
    acc_multi=[];
    nmi_multi=[];
    pur_multi=[];
    
    U_n1=U_n;
    S_n1=S_n;
    
    Y_new=Y_new1;
    tt=[];
    for i=3:3
        i
        tic
        [ Y_new,U_n1,S_n1 ] = inc_sc( X{2},U_n1,S_n1,Y_new,lambda,gamma,m,sigma(2),tau );
        
        normvect = sqrt(diag(Y_new*Y_new'));
        normvect(find(normvect==0.0)) = 1;
        Y_new = inv(diag(normvect)) *Y_new;
        t=toc
        tt=[tt,t];
        minobj=inf;
        minZ1=[];
        for j=1:20
            [Z1,~,obj]=discretisation(Y_new);
            if obj<minobj
                minZ1=Z1;
                minobj=obj;
            end
        end
        [row,col]=find(minZ1>0);
        [~,idx1]=sort(row,'ascend');
        label=col(idx1);
        res=ClusteringMeasure(y,label);
        res
        acc_multi=[acc_multi, res(1)];
        nmi_multi=[nmi_multi, res(2)];
        pur_multi=[pur_multi, res(3)];
    end
    resFile2 = [MaxResSavePath,dataName, '.mat'];
    save(resFile2,  'acc_multi','nmi_multi','pur_multi');
end

