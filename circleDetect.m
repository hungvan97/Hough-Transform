I = im2double(imread('./bilder/Zellen.jpg'));
if size(I, 3) > 1
    I = rgb2gray(I);
end

figure(1); clf; subplot(2, 2, 1);
imshow(I);
hold on;
title('Bild');

%% Kantenbild erstellen und darstellen
%
%  Befehle: edge, imshow/image/imagesc
figure(1); subplot(2, 2, 3);            % (sub)figure anwählen


    % TODO
I_edge = edge(I, 'Sobel', 0.05);
imshow(I_edge)
title('Kantenbild');

%% Hough Circle Detection
figure(1); clf; subplot(2, 2, 1);
minR = 10;
maxR = 20;
nc = 5;
gefunden_Kreis = houghCircle(I_edge, nc, minR, maxR);  % will be 2D Matrix [mOut, nOut, rOut]
for iii = 1:size(gefunden_Kreis, 1)
    plotCircle(gefunden_Kreis(iii, :, :))
end    
hold off;