function outputImage = lowPassFilter(image, titleString, plotNumber, imageIndex, fileName)
h = fspecial('gaussian',5,10); %5x5 sigma=10 gaussian filter(low pass filter)
outputImage=imfilter(image, h, 'replicate'); %apply filter
imwrite(outputImage,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName));