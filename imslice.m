function final = imslice(I, planes)
    if nargin < 2
        planes = 8;
    end
    
    final = zeros(length(I(:,1)), length(I(1,:)), planes);
    for i = 1:planes
        final(:,:,i) = mod(floor(double(I)./power(2,i-1)), 2);
    end
    final = uint8(final);
end