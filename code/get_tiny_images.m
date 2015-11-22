% Starter code prepared by James Hays

%This feature is inspired by the simple tiny images used as features in 
%  80 million tiny images: a large dataset for non-parametric object and
%  scene recognition. A. Torralba, R. Fergus, W. T. Freeman. IEEE
%  Transactions on Pattern Analysis and Machine Intelligence, vol.30(11),
%  pp. 1958-1970, 2008. http://groups.csail.mit.edu/vision/TinyImages/

function image_feats = get_tiny_images(image_paths)
% image_paths is an N x 1 cell array of strings where each string is an
%  image path on the file system.
% image_feats is an N x d matrix of resized and then vectorized tiny
%  images. E.g. if the images are resized to 16x16, d would equal 256.

% To build a tiny image feature, simply resize the original image to a very
% small square resolution, e.g. 16x16. You can either resize the images to
% square while ignoring their aspect ratio or you can crop the center
% square portion out of each image. Making the tiny images zero mean and
% unit length (normalizing them) will increase performance modestly.

% suggested functions: imread, imresize

image_feats = [];
length = 16;

for i = 1:size(image_paths)
    img = imread(image_paths{i, 1});
    img = imresize(img, [length length]);
    
    new_img = [];
    for j = 1:length
        new_img = [new_img, img(j, :)];
    end
    
    new_img = double(new_img);
    new_img = new_img ./ norm(new_img);
    new_img = new_img - mean(new_img);
    
    image_feats = [image_feats; new_img];
end