function outputImage = rotate(image, titleString, plotNumber, imageIndex, fileName)
angle=0.4; % angle in degree
outputImage=imrotate(image,angle,'bilinear','crop');
imwrite(outputImage,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName));