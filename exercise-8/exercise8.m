%Task1: JPEG image compression algorithm is based on Discrete Cosine Transform
%{
img = imread("mandrill.png");
gsImg = rgb2gray(img); %Convert the color image to grayscale
 % im2double converts the matrix of intensity values from the original image to 
 % a new matrix with double-precision floating-point values ranging from 0.0 to 1.0
 %this conversion allows for more precise mathematical calculations
dobImg = im2double(gsImg);

mtrx = dctmtx(8); %generate an 8x8 Discrete Cosine Transform matrix
%define an anonymous function that takes in a 8x8 block of data and applies
%the DCT transform using the matrix mtrx
dct = @(block_struct)mtrx*block_struct.data*mtrx'; %it produces the DCT coefficients for each block
%Apply the block processing function 
% and use the anonymous function dct to compute the DCT transform on each block
apply = blockproc(dobImg,[8 8], dct);

% The quality factor can be adjusted to control the percentage of discarded DCT coefficients
%mask used for quantization, it is used to discard certain DCT coefficients in each block
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0]; 

apply2 = blockproc(apply,[8 8],@(block_struct) mask .* block_struct.data); %quantization step

%This step reconstructs the compressed image using the quantized DCT coefficients
inverseDct = @(block_struct) mtrx'* block_struct.data*mtrx; 
compImg = blockproc(apply2,[8 8],inverseDct);

figure;
imshowpair(dobImg,compImg,"montage");
title("Result of compression");
%}



%Task2: compress and uncompress an image via wcompress function.
% Wavelet toolbox is required

img = imread("mandrill.png");
% 'c' indicates that the function should perform compression
%'comp.wtc'is the name of the file where the compressed data will be saved
%'stw' is the name of the wavelet used for compression. In this case: "Symmetric Tight Wavelet"
%cr is the compression ratio
%bpp is the number of bits per pixel
[cr,bpp]=wcompress('c',img,'comp.wtc','stw');

%'u' indicates that the function should perform decompression
%'comp.wtc' is the name of the file where the compressed data is saved
%'step' is the name of the thresholding method used during compression
% output of the function is the decompressed image
decmpImg=wcompress('u','comp.wtc','step'); 

figure;
imshowpair(img,decmpImg,"montage");
title("Result of compression");

