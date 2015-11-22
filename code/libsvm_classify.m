% Starter code prepared by James Hays

%This function will train a linear SVM for every category (i.e. one vs all)
%and then use the learned linear classifiers to predict the category of
%every test image. Every test feature will be evaluated with all 15 SVMs
%and the most confident SVM will "win". Confidence, or distance from the
%margin, is W*X + B where '*' is the inner product or dot product and W and
%B are the learned hyperplane parameters.

function predicted_categories = libsvm_classify(train_image_feats, train_labels, test_image_feats)
% image_feats is an N x d matrix, where d is the dimensionality of the
%  feature representation.
% train_labels is an N x 1 cell array, where each entry is a string
%  indicating the ground truth category for each training image.
% test_image_feats is an M x d matrix, where d is the dimensionality of the
%  feature representation. You can assume M = N unless you've modified the
%  starter code.
% predicted_categories is an M x 1 cell array, where each entry is a string
%  indicating the predicted category for each test image.

%{
Useful functions:
 matching_indices = strcmp(string, cell_array_of_strings)
 
  This can tell you which indices in train_labels match a particular
  category. This is useful for creating the binary labels for each SVM
  training task.

[W B] = vl_svmtrain(features, labels, LAMBDA)
  http://www.vlfeat.org/matlab/vl_svmtrain.html

  This function trains linear svms based on training examples, binary
  labels (-1 or 1), and LAMBDA which regularizes the linear classifier
  by encouraging W to be of small magnitude. LAMBDA is a very important
  parameter! You might need to experiment with a wide range of values for
  LAMBDA, e.g. 0.00001, 0.0001, 0.001, 0.01, 0.1, 1, 10.

  Matlab has a built in SVM, see 'help svmtrain', which is more general,
  but it obfuscates the learned SVM parameters in the case of the linear
  model. This makes it hard to compute "confidences" which are needed for
  one-vs-all classification.

%}

%unique() is used to get the category list from the observed training
%category list. 'categories' will not be in the same order as in proj3.m,
%because unique() sorts them. This shouldn't really matter, though.


%{
categories = unique(train_labels); 
num_categories = length(categories);

lambda = 1e-06;
scores = [];

for i = 1:num_categories
    % Create a training label
    matching_indices = strcmp(categories(i) , train_labels);
    matching_indices = double(matching_indices);
    for j = 1: size(train_labels, 1)
        if(matching_indices(j) == 0)
            matching_indices(j) = -1;
        end
    end
    
    % Train a linvear SVM classifier
    [w, b] = vl_svmtrain(train_image_feats', matching_indices, lambda);
    
    scores = [scores; (w' * test_image_feats' + b) ];
end

% get maximum scores
[max_values, max_indices] = max(scores);
predicted_categories = categories(max_indices');
%}

categories = unique(train_labels);
num_categories = length(categories);

total_matching_indices = zeros(1500, 1);
for i = 1:num_categories
	matching_indices = strcmp(categories(i) , train_labels);
	matching_indices = double(matching_indices);
	for j = 1: size(train_labels, 1)
		if(matching_indices(j) == 1)
			matching_indices(j) = i;
		end
	end
	total_matching_indices = total_matching_indices + matching_indices;
end
% total_matching_indices = [1;1;1;...;1;2;2;2...2;2.....15;15;15]

addpath('~/lib/libsvm-316');
addpath('~/lib/libsvm-316/matlab')

% grid of parameters
folds = 5;
[C,gamma] = meshgrid(-5:2:15, -15:2:3);

% grid search, and cross-validation
cv_acc = zeros(numel(C),1);
for i=1:numel(C)
    cv_acc(i) = svmtrain(total_matching_indices, train_image_feats, sprintf('-c %f -g %f -v %d', 2^C(i), 2^gamma(i), folds));
end

% pair (C,gamma) with best accuracy
[~,idx] = max(cv_acc);

% now you can train you model using best_C and best_gamma
best_C = 2^C(idx);
best_gamma = 2^gamma(idx);

SVM = svmtrain(total_matching_indices, train_image_feats, sprintf('-c %f -g %f', 2^C(i), 2^gamma(i)));
% [predicted_label, acc, dic_value] = svmpredict(nan(size(test_image_feats, 1), 1), test_image_feats, SVM); % not use real true test label
% total_matching_indices ~= test_image_labels as using 100 pics per class orderly
[predicted_label, acc, dic_value] = svmpredict(total_matching_indices, test_image_feats, SVM);
fprintf('Best C = 2^%d, Best gamma = 2^%d\n', C(idx), gamma(idx));

predicted_categories = categories(predicted_label);
