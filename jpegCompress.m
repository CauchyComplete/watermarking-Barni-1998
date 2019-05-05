function outputImage = jpegCompress(image, titleString, plotNumber, imageIndex, fileName)
jpgFileName=strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName,'.jpg');
imwrite(image,jpgFileName,'jpeg','quality',15);
outputImage=im2double(imread(jpgFileName));
try
    outputImage = rgb2gray(outputImage);
catch
end