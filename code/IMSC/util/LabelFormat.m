function Y1 = LabelFormat(Y)
% Y should be n*1 or n*c

[m n] = size(Y);
if m == 1
    Y = Y';
    [m n] = size(Y);
end;

if n == 1
    class_num = length(unique(Y));
    Y1 = zeros(m,class_num);
    for i=1:class_num
        Y1(Y==i,i) = 1;
    end;
else
    [temp Y1] = max(Y,[],2);
end;