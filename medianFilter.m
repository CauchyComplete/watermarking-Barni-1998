function outputImage = medianFilter(image, titleString, plotNumber, imageIndex, fileName)
outputImage=medfilt2(image,[5 5]); %apply 5x5 median filter
imwrite(outputImage,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName));