function [ O,G ] = solveYnew( Y,A,B )
%SOLVEYSTAR �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
tmp1=A*Y;
G=2*(tmp1-B);
tmp2=sum(sum(Y.*tmp1));
tmp3=sum(sum(Y.*B));
O=tmp2-2*tmp3;

end

