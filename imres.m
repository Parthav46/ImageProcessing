function final = imres(I, bit)
    X = imslice(I);
    l = max(max(I));
    mbit = ceil(log2(double(l)));
    if bit > mbit
        error('%d-bit image cannot be converted to %d-bit image', mbit, bit);
    else
        if bit == mbit
            final = I;
        else
            final = X(:,:,mbit);
            for i = 7:-1:mbit-bit
                final = final .* 2;
                final = final + X(:,:,i);
            end
            for i = mbit-bit:-1:1
                final = final .* 2;
            end
        end
    end
end