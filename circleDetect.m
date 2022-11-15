% Kantenbild erstellen und darstellen
I = im2double(imread('./bilder/Zellen.jpg'));
if size(I, 3) > 1
    I = rgb2gray(I);
end

figure(1); clf; subplot(2, 2, 1);
imshow(I);
axis on;
hold on;
title('Bild');


%
%  Befehle: edge, imshow/image/imagesc
figure(1); subplot(2, 2, 3);            % (sub)figure anwählen


    % TODO
I_edge = edge(I, 'Sobel', 0.1);
imshow(I_edge);
axis on;
hold on;
title('Kantenbild');

% Hough Circle Detection
subplot(2, 2, 3);
minR = 15;
maxR = 25;   
nc = 400;
[mOut, nOut, rOut] = houghCircle(I_edge, nc, minR, maxR);  
plotCircle(mOut, nOut, rOut);

% Historgram der Radien der gefunden Kreis
subplot(2, 2, [2,4])
histogram(rOut);
title("gefunden Radien")