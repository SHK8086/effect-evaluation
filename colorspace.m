function [widpos,higpos] = colorspace(mX,nY,eximg)

    Himg = eximg(:,:,1);
    Yimg = eximg(:,:,2);

    Himg(mX,nY);
    if Himg(mX,nY)>0.06 && Himg(mX,nY)<= 0.14
        widpos = 2;
    else if Himg(mX,nY)>0.14 && Himg(mX,nY)<= 0.19
            widpos = 3;
        else if Himg(mX,nY)>0.19 && Himg(mX,nY)<= 0.43
                widpos = 4;
            else if Himg(mX,nY)>0.43 && Himg(mX,nY)<= 0.55
                    widpos = 5;
                else if Himg(mX,nY)>0.55 && Himg(mX,nY)<= 0.69
                        widpos = 6;
                    else if Himg(mX,nY)>0.69 && Himg(mX,nY)<= 0.86
                            widpos = 7;
                        else
                            widpos = 1;
                        end
                    end
                end
            end
        end
    end

higpos = ceil(Yimg(mX,nY)/51);

end



