function outputImage = histogramEqualize(image, titleString, plotNumber, imageIndex, fileName)
p=figure('visible','off'); % if you want to display the figure, turn it on.
imhist(image,256);
title('original histogram');
saveas(p,strcat('output/',string(imageIndex),'_',string(plotNumber),'_','original histogram','_',fileName,'.png'));

outputImage=histeq(image,256); %histograma equalization

p=figure('visible','off'); % if you want to display the figure, turn it on.
imhist(outputImage,256);
title('histogram equalized');
saveas(p,strcat('output/',string(imageIndex),'_',string(plotNumber),'_','histogram equalized','_',fileName,'.png'));

imwrite(outputImage,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName));