% Median filter

function final = medianfilt(I, dim)
l = length(I(:,1));
h = length(I(1,:));
d = floor(dim / 2);
final = zeros(l,h);
for i = 1:l
    l1 = i-d;
    if l1 < 1
        l1 = 1;
    end
    l2 = i+d;
    if l2 > l
        l2 = l;
    end
    for j = 1:h
        h1 = j-d;
        if h1 < 1
            h1 = 1;
        end
        h2 = j+d;
        if h2 > h
            h2 = h;
        end
        X = [];
        for k = l1:l2
            X = [X I(k,h1:h2)];
        end
        final(i,j) = med(X);
    end
    final = uint8(final);
end
end

function ret = med(X)
    t = floor((length(X) + 1) / 2);
    u = (sort(X));
    ret = u(t);
end