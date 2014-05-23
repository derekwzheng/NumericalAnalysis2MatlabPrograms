% This program takes in an image called 'Snowboarder.tiff' and compresses
% it by using a rank p approximation. Output is the low rank version of
% the matrix representation of the image, Xlr.

rankP = zeros(3, 1); % Keep the first P singular values
X = imread('Snowboarder.tiff');

%imagesc(X);

RGB{1} = double(X(:,:,1));
RGB{2} = double(X(:,:,2));
RGB{3} = double(X(:,:,3));

% see analysis.m %
rankP(1) = 60;
rankP(2) = 60;
rankP(3) = 60;

for i = 1 : 3
    [U, S, V] = svd(RGB{i});
    approx = U(:, 1 : rankP(i)) * S(1 : rankP(i), 1 : rankP(i)) ...
        * V(:, 1 : rankP(i))';
    Xlr(:, :, i) = approx;
end

Xlr = uint8(Xlr);
imagesc(Xlr)
