function outputImage = resize2(image, titleString, plotNumber, imageIndex, fileName)
scale=0.5;
resizedFileName=strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName);
[Y,X]=size(image);
image=imresize(image,[Y,X*scale]); 
imwrite(image,resizedFileName);
outputImage=im2double(imread(resizedFileName));
try
    outputImage = rgb2gray(outputImage);
catch
end