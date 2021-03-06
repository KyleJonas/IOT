clear;
clc;
close all; % closes all figures

coifImages = csvread('coifData.csv');
dbImages = csvread('dbData.csv');

allPixelData = [coifImages, dbImages];

width = size(allPixelData, 2);

normalizedData = [];

disp('Starting normalization...');

for i = 1:width
    column = allPixelData(:,i);
    normalValue = (column - mean(column)) / std(column);
    normalizedData = [normalizedData, normalValue];
    
    if (mod(i, 100) == 0)
        fprintf('%d out of %d columns processed\n', i, width);
    end
end

csvwrite('normalization.csv',normalizedData);
