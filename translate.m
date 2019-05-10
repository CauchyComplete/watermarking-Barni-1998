function outputImage = translate(image, titleString, plotNumber, imageIndex, fileName)
d=4;
[Y,X]=size(image);
outputImage=zeros([Y,X]);
outputImage(1+d:Y,:)=image(1:(Y-d),:);
imwrite(outputImage,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName));