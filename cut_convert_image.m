%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        Andrea Adami - 30/07/19                          %
%         Acquire a .png image, cut it into a desired rectangle           %
%                  and convert the result in .tif format                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear

%%                              DATA

name = 'image'; % Insert the name of the image to analyze

%%                  ACQUIRE AND DISPLAY THE IMAGE

A = imread(strcat(name, '.png'));       % acquire the image
A = double(A);                          % increase the precision

figure(1)
imagesc(A)                              % display the image
colormap(jet(255))                      % change the color-code
title('Cut the image: top-left and bottom-right')

%%                         CUT THE IMAGE

[X, Y] = ginput(2);                     % acquire two points from the mouse
X = round(X);                           % round the values contained in X
Y = round(Y);                           % round the values contained in Y
A_new = A(Y(1) : Y(2), X(1) : X(2));    % define the new matrix

%%                      DISPLAY THE NEW IMAGE

A_new = A_new - min(min(A_new));        % remove the background

figure(2)
imagesc(A_new)                          % display the image
colormap(jet(255))                      % change the color-code
colorbar                                % display the color-bar

A_write = 255 * A_new / max(max(A_new));% define the matrix to save

imwrite(A_write, jet(255), strcat(name, '.tif'),'tiff') % save .tif image
