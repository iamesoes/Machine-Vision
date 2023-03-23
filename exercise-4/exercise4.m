%task1: fix broken text with dilation operation
%{
img =imread('broken-text.tif');
se = strel("square", 2);
dilImg = imdilate(img,se);
imshowpair(img,dilImg,"montage")
%}

%tas2: erotion, dilation, opening operations
%{
img = imread('wirebond-mask.tif');
se = strel('square', 14);

erImg = imerode(img, se);
erDilImg = imdilate(erImg, se);
opImg = imopen(img, se);

subplot(221); imshow(img); title('original');
subplot(222); imshow(erImg); title('eroted');
subplot(223); imshow(erDilImg); title('dilation after erotion');
subplot(224); imshow(opImg); title('opened');

%}

