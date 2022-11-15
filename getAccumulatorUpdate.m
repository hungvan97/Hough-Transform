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
        imageSizeX = maxR*2;
        imageSizeY = maxR*2;
        d_winkel = 360;
        
    
    % 2. In der Maske für jeden Radius r die Punkte auf 1 setzen, deren
    %    Abstand zum Bildmittelpunkt (gerundet) r entspricht.
    %
    %    mögliche Lösung: (m, n)-Werte der Maske durchlaufen und Abstand zum 
    %    Mittelpunkt (Radius r) bestimmen und das Tripel (m, n, r) in der 
    %    Maske auf 1 setzen, wenn r im relevanten Bereich ist.
    
    
        % TODO
        [X, ~] = meshgrid(0:imageSizeX, 0:imageSizeY);
        AUpdate = zeros(size(X)-1);  
        x_center = imageSizeX/2;
        y_center = imageSizeY/2;
        
        winkel = linspace(0, 2*pi, d_winkel);
        
        for rad = minR:maxR
            %figure(rad);clf; 
            x_pixel = x_center + rad*cos(winkel);
            y_pixel = y_center + rad*sin(winkel);

            for i = 1:d_winkel
                AUpdate(ceil(x_pixel(:, i)), ceil(y_pixel(:, i)), rad) = 1;
            end 
            %imshow(AUpdate(:, :, rad));
            %hold on;
            
        end
        
        %hold off;
end
