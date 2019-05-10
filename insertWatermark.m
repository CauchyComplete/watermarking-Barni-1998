function watermarkedVisualMaskedImage = insertWatermark(image, titleString, plotNumber, watermarks, Xarr, M, L, alpha, beta, imageIndex, fileName)
imageDCT = dct2(image); %DCT the image
zz = zigzag(imageDCT); %make it linear using zigzag.m
X=Xarr(watermarks,:);
t=zz(1+L:L+M); %select coefficients to embed watermark
tPrime=t+alpha.*abs(t).*X;
zz(1+L:L+M)=tPrime;
watermarkedImageDCT=inv_zigzag(zz,size(image,1),size(image,2));
watermarkedImage=idct2(watermarkedImageDCT); %inverse DCT
watermarkedVisualMaskedImage=image.*(1-beta)+beta.*watermarkedImage;
%figure; imshow(watermarkedVisualMaskedImage);
imwrite(watermarkedVisualMaskedImage,strcat('output/',string(imageIndex),'_',string(plotNumber),'_',titleString,'_',fileName));