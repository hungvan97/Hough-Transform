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
    % vector contains "indices" of nonzero-element in matrix E
    k_pixel = find(E);
    
    % convert back to corresponding x, y axis
    sz_edge = size(E);
    [xi, yi] = ind2sub(sz_edge, k_pixel); % 1. xi: row contain edge pixel; yi: column contain edge pixel
                                          % 2. in paramter space, xi yi are
                                          % the center of the circle that
                                          % we need to draw the cone around
                                          % it
    % eliminate edge pixel Rand-nähe
    pad = maxR;
    for i = 1:length(xi)    
        if xi(i) < pad || yi(i) < pad || xi(i) > (sz_edge(2)-pad) || yi(i) > (sz_edge(1)-pad)
            xi(i) = 0;
            yi(i) = 0;
        end
    end
    xi = xi(xi~=0);
    yi = yi(yi~=0);
%     subplot(2, 2, 4)
%     scatter(yi, xi, ".")
    
    % Initialisierung der dreidimensionalen (m, n, r) Akkumulatormatrix A 
    % mit geeigneter Quantisierung der Parameter
    %
    % Befehl: zeros
    
        
        % TODO 
    A = zeros(sz_edge(1), sz_edge(2), maxR); 
   
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
    for i = 1:length(xi)
        A(xi(i)-maxR+1:xi(i)+maxR, yi(i)-maxR+1:yi(i)+maxR, :) = A_update + A(xi(i)-maxR+1:xi(i)+maxR, yi(i)-maxR+1:yi(i)+maxR, :);
    end
    %A(xi-maxR+1:xi+maxR, yi-maxR+1:yi+maxR, :) = A_update + A(xi-maxR+1:xi+maxR, yi-maxR+1:yi+maxR, :);
%     subplot(224)
%     imagesc(A(:, : , 20))
    
    
    % finde die nc größten Punkte in der Akkumulatormatrix
    % ensprechende Parameter werden in die Vektoren m, n, r geschrieben
    pre_mOut = 0;
    pre_nOut = 0;
    for it = 1:nc
        % return only the index of maximum element in all dimension
        [~, ind] = max(A(:));       
        % convert the founded linear index to subcript index in x-y-rad parameter
        [mOut(it), nOut(it), rOut(it)] = ind2sub(size(A), ind); 
        % set the maximum to 0, so we won't find these point again when we want to find the next largest
         A(mOut(it), nOut(it), rOut(it)) = 0;  
        %% for the exercise 2d
        % in each rad dimension, get rid of the center which is stay too
        % close to previous found center
        if abs(mOut(it)-pre_mOut)>5 || abs(nOut(it)-pre_nOut)>5
            pre_mOut = mOut(it);
            pre_nOut = nOut(it);
        else
            mOut(it) = [];
            nOut(it) = [];
            rOut(it) = [];
        end 
    end
end
