% Findet Geraden in einem Bild mit Hilfe der Matlab-eigenen Funktionen zur
% Hough-Transformation

%% Bild einlesen und darstellen
I = im2double(imread('./bilder/wire_bond1.tif'));
if size(I, 3) > 1
    I = rgb2gray(I);
end

figure(1); clf; subplot(2, 2, 1);
imshow(I);
title('Bild');

%% Kantenbild erstellen und darstellen
%
%  Befehle: edge, imshow/image/imagesc
figure(1); subplot(2, 2, 3);            % (sub)figure anwählen


    % TODO
I_edge = edge(I, 'Sobel', 0.05);
imshow(I_edge)
title('Kantenbild');

%% Hough-Transformation und Darstellung der Akkumulatormatrix
%
%  Befehle: hough, imagesc
figure(1); subplot(2, 2, [2, 4]);       % (sub)figure anwählen


    % TODO

[H,T,R] = hough(I_edge);
imagesc(H)
title('Akkumulatormatrix');    
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,gray);
    
%% Maxima der Akkumulatormatrix H bestimmen
%  und in Darstellung plotten
%
%  Befehle: houghpeaks, plot
figure(1); subplot(2, 2, [2, 4]);       % (sub)figure anwählen


    % TODO
P = houghpeaks(H,4);
imshow(H,[],'XData',T,'YData',R);
xlabel('\theta'), ylabel('\rho');
axis on, axis normal;
plot(T(P(:,2)),R(P(:,1)),'s','color','red');

hold off;

%% Geraden zu den entsprechenden Maxima in das Bild plotten
%
%  getEndpoints(I, theta, rho) gibt Endpunkte der implizit gegebenen
%  Geraden mit den Parametern theta und rho zurück. Die relevanten
%  Parameter können mit der Rückgabe von houghpeaks aus R und T bestimmt 
%  werden.
%
%  Befehl: plot
figure(1); subplot(2, 2, 1);            % (sub)figure anwählen
Q = getEndpoints(I_edge, T(P(:,2)), R(P(:,1)));
axis on    
hold on;


    % TODO
    for line = 1:size(Q, 1)
        hold on;
        x_line = Q(line, 3:4);
        y_line = Q(line, 1:2);
        plot(x_line, y_line)
    end

hold off;
