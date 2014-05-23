CUTOFF = 8e3;

X = imread('Snowboarder.tiff');
%imagesc(X);
Red = double(X(:,:,1));
Green = double(X(:,:,2));
Blue = double(X(:,:,3));

[rU, rS, rV] = svd(Red);
[gU, gS, gV] = svd(Green);
[bU, bS, bV] = svd(Blue);
 
for i = 1 : length(rS)
    if rS(i) < CUTOFF
        rS(i) = 0;
    end
end
RedLr = rU * rS * rV';

for i = 1 : length(gS)
    if gS(i) < CUTOFF
        gS(i) = 0;
    end
end
GreenLr = gU * gS * gV';

for i = 1 : length(bS)
    if bS(i) < CUTOFF
        bS(i) = 0;
    end
end
BlueLr = bU * bS * bV';

Xlr(:,:,1) = RedLr;
Xlr(:,:,2) = GreenLr;
Xlr(:,:,3) = BlueLr;
Xlr = uint8(Xlr);

imagesc(Xlr)
