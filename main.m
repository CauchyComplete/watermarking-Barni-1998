% Created by Kwon Myung Joon (kwon19@kaist.ac.kr)
% May 4th, 2019
% Matlab 2019a, Windows 10
% reference : A DCT-domain system for robust image watermarking
% M Barni, F Bartolini, V Cappellini, A Piva - Signal processing, 1998 - Elsevier

%% 0. Parameters
imageIndex = 1; % Image index to be used. (default=1)
R = 9; % Block size used in visual masking is RxR. Must be odd integer. (default=9)
alphaBar = 0.2;
M=16000; % The number of random numbers in one watermark.
L=16000; % The number of skipped coefficients.
numOfX=1000; % The number of watermarks to be generated.
watermarks=[400]; % Array of watermark numbers. Element must not exceed numOfX.

%% 1. Read image
files = dir('input');
fileName = {files.name};
fileName = char(fileName(2+imageIndex));
image=im2double(imread(strcat('input/',fileName)));
try
    image = rgb2gray(image);
catch
end
%figure; imshow(image)
imwrite(image,strcat('output/',string(imageIndex),'_1_original_',fileName));

%% 2. Determine beta and alpha
r=(R-1)/2;
padImage = padarray(image,[r,r],'replicate','both');
beta=zeros(size(image));
for i=1:size(beta,1)
    for j=1:size(beta,2)
        beta(i,j)=var(padImage(i:2*r+i,j:2*r+j),0,'all');
    end
end
max_beta=max(beta,[],'all');
beta=beta./max_beta;
mean_beta=mean(beta,'all');
alpha = alphaBar / mean_beta;

%% 3. Generate watermark
Xarr = randn(numOfX, M);

%% 4. Cast watermark
image1=insertWatermark(image, 'watermarked', 2, watermarks, Xarr, M, L, alpha, beta, imageIndex, fileName);

%% 5. Detect watermark
detectWatermark(image1, 'watermarked', 2, numOfX, Xarr, M, L, alpha, alphaBar, imageIndex, fileName);

%% JPEG compression
image2=jpegCompress(image1, 'jpegCompressed', 3, imageIndex, fileName);
detectWatermark(image2, 'jpegCompressed', 3, numOfX, Xarr, M, L, alpha, alphaBar, imageIndex, fileName);

