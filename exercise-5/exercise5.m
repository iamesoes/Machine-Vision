% Task 1: fixing noisy(salt and pepper) image with median filter

img = imread('ckt-board-slt-pep.tif');

mf = medfilt2(img);% 2-D median filtering using default mask size 3x3 and zero padding
mf5 = medfilt2(img, [5,5]); %mask size 5x5
mf9 = medfilt2(img,[9 9]); % 9x9 is too big mask, it blurs the image
mfs = medfilt2(img,'symmetric'); % symmetric padding
mfs5 = medfilt2(img,[5 5],'symmetric');

figure
subplot(231); imshow(img); title("original")
subplot(232); imshow(mf); title("default MF")
subplot(233); imshow(mf5); title("MF 5x5 mask")
subplot(234); imshow(mf9); title("MF 9x9 mask")
subplot(235); imshow(mfs); title("MF symmetric")
subplot(236); imshow(mfs5); title("MF symmetric 5x5 mask")



% Task 2: using unsharp filter via fspecial

img = imread('ckt-board-slt-pep.tif');
img2 =  imread('moon.tif');

mf5s = medfilt2(img,[5 5],'symmetric');
myFilter = fspecial('unsharp');
newImg = imfilter(mf5s,myFilter);

newImg2 = imfilter(img2,myFilter); % filters image using filter created by fspecial

figure;
subplot(221); imshow(img2)
subplot(222); imshow(newImg2)
subplot(223); imshow(mf5s)
subplot(224); imshow(newImg)