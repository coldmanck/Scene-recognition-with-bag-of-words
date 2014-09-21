% Starter code prepared by James Hays

% This function creates a webpage (html and images) visualizing the
% classiffication results. This webpage will contain
% (1) A confusion matrix plot
% (2) A table with one row per category, with 3 columns - training
% examples, true positives, false positives, and false negatives.

% false positives are instances claimed as that category but belonging to
% another category, e.g. in the 'forest' row an image that was classified
% as 'forest' but is actually 'mountain'. This same image would be
% considered a false negative in the 'mountain' row, because it should have
% been claimed by the 'mountain' classifier but was not.

% This webpage is similar to the one we created for the SUN database in
% 2010: http://people.csail.mit.edu/jxiao/SUN/classification397.html

function create_results_webpage( train_image_paths, test_image_paths, train_labels, test_labels, categories, abbr_categories, predicted_categories)

fprintf('Creating ../results/index.md, thumbnails, and confusion matrix\n')

%number of examples of training examples, true positives, false positives,
%and false negatives. Thus the table will be num_samples * 4 images wide
%(unless there aren't enough images)
num_samples = 2; 
thumbnail_height = 75; %pixels

%delete the old thumbnails, if there are any
delete('../results/thumbnails/*.jpg')

[success,message,messageid] = mkdir('../results');
[success,message,messageid] = mkdir('../results/thumbnails');
fclose('all');
fid = fopen('../results/index.md', 'w+t');

num_categories = length(categories);

%% Create And Save Confusion Matrix
% Based on the predicted category for each test case, we will now build a
% confusion matrix. Entry (i,j) in this matrix well be the proportion of
% times a test image of ground truth category i was predicted to be
% category j. An identity matrix is the ideal case. You should expect
% roughly 50-95% along the diagonal depending on your features,
% classifiers, and particular categories. For example, suburb is very easy
% to recognize.

confusion_matrix = zeros(num_categories, num_categories);
for i=1:length(predicted_categories)
    row = find(strcmp(test_labels{i}, categories));
    column = find(strcmp(predicted_categories{i}, categories));
    confusion_matrix(row, column) = confusion_matrix(row, column) + 1;
end
%if the number of training examples and test casees are not equal, this
%statement will be invalid.
num_test_per_cat = length(test_labels) / num_categories;
confusion_matrix = confusion_matrix ./ num_test_per_cat;   
accuracy = mean(diag(confusion_matrix));
fprintf(     'Accuracy (mean of diagonal of confusion matrix) is %.3f\n', accuracy)

fig_handle = figure; 
imagesc(confusion_matrix, [0 1]); 
set(fig_handle, 'Color', [.988, .988, .988])
axis_handle = get(fig_handle, 'CurrentAxes');
set(axis_handle, 'XTick', 1:15)
set(axis_handle, 'XTickLabel', abbr_categories)
set(axis_handle, 'YTick', 1:15)
set(axis_handle, 'YTickLabel', categories)

%visualization_image = frame2im(getframe(fig_handle));
% getframe() is unreliable. Depending on the rendering settings, it will
% grab foreground windows instead of the figure in question. It could also
% return a partial image.
%imwrite(visualization_image, '../results/confusion_matrix.png')
saveas(fig_handle, '../results/confusion_matrix.png')

%% Create webpage header

%fprintf(fid,'<!DOCTYPE html>\n');
%fprintf(fid,'<html>\n');
%fprintf(fid,'<head>\n');
%fprintf(fid,'<link href=''http://fonts.googleapis.com/css?family=Nunito:300|Crimson+Text|Droid+Sans+Mono'' rel=''stylesheet'' type=''text/css''>\n');
%fprintf(fid,'<style type="text/css">\n');

%fprintf(fid,'body {\n');
%fprintf(fid,'  margin: 0px;\n');
%fprintf(fid,'  width: 100%%;\n');
%fprintf(fid,'  font-family: ''Crimson Text'', serif;\n');
%fprintf(fid,'  background: #fcfcfc;\n');
%fprintf(fid,'}\n');
%fprintf(fid,'table td {\n');
%fprintf(fid,'  text-align: center;\n');
%fprintf(fid,'  vertical-align: middle;\n');
%fprintf(fid,'}\n');
%fprintf(fid,'h1 {\n');
%fprintf(fid,'  font-family: ''Nunito'', sans-serif;\n');
%fprintf(fid,'  font-weight: normal;\n');
%fprintf(fid,'  font-size: 28px;\n');
%fprintf(fid,'  margin: 25px 0px 0px 0px;\n');
%fprintf(fid,'  text-transform: lowercase;\n');
%fprintf(fid,'}\n');
%fprintf(fid,'.container {\n');
%fprintf(fid,'  margin: 0px auto 0px auto;\n');
%fprintf(fid,'  width: 1160px;\n');
%fprintf(fid,'}\n');

%fprintf(fid,'</style>\n');
%fprintf(fid,'</head>\n');
%fprintf(fid,'<body>\n\n');

%fprintf(fid,'<div class="container">\n\n\n');
fprintf(fid,'<center>\n');
fprintf(fid,'<h1>Project 3 results visualization</h1>\n');
fprintf(fid,'<img src="confusion_matrix.png">\n\n');
fprintf(fid,'<br>\n');
fprintf(fid,'Accuracy (mean of diagonal of confusion matrix) is %.3f\n', accuracy);
fprintf(fid,'<p>\n\n');

%% Create results table
fprintf(fid,'<table border=0 cellpadding=4 cellspacing=1>\n');
fprintf(fid,'<tr>\n');
fprintf(fid,'<th>Category name</th>\n');
fprintf(fid,'<th>Accuracy</th>\n');
fprintf(fid,'<th colspan=%d>Sample training images</th>\n', num_samples);
fprintf(fid,'<th colspan=%d>Sample true positives</th>\n', num_samples);
fprintf(fid,'<th colspan=%d>False positives with true label</th>\n', num_samples);
fprintf(fid,'<th colspan=%d>False negatives with wrong predicted label</th>\n', num_samples);
fprintf(fid,'</tr>\n');

for i = 1:num_categories
	fprintf(fid,'<tr>\n');
    
    fprintf(fid,'<td>'); %category name
    fprintf(fid,'%s', categories{i}); 
    fprintf(fid,'</td>\n');
    
    fprintf(fid,'<td>'); %category accuracy
    fprintf(fid,'%.3f', confusion_matrix(i,i)); 
    fprintf(fid,'</td>\n');
    
    %collect num_samples random paths to images of each type. 
    %Training examples. 
    train_examples = train_image_paths(strcmp(categories{i}, train_labels));
    %True positives. There might not be enough of these if the classifier
    %is bad
    true_positives = test_image_paths(strcmp(categories{i}, test_labels) & ...
                                      strcmp(categories{i}, predicted_categories)); 
    %False positives. There might not be enough of them if the classifier
    %is good
    false_positive_inds = ~strcmp(categories{i}, test_labels) & ...
                           strcmp(categories{i}, predicted_categories);
    false_positives  = test_image_paths(false_positive_inds);  
    false_positive_labels = test_labels(false_positive_inds);
    
    %False negatives. There might not be enough of them if the classifier
    %is good
    false_negative_inds = strcmp(categories{i}, test_labels) & ...
                         ~strcmp(categories{i}, predicted_categories);
    false_negatives = test_image_paths( false_negative_inds ); 
    false_negative_labels = predicted_categories(false_negative_inds);

	%Randomize each list of files
    train_examples  = train_examples( randperm(length(train_examples)));
    true_positives  = true_positives( randperm(length(true_positives)));
    
    false_positive_shuffle = randperm(length(false_positives));
    false_positives = false_positives(false_positive_shuffle);
    false_positive_labels = false_positive_labels(false_positive_shuffle);
    
    false_negative_shuffle = randperm(length(false_negatives));
    false_negatives = false_negatives(false_negative_shuffle);
    false_negative_labels = false_negative_labels(false_negative_shuffle);
    
    %Truncate each list to length at most num_samples
    train_examples  = train_examples( 1:min(length(train_examples), num_samples));
    true_positives  = true_positives( 1:min(length(true_positives), num_samples));
    false_positives = false_positives(1:min(length(false_positives),num_samples));
    false_positive_labels = false_positive_labels(1:min(length(false_positive_labels),num_samples));
    false_negatives = false_negatives(1:min(length(false_negatives),num_samples));
    false_negative_labels = false_negative_labels(1:min(length(false_negative_labels),num_samples));
    
    %sample training images
    %Create and save all of the thumbnails
    for j=1:num_samples
        if(j <= length(train_examples))
            tmp = imread(train_examples{j});
            height = size(tmp,1);
            rescale_factor = thumbnail_height / height;
            tmp = imresize(tmp, rescale_factor);
            [height, width] = size(tmp);

            [pathstr,name, ext] = fileparts(train_examples{j});
            imwrite(tmp, ['../results/thumbnails/' categories{i} '_' name '.jpg'], 'quality', 100)
            fprintf(fid,'<td bgcolor=LightBlue>');
            fprintf(fid,'<img src="%s" width=%d height=%d>', ['thumbnails/' categories{i} '_' name '.jpg'], width, height);
            fprintf(fid,'</td>\n');
        else
            fprintf(fid,'<td bgcolor=LightBlue>');
            fprintf(fid,'</td>\n');
        end
    end
    
    for j=1:num_samples
        if(j <= length(true_positives))
            tmp = imread(true_positives{j});
            height = size(tmp,1);
            rescale_factor = thumbnail_height / height;
            tmp = imresize(tmp, rescale_factor);
            [height, width] = size(tmp);

            [pathstr,name, ext] = fileparts(true_positives{j});
            imwrite(tmp, ['../results/thumbnails/' categories{i} '_' name '.jpg'], 'quality', 100)
            fprintf(fid,'<td bgcolor=LightGreen>');
            fprintf(fid,'<img src="%s" width=%d height=%d>', ['thumbnails/' categories{i} '_' name '.jpg'], width, height);
            fprintf(fid,'</td>\n');
        else
            fprintf(fid,'<td bgcolor=LightGreen>');
            fprintf(fid,'</td>\n');
        end
    end
    
    for j=1:num_samples
        if(j <= length(false_positives))
            tmp = imread(false_positives{j});
            height = size(tmp,1);
            rescale_factor = thumbnail_height / height;
            tmp = imresize(tmp, rescale_factor);
            [height, width] = size(tmp);

            [pathstr,name, ext] = fileparts(false_positives{j});
            imwrite(tmp, ['../results/thumbnails/' false_positive_labels{j} '_' name '.jpg'], 'quality', 100)
            fprintf(fid,'<td bgcolor=LightCoral>');
            fprintf(fid,'<img src="%s" width=%d height=%d>', ['thumbnails/' false_positive_labels{j} '_' name '.jpg'], width, height);
            fprintf(fid,'<br><small>%s</small>', false_positive_labels{j});
            fprintf(fid,'</td>\n');
        else
            fprintf(fid,'<td bgcolor=LightCoral>');
            fprintf(fid,'</td>\n');
        end
    end
    
    for j=1:num_samples
        if(j <= length(false_negatives))
            tmp = imread(false_negatives{j});
            height = size(tmp,1);
            rescale_factor = thumbnail_height / height;
            tmp = imresize(tmp, rescale_factor);
            [height, width] = size(tmp);

            [pathstr,name, ext] = fileparts(false_negatives{j});
            imwrite(tmp, ['../results/thumbnails/' categories{i} '_' name '.jpg'], 'quality', 100)
            fprintf(fid,'<td bgcolor=#FFBB55>');
            fprintf(fid,'<img src="%s" width=%d height=%d>', ['thumbnails/' categories{i} '_' name '.jpg'], width, height);
            fprintf(fid,'<br><small>%s</small>', false_negative_labels{j});
            fprintf(fid,'</td>\n');
        else
            fprintf(fid,'<td bgcolor=#FFBB55>');
            fprintf(fid,'</td>\n');
        end
    end
    
    fprintf(fid,'</tr>\n');
end

fprintf(fid,'<tr>\n');
fprintf(fid,'<th>Category name</th>\n');
fprintf(fid,'<th>Accuracy</th>\n');
fprintf(fid,'<th colspan=%d>Sample training images</th>\n', num_samples);
fprintf(fid,'<th colspan=%d>Sample true positives</th>\n', num_samples);
fprintf(fid,'<th colspan=%d>False positives with true label</th>\n', num_samples);
fprintf(fid,'<th colspan=%d>False negatives with wrong predicted label</th>\n', num_samples);
fprintf(fid,'</tr>\n');

fprintf(fid,'</table>\n');
fprintf(fid,'</center>\n\n\n');
%fprintf(fid,'</div>\n')

%% Create end of web page
%fprintf(fid,'</body>\n');
%fprintf(fid,'</html>\n');
fclose(fid);
