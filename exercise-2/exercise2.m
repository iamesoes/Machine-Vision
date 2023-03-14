% task 1: Show the three diimgimgerent channels oimg the color image (RGB)
%{
clear all;
close all;

img=imread('baboon.tif');
grayImg = imread('grayscale.tif');
figure;
subplot(221);imshow(img);
subplot(222);imshow(img(:,:,1)); %only red color channel is shown with imshow
subplot(223);imshow(img(:,:,2)); %green
subplot(224);imshow(img(:,:,3)); %blue
%}

% task 2: changing color space to hsv (hue, saturation, value) and yiq (luminance, hue, saturation)
%{
img=imread('baboon.tif');
hsvImg=rgb2hsv(img); %rgb to hsv color space conversion
yiqImg=rgb2ntsc(img); %rgb to yiq color space conversion (yiq color space is used in ntsc television standard)
figure;
subplot(221);imshow(hsvImg);
subplot(222);imshow(hsvImg(:,:,1));
subplot(223);imshow(hsvImg(:,:,2));
subplot(224);imshow(hsvImg(:,:,3));
figure;
subplot(221);imshow(yiqImg);
subplot(222);imshow(yiqImg(:,:,1));
subplot(223);imshow(yiqImg(:,:,2));
subplot(224);imshow(yiqImg(:,:,3));
%}


%task 3: 
%{
img=imread('baboon.tif');
grayImg=rgb2gray(img); %converts rgb color image to grayscale image
subplot(121);imshow(img);
subplot(122);imshow(grayImg);
%rgb to grayscale conversion is done using equation
%0.2989 * R + 0.5870 * G + 0.1140 * B

%}
