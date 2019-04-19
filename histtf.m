% Histogram tranform function
% Author: Parthav46
% 
% histtf(I, var1) accepts any grayscale image I with an optional vararg1 
% input for desirable histogram tranformation. If the argument is not
% provided, the function assumes uniform histogram transformation
% 
% I -> any grayscal image
% var1 -> row matrix of length 256, showing desired histogram shape
% 

function final = histtf(I, var1)
    if nargin < 2
        var1 = ones(1, 256);            % if var1 not available set it to uniform
    end

    h = length(I(:,1));                 % fetch image height
    w = length(I(1,:));                 % fetch image width
    hist = zeros(1, 256);
    for i = 1:1:h                       % form image histogram
        for j = 1:1:w
            tmp = I(i,j);
            hist(1, tmp + 1) = hist(1, tmp + 1) + 1;
        end
    end

    cdf1 = 0;
    cdf2 = 0;
    map1 = zeros(1, 256);               % map1 -> T(rk)
    map2 = zeros(1, 256);               % map2 -> G(zq)
    for i = 1:1:256
        cdf1 = cdf1 + hist(1,i);        % take cdf for original image
        cdf2 = cdf2 + var1(1,i);        % take cdf for tranfer function
        map1(1, i) = cdf1;
        map2(1, i) = cdf2;
    end

    map1 = map1 ./ cdf1;                % normalize transfer map for image
    map2 = map2 ./ cdf2;                % normalize transfer map for function

    prev = 0;                           % a previous value variable for dp search
    for i = 1:1:256
        tmp = map1(1, i);
        for j = prev+1:1:256
            if tmp <= map2(1, j)
                prev = j-1;             % get the lowest and nearest value for the map
                break;
            end            
        end
        map1(1, i) = prev;              % update tranfer map with new value
    end

    final = zeros(h, w);

    for i = 1:1:h                       % update image with map values
        for j = 1:1:w
            final(i,j) = map1(1, I(i,j) + 1);
        end
    end
    final = uint8(final);               % return uint8 format image with desired histogram tranformation
end