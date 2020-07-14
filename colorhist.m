function [sonspace] = colorhist(filename)
RGBimg = imread(filename);

%rbg转到YUV和HSV，防止变量冲突命名成HSI，二者中的S是一致的
Rimg = RGBimg(:,:,1);
Gimg = RGBimg(:,:,2);
Bimg = RGBimg(:,:,3);

YUVimg = rgb2ycbcr(RGBimg);
Yimg = YUVimg(:,:,1);
Uimg = YUVimg(:,:,2);
Vimg = YUVimg(:,:,3);

HSIimg = rgb2hsv(RGBimg);
Himg = HSIimg(:,:,1);
Simg = HSIimg(:,:,2);
Iimg = HSIimg(:,:,3);

% global Himg;
% global Yimg;
%H和Y分量拿出来
HYimg = [];
HYimg(:,:,1) = Himg;
HYimg(:,:,2) = Yimg;

%把像素点分配到35个等级上
[m,n,h] = size(HYimg);
Hcom = 7;
Ycom = 5;
sonspace = zeros(Hcom,Ycom);
for i = 1:m
    for j = 1:n
        [widpos,higpos]= colorspace(i,j,HYimg);
        sonspace(widpos,higpos) = sonspace(widpos,higpos) + 1;
    end
end
