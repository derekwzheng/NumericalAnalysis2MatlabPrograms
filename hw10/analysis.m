% Analysis %
% This program plots the singular values of Red, Green, and Blue matrices.
% Then we decide the first p singular values we will use to approximate
% the orginal matrices.

X=imread('Snowboarder.tiff');

Red = double(X(:,:,1));
Green = double(X(:,:,2));
Blue = double(X(:,:,3));

rS = svd(Red);
gS = svd(Green);
bS = svd(Blue);

figure
plot(rS, 'r*');
hold all
plot(gS, 'go');
hold all
plot(bS, 'b--');