function outputImage = resize(image, titleString, plotNumber, imageIndex, fileName)
resizedFileName=strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName);
image=imresize(image,0.5); 
imwrite(image,resizedFileName);
outputImage=im2double(imread(resizedFileName));
try
    outputImage = rgb2gray(outputImage);
catch
end