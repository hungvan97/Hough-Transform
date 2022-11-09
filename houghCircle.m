function [mOut, nOut, rOut] = houghCircle(E, nc, minR, maxR)
% Findet nc Kreise in einem Kantenbild E mit Radius zwischen minR und maxR
% mit Hilfe der Hough-Transformation für Kreise.
%
% Eingabe: E - Kantenbild
%          nc - maximale Anzahl an Kreisen
%          minR, maxR - minimaler/maximaler Radius der gesuchten Kreise
% Ausgabe: [mOut, nOut, rOut] - Parameter der gefundenen Kreise 
%                               (Mittelpunkt, Radius)

    % Initialisierung
    mOut = zeros(1, nc);
    nOut = zeros(1, nc);
    rOut = zeros(1, nc);
      
    % Bestimmung aller Kantenpixel im Kantenbild
    %
    % Befehl: find
    
    
        % TODO
    k_pixel = find(I_edge); %% vector contains "indices" of nonzero-element in matrix I_edge
    % convert back to corresponding x, y axis
    sz_edge = size(I_edge);
    [xi, yi] = ind2sub(sz_edge, k_pixel); % xi: row contain edge pixel; yi: column contain edge pixel
    
    % Initialisierung der dreidimensionalen (m, n, r) Akkumulatormatrix A 
    % mit geeigneter Quantisierung der Parameter
    %
    % Befehl: zeros
    
        
        % TODO   
    % initialise accumulator matrix, should have the same size = [20, 20, 20] to A_update (the matrix used to update A)
    A = zeros(20, 20, 20); 
   
    % Bestimmung der Update-Maske für die Akkumulatormatrix
    A_update = getAccumulatorUpdate(minR, maxR);    
    
    % Kantenpixel durchlaufen und Akkumulatormatrix erhöhen, d.h.
    % Update-Maske an entsprechender Position addieren.
    %
    % Matlab kann nur Matrizen gleicher Größe addieren, Sie müssen daher
    % den entsprechenden Bereich aus der Akkumulatormatrix auswählen.
    %
    % Achten Sie auch auf eine geeignete Randbehandlung.
    
    
        % TODO
    A = A + A_update + "corresponding each_pixel in accumulator cooridination"
    
    % finde die nc größten Punkte in der Akkumulatormatrix
    % ensprechende Parameter werden in die Vektoren m, n, r geschrieben
    for it = 1:nc
        [~, ind] = max(A(:));
        [mOut(it), nOut(it), rOut(it)] = ind2sub(size(A), ind);
        A(mOut(it), nOut(it), rOut(it)) = 0;
    end
end
