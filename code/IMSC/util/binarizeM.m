function B = binarizeM(M, type)
% binarize matrix M to 0 or 1

[n,c] = size(M);

B = zeros(n,c);

if strcmp(type, 'median')
    B(find(M > 0.5)) = 1;
else
    
if strcmp(type, 'min')
    [temp idx] = min(M,[],2);
elseif strcmp(type, 'max')
    [temp idx] = max(M,[],2);
end;

for i = 1:n
    B(i,idx(i)) = 1;
end;

end;