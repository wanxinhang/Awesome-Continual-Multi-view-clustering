% min_{Fr \in Ind, Q'Q=I}  ||Fr - F*Q ||^2
function [Fr obj Q] = SpectralRotation_new(F, F0)
% F:  continuous value
% F0: initial discrete value
% Fr: discrete value
% Q:  rotation matrix

[n,c] = size(F);

F(sum(abs(F),2) <= 0,:) = 1;
F = diag(diag(F*F').^(-1/2)) * F;

if nargin < 2
    StartInd = randsrc(n,1,1:c);
    F0 = LabelFormat(StartInd);
end;
    
G = F0;
obj_old = 10^10;
for iter = 1:30
    [U, d, V] = svd(F'*G);
    Q = U*V';
    
    M = F*Q;
    G = binarizeM(M, 'max');
    N = G - M; obj = trace(N'*N);
    if abs(obj_old - obj)/obj < 0.000001
        break;
    end;
    obj_old = obj;
end;
   
if iter == 30
    warning('Spectral Rotation does not converge');
end;

Fr = G;
