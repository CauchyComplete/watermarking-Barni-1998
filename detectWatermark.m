function detectWatermark(watermarkedVisualMaskedImage, titleString, plotNumber, numOfX, Xarr, M, L, alpha, alphaBar, imageIndex, fileName)
dctWatermarkedImage = dct2(watermarkedVisualMaskedImage); %DCT the image
zz = zigzag(dctWatermarkedImage);
tStar=zz(1+L:L+M);
zArr=zeros([1,numOfX]);
for i=1:numOfX
    Y=Xarr(i,:);
    zArr(i)=dot(Y,tStar)/M;
end
Tz=alphaBar/(3*M)*sum(abs(tStar),'all');
figure('visible','off'); % if you want to display the figure, turn it on.
p=plot(1:numOfX,zArr);
%set(gca, 'YScale', 'log') 
% if you want to plot in log scale, uncomment this line
title(sprintf('%s (\\alpha=%.2f, M=%dk, L=%dk)',titleString,alpha,M/1000,L/1000));
hline = refline([0 Tz]); hline.Color = [0.6,0.6,0.6];
legend('response','threshold Tz'); xlabel('Watermarks'); ylabel('Detector Response');
saveas(p,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName,'.png'));