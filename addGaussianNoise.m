function outputImage = addGaussianNoise(image, titleString, plotNumber, imageIndex, fileName)
outputImage=imnoise(image,'gaussian',0,0.005); %add Gaussian noise
imwrite(outputImage,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName));