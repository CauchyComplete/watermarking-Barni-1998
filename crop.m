function outputImage = crop(image, titleString, plotNumber, imageIndex, fileName)
[Y,X]=size(image);
outputImage=zeros([Y,X]);
xRange=floor(Y*0.2):floor(Y*0.8);
yRange=floor(X*0.2):floor(X*0.8);
outputImage(xRange,yRange)=image(xRange,yRange);
imwrite(outputImage,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName));