function AUpdate = getAccumulatorUpdate(minR, maxR) 
        clc;
    % Bestimmung einer Maske zur Erhöhung der Akkumulatormatrix:
    % Für jeden Kantenpixel müssen die Zellen der Matrix erhöht werden, die
    % den Kantenpixel generiert haben können. Zur Beschleunigung des
    % Verfahrens kann dies als Maske vorab initialisiert werden.
    
    % 1. Initialisierung der dreidimensionalen Maske (AUpdate) in
    %    geeigneter Größe
    %    1./2. Dimension: Mittelpunkt (m, n) der Kreise
    %    3.    Dimension: Radius (r) des Kreises
    %
    %    Befehl: zeros
   
        
    	% TODO
        imageSizeX = 40;
        imageSizeY = 40;
        radiusRange = imageSizeX/2;    %% will be the same as x-axis and y-axis of center's point (for 1 center's point we got 1 radius)
        d_winkel = 360;
        AUpdate = zeros(radiusRange, radiusRange, radiusRange);
    
    % 2. In der Maske für jeden Radius r die Punkte auf 1 setzen, deren
    %    Abstand zum Bildmittelpunkt (gerundet) r entspricht.
    %
    %    mögliche Lösung: (m, n)-Werte der Maske durchlaufen und Abstand zum 
    %    Mittelpunkt (Radius r) bestimmen und das Tripel (m, n, r) in der 
    %    Maske auf 1 setzen, wenn r im relevanten Bereich ist.
    
    
        % TODO
        [X, ~] = meshgrid(0:imageSizeX, 0:imageSizeY);
        I = zeros(size(X)-1);  % size X = [41, 41] ??
        
        x_center = imageSizeX/2;
        y_center = imageSizeY/2;
        %rad = 20;
        
        winkel = linspace(0, 2*pi, d_winkel);
        for rad = 1:20
            figure(rad); clf; 
            x_pixel = x_center + rad*cos(winkel);
            y_pixel = y_center + rad*sin(winkel);

            %% for loop to display circle at AUpdate(0, 0, 20), repeate that from AUpdate(0, 0, 1) to AUpdate(0, 0, 20) to create 3DMaske
            for i = 1:d_winkel
                I(ceil(x_pixel(:, i)), ceil(y_pixel(:, i))) = 1;
            end 
            imshow(I);
            hold on;
        end
        hold off;
end
