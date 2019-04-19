% 2D Convolution function
% Author: Parthav46
%
% convolution_2D(a, b) accepts two grayscale images a and b, performs a 2D
% convolution on them and returns the image. The algorithm performs 2D
% convolution using transpositional method.

function c = convolution_2D(a, b)

    x = length(a(1,:)) + length(b(1,:)) - 1;
    y = length(a(:,1)) + length(b(:,1)) - 1;

    c = zeros(y,x);
    temp = a;
    if x - length(a(1,:)) > 0
        temp = [temp zeros(length(a(:,1)), x - length(a(1,:)))];
    end
    if y - length(a(:,1)) > 0
        temp = [temp; zeros(y - length(a(:,1)), x)];
    end
    temp2 = temp;

    for i=1:1:length(b(:,1))
        temp1 = temp2;
        for j=1:1:length(b(1,:))
            c = c + (double(temp1) .* double(b(i,j)));
            temp1 = [temp1(:,length(temp(1,:))), temp1(:,1:(length(temp(1,:)) - 1))];
        end
        temp2 = [temp2(length(temp(:,1)),:); temp2(1:(length(temp(:,1)) - 1),:)];
    end

    c = uint8(c);
end
