function [ GG ] = knn_new( W,k )
%KNN_NEW 此处显示有关此函数的摘要
%   此处显示详细说明
[nSmpNow,~]=size(W);
smpIdx = 1:nSmpNow;
G = zeros(nSmpNow*k,3);
%nSmpNow = length(smpIdx);
dump = zeros(nSmpNow,k);
x = dump;
for j = 1:k
    [dump(:,j),idx(:,j)] = max(W,[],2);
    temp = (idx(:,j)-1)*nSmpNow+[1:nSmpNow]';
    W(temp) = -1e100;
end
clear W;
G(1:nSmpNow*k,1) = repmat(smpIdx',[k,1]);
G(1:nSmpNow*k,2) = idx(:);
G(1:nSmpNow*k,3) = dump(:);

GG = sparse(G(:,1),G(:,2),G(:,3),nSmpNow,nSmpNow);
GG=max(GG,GG');
clear G;
end

