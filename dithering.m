function outputImage = dithering(image, titleString, plotNumber, imageIndex, fileName)
outputImage=dither(image); %dithering
imwrite(outputImage,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName));