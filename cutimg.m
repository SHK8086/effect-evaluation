function cutimg(filename,picnumber,zuoshang,youxia)

filename1 = strcat(filename,num2str(picnumber),'.jpg');
img = imread(filename1);
savefilename1 = strcat(filename,num2str(picnumber),'-');


%输入图片中目标对角点的位置，来计算中心位置和长度宽度，截取目标和背景图
% zuoshang = [260,480];  %实际左上对应matlab取点的左下
% youxia = [387,394];    %实际右下对应matlab取点的右上
centralpoint = [ceil((zuoshang(1) +  youxia(1))/2),ceil((zuoshang(2) +  youxia(2))/2)]; %实际目标块中心点
width = abs(ceil(zuoshang(1) -  youxia(1)));
higth = abs(ceil(zuoshang(2) -  youxia(2)));  %长宽度
stanpoint = [ceil(ceil((zuoshang(1) +  youxia(1))/2)-width/2),ceil(ceil((zuoshang(2) +  youxia(2))/2)-higth/2)];  %截取时的左上角位置

pic_num = 5;
for i = 1:pic_num
    switch i
        case 1
            stanpoint = [ceil(ceil((zuoshang(1) +  youxia(1))/2)-width/2),ceil(ceil((zuoshang(2) +  youxia(2))/2)-higth/2)];
            para = [stanpoint,width,higth];
            part1 = imcrop(img,para);
            savefilename = strcat(savefilename1,num2str(i),'.jpg');
            imwrite(part1,savefilename);
        case 2
            stanpoint = [ceil(ceil((zuoshang(1) +  youxia(1))/2)-width/2),ceil(ceil((zuoshang(2) +  youxia(2))/2)-higth/2)-higth];
            para = [stanpoint,width,higth];
            part1 = imcrop(img,para);
            savefilename = strcat(savefilename1,num2str(i),'.jpg');
            imwrite(part1,savefilename);
        case 3
            stanpoint = [ceil(ceil((zuoshang(1) +  youxia(1))/2)-width/2)+width,ceil(ceil((zuoshang(2) +  youxia(2))/2)-higth/2)-higth];
            para = [stanpoint,width,higth];
            part1 = imcrop(img,para);
            savefilename = strcat(savefilename1,num2str(i),'.jpg');
            imwrite(part1,savefilename);
        case 4
            stanpoint = [ceil(ceil((zuoshang(1) +  youxia(1))/2)-width/2)-width,ceil(ceil((zuoshang(2) +  youxia(2))/2)-higth/2)];
            para = [stanpoint,width,higth];
            part1 = imcrop(img,para);
            savefilename = strcat(savefilename1,num2str(i),'.jpg');
            imwrite(part1,savefilename);
        case 5
            stanpoint = [ceil(ceil((zuoshang(1) +  youxia(1))/2)-width/2)-width,ceil(ceil((zuoshang(2) +  youxia(2))/2)-higth/2)+higth];
            para = [stanpoint,width,higth];
            part1 = imcrop(img,para);
            savefilename = strcat(savefilename1,num2str(i),'.jpg');
            imwrite(part1,savefilename);
    end
end