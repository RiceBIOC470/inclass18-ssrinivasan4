% In class 18
%GB coments
1.90 using the function imfindcircles, be more strict in your radial dimensions for larger. If I change your parameters to [20 50], the result is much better and you don’t get spurious circles. 
2.90 more commentary on your results should be provided. 
overall: 90


% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  

reader4=bfGetReader('yeast.tif');
iplane=reader4.getIndex(1-1,1-1,1-1)+1;
yeast_im=bfGetPlane(reader4, iplane); 

yeast_edge=edge(yeast_im, 'Sobel');
yeast_edge = imfill(yeast_edge,'holes');
imshow(yeast_edge, []);

[center,radius] = imfindcircles(yeast_edge,[15 25],'Sensitivity',0.96);
figure; imshow(yeast_im,[]); hold on;
for i = 1:length(center)
    drawcircle(center(i,:),radius(i),'m');
end

% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 

%2A
x = randi(9,10,1);
y = randi(10,10,1);
[is_sig,pval] = ttest2(x,y);
pval;
%not significant

%2B
x = randi(20,10,1);
y = randi(60,10,1);
[is_sig,pval] = ttest2(x,y);
pval;
%significant
x = randi(4238,10,1);
y = randi(234,10,1);
[is_sig,pval] = ttest2(x,y);
pval;
%highly significant

x = randi(4938,10,1);
y = randi(4939,10,1);
[is_sig,pval] = ttest2(x,y);
pval;
%not significant


%2C
x = randi(9,100,1);
y = randi(10,100,1);
[is_sig,pval] = ttest2(x,y);
pval;
%still not significant

x = randi(20,10,1);
y = randi(60,10,1);
[is_sig,pval] = ttest2(x,y);
pval;
%significant

x = randi(4238,10,1);
y = randi(234,10,1);
[is_sig,pval] = ttest2(x,y);
pval;
% significant, lower p value than in 2B

x = randi(4938,10,1);
y = randi(4939,10,1);
[is_sig,pval] = ttest2(x,y);
pval;
%not significant


