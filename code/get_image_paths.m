% Starter code prepared by James Hays

%This function returns cell arrays containing the file path for each train
%and test image, as well as cell arrays with the label of each train and
%test image. By default all four of these arrays will be 1500x1 where each
%entry is a char array (or string).
function [train_image_paths, test_image_paths, train_labels, test_labels] = ... 
    get_image_paths(data_path, categories, num_train_per_cat)

num_categories = length(categories); %number of scene categories.

%This paths for each training and test image. By default it will have 1500
%entries (15 categories * 100 training and test examples each)
train_image_paths = cell(num_categories * num_train_per_cat, 1);
test_image_paths  = cell(num_categories * num_train_per_cat, 1);

%The name of the category for each training and test image. With the
%default setup, these arrays will actually be the same, but they are built
%independently for clarity and ease of modification.
train_labels = cell(num_categories * num_train_per_cat, 1);
test_labels  = cell(num_categories * num_train_per_cat, 1);

for i=1:num_categories
   images = dir( fullfile(data_path, 'train', categories{i}, '*.jpg'));
   for j=1:num_train_per_cat
       train_image_paths{(i-1)*num_train_per_cat + j} = fullfile(data_path, 'train', categories{i}, images(j).name);
       train_labels{(i-1)*num_train_per_cat + j} = categories{i};
   end
   
   images = dir( fullfile(data_path, 'test', categories{i}, '*.jpg'));
   for j=1:num_train_per_cat
       test_image_paths{(i-1)*num_train_per_cat + j} = fullfile(data_path, 'test', categories{i}, images(j).name);
       test_labels{(i-1)*num_train_per_cat + j} = categories{i};
   end
end
