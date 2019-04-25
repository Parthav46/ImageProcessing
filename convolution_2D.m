% 2D Convolution function
% Author: Parthav46
%
% convolution_2D(a, b) accepts two grayscale images a and b, performs a 2D
% convolution on them and returns the image. The algorithm performs 2D
% convolution using transpositional method.

function c = convolution_2D(a, b)

    la = length(a(:,1));
    ha = length(a(1,:));
    lb = length(b(:,1));
    hb = length(b(1,:));
    
    if la*ha < lb*hb
        tmp = a;
        a = b;
        b = tmp;
        la = length(a(:,1));
        ha = length(a(1,:));
        lb = length(b(:,1));
        hb = length(b(1,:));
    end
    
    x = ha + hb - 1;
    y = la + lb - 1;

    c = zeros(y,x);
    temp = a;
    if x - ha > 0
        temp = [temp zeros(la, x - ha)];
    end
    if y - la > 0
        temp = [temp; zeros(y - la, x)];
    end
    temp2 = temp;

    for i=1:1:lb
        temp1 = temp2;
        for j=1:1:hb
            c = c + (double(temp1) .* double(b(i,j)));
            temp1 = [temp1(:,length(temp(1,:))), temp1(:,1:(length(temp(1,:)) - 1))];
        end
        temp2 = [temp2(length(temp(:,1)),:); temp2(1:(length(temp(:,1)) - 1),:)];
    end

    c = uint8(c);
    lt = floor((lb - 1 )/ 2);
    ht = floor((hb - 1 )/ 2);
    c = c(1+lt:y-lt, 1+ht:x-ht);
end
