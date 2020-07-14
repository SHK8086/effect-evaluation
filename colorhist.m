function [sonspace] = colorhist(filename)
RGBimg = imread(filename);

%rbgת��YUV��HSV����ֹ������ͻ������HSI�������е�S��һ�µ�
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
%H��Y�����ó���
HYimg = [];
HYimg(:,:,1) = Himg;
HYimg(:,:,2) = Yimg;

%�����ص���䵽35���ȼ���
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
