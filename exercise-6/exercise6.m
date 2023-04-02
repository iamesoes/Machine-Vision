%Task 1: distance transforms and watershed transform

img=imread('circles.png');
% compute the distance transform with three different distance metrics
% the input image is inverted (by taking the complement) 
% because the bwdist function assumes that the objects in the binary image are represented by 0s and the background by 1s.
D1=bwdist(~img,'euclidean'); 
D2=bwdist(~img,'chessboard'); 
D3=bwdist(~img,'cityblock'); 
%The mat2gray function is used to convert the grayscale values of the distance transform 
% to the range [0,1] for visualization purposes.
figure;
subplot(221);imshow(img);title('original');
subplot(222);imshow(mat2gray(D1));title('euclidean'); %mat2gray used for visualization
subplot(223);imshow(mat2gray(D2));title('chessboard');
subplot(224);imshow(mat2gray(D3));title('cityblock');

D1=imcomplement(D1); %complement of the distance transform
figure;
imshow(mat2gray(D1));

% force the pixel not belonging to the objects have the value of -infinity
D1(~img)=-Inf; 

WS=watershed(D1); %watershed transform of the distance transform matrix
figure;
imshow(label2rgb(WS)); %label2rgb is used for visualization purpose
title('Watershed Transform')


