function [out] = normalizeImg(img)
%NORMALIZEIMG gives img with mean of it = 0
    mean_img=mean(mean(img));
    out = img - mean_img;
end

