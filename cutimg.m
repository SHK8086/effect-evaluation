function cutimg(filename,picnumber,zuoshang,youxia)

filename1 = strcat(filename,num2str(picnumber),'.jpg');
img = imread(filename1);
savefilename1 = strcat(filename,num2str(picnumber),'-');


%����ͼƬ��Ŀ��Խǵ��λ�ã�����������λ�úͳ��ȿ�ȣ���ȡĿ��ͱ���ͼ
% zuoshang = [260,480];  %ʵ�����϶�Ӧmatlabȡ�������
% youxia = [387,394];    %ʵ�����¶�Ӧmatlabȡ�������
centralpoint = [ceil((zuoshang(1) +  youxia(1))/2),ceil((zuoshang(2) +  youxia(2))/2)]; %ʵ��Ŀ������ĵ�
width = abs(ceil(zuoshang(1) -  youxia(1)));
higth = abs(ceil(zuoshang(2) -  youxia(2)));  %�����
stanpoint = [ceil(ceil((zuoshang(1) +  youxia(1))/2)-width/2),ceil(ceil((zuoshang(2) +  youxia(2))/2)-higth/2)];  %��ȡʱ�����Ͻ�λ��

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