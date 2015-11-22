# Meng-Jiun Chiou (邱盟竣) <span style="color:red">NCTU</span>

# Project 3 / Scene recognition with bag of words

## Overview
The project is related to the whole process of image classification. It required to implement all of the process, including feature representation and classiication.

## Implementation
There're actually five `.m` file should be completed in this project, which are `get_tiny_images.m`, `nearest_neighbor_classify.m`, `build_vocabulary.m`, `get_bags_of_sifts.m`, and `svm_classify.m`.

- **Using tiny images as feature representation**

With [VLFeat](http://www.vlfeat.org/), one can easily extract SIFT from any image. In my implementation I used Matlab interface of VLFeat to get the descriptors. To build a tiny image feature, simply resize the original image to a very small square resolution, e.g. 16x16. 

In my `get_tiny_images.m`, mainly codes like below:
```
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
    new_img = new_img ./ sum(new_img);
    new_img = new_img - mean(new_img);
    
    image_feats = [image_feats; new_img];
end
```
note that new_img vectors are normalized as unit length and zero mean.

- **Classifying by the Nearest Neighbor**

One of the easiest way to dealing with classification problem is by nearest neighbor approach. Just find the **nearest** training pictures of testing pictures. However, this approach is easily affected by noises.

In my `nearest_neighbor_classify.m`, mainly codes like below:
```
dist = vl_alldist2(train_image_feats', test_image_feats');
dist = dist';

predicted_categories = [];
for i = 1:size(test_image_feats,1)
    [Y, I] = min(dist(i, :));
    label = train_labels(I, 1);
    predicted_categories = [predicted_categories; label];
end
```

- **Turning to better method: SIFT and Bag-Of-Features**

Beyond the easily but worse-performance approaches like tiny pictures, one more popular and much better approach of feature representation is the combination of SIFT and Bag-of-Features. To implement, one should firstly build an **vocabulary dictionary**, which is essentially visual words clusters. 

In my `build_vocabulary.m` file, 
```
step = 15;
bin_size = 8;
features = [];

for i = 1:length(image_paths)
    img = single( imread(image_paths{i}) );
    if size(img, 3) > 1
        img =rgb2gray(img);
    end
    [locations, SIFT_features] = vl_dsift(img, 'fast', 'step', step, 'size', bin_size);
    features = [features, SIFT_features];
end

[centers, assignments] = vl_kmeans(double(features), vocab_size)
vocab = centers';
```
note that one could choose different parameters (step, bin_size, etc.) to optimize the result.

Next, assign the nearest visual word to each SIFT features, and then obtain the histogram representation of each picture.
In my `get_bags_of_sifts.m` file, 
```
for i = 1:length(image_paths)
    img = single( imread(image_paths{i}) );
    if size(img, 3) > 1
        img =rgb2gray(img);
    end
    
    [locations, SIFT_features] = vl_dsift(img, 'step', step, 'size', bin_size);
    
    [index , dist] = vl_kdtreequery(forest , vocab' , double(SIFT_features));
    
    feature_hist = hist(double(index), vocab_size);
    feature_hist = feature_hist ./ sum(feature_hist);
    % feature_hist = feature_hist ./ norm(feature_hist);
    
    image_feats(i, :) = feature_hist;
end
```

- **Classification with Support Vector Machine**

One of the most popular and high-accuracy approach of classification is Support Vector Machine (SVM). Linear SVM can be good when applied to data which are of high dimension. 

In my `svm_classiy.m` file, I first construct the labels of all training data:
```
for i = 1:num_categories
    matching_indices = strcmp(categories(i) , train_labels);
    matching_indices = double(matching_indices);
    for j = 1: size(train_labels, 1)
        if(matching_indices(j) == 0)
            matching_indices(j) = -1;
        end
    end
```
then, train a linear SVM classifier with `vl_svmtrain()` and record scores:
```
[w, b] = vl_svmtrain(train_image_feats', matching_indices, lambda);
scores = [scores; (w' * test_image_feats' + b) ];
```
Finally, pick the highest scores (even smaller than zero, it's fine):
```
% get maximum scores
[max_values, max_indices] = max(scores);
predicted_categories = categories(max_indices');
```

In addition, I also implement **non-linear SVM (RBF kernel)** with prestigious library `LibSVM`. I make it automated-tuning with parameters *C* and *gamma*. In my `libsvm_classify.m`:
```
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

% train model using best_C and best_gamma
best_C = 2^C(idx);
best_gamma = 2^gamma(idx);

SVM = svmtrain(total_matching_indices, train_image_feats, sprintf('-c %f -g %f', 2^C(i), 2^gamma(i)));
% total_matching_indices ~= test_image_labels as using 100 pics per class orderly
[predicted_label, acc, dic_value] = svmpredict(total_matching_indices, test_image_feats, SVM);
fprintf('Best C = 2^%d, Best gamma = 2^%d\n', C(idx), gamma(idx));

predicted_categories = categories(predicted_label);
```

## Installation
Download the repository, open your matlab and change the work folder to `homework3/code`. Then, set images path of `homework3/data`.

Finally, click *Run*!

### Results

<center>
<h1>Tiny images representation and nearest neighbor classifier</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.201
<p>

<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
<tr>
<td>Kitchen</td>
<td>0.060</td>
<td bgcolor=LightBlue><img src="../data/train/Kitchen/image_0210.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="../data/train/Kitchen/image_0087.jpg" width=114 height=75></td>
<td bgcolor=LightGreen><img src="../data/train/Kitchen/image_0175.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="../data/train/Kitchen/image_0110.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="../data/train/Office/image_0131.jpg" width=119 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="../data/train/InsideCity/image_0069.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="../data/train/Kitchen/image_0036.jpg" width=57 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="../data/train/Kitchen/image_0156.jpg" width=91 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.010</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0250.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0126.jpg" width=88 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0009.jpg" width=100 height=75></td>
<td bgcolor=LightGreen></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0084.jpg" width=107 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0029.jpg" width=63 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0033.jpg" width=95 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0057.jpg" width=100 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.130</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0204.jpg" width=54 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0147.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0063.jpg" width=115 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0104.jpg" width=95 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0135.jpg" width=108 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0074.jpg" width=100 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0092.jpg" width=116 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0160.jpg" width=111 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.060</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0267.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0103.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0021.jpg" width=109 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0003.jpg" width=114 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0114.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0116.jpg" width=126 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0010.jpg" width=100 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0011.jpg" width=110 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.070</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0033.jpg" width=108 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0039.jpg" width=126 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0144.jpg" width=115 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0010.jpg" width=107 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0192.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0176.jpg" width=57 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0077.jpg" width=127 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0001.jpg" width=101 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.030</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0077.jpg" width=57 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0044.jpg" width=115 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0091.jpg" width=57 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0106.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Suburb_image_0009.jpg" width=113 height=75><br><small>Suburb</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0118.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0105.jpg" width=113 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0046.jpg" width=57 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.220</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0209.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0099.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0074.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0003.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0102.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0140.jpg" width=98 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0175.jpg" width=113 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0107.jpg" width=113 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.070</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0261.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0259.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0140.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0089.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0115.jpg" width=89 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0069.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0077.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0023.jpg" width=75 height=75><br><small>Forest</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.170</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0304.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0336.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0059.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0127.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0121.jpg" width=118 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0117.jpg" width=102 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0080.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0044.jpg" width=75 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.380</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0097.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0261.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0016.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0048.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0153.jpg" width=114 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0010.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0147.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0047.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.580</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0129.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0073.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0085.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0078.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0022.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0141.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0014.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0087.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.380</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0186.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0271.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0060.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0013.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0139.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0056.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0010.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0028.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.470</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0267.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0190.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0051.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0005.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0117.jpg" width=71 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0125.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0012.jpg" width=75 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0047.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.180</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0180.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0099.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0006.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0055.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0017.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0063.jpg" width=128 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0027.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0001.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.200</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0055.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0265.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0079.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0008.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0014.jpg" width=44 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0094.jpg" width=64 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0070.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0040.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
</table>
</center>

<center>
<h1>Bag of SIFT representation and nearest neighbor classifier</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.463
<p>

<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
<tr>
<td>Kitchen</td>
<td>0.360</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0032.jpg" width=57 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0112.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0050.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0056.jpg" width=99 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0127.jpg" width=119 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0071.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0031.jpg" width=57 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0125.jpg" width=114 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.400</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0129.jpg" width=60 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0064.jpg" width=57 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0076.jpg" width=54 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0014.jpg" width=44 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0140.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0016.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0033.jpg" width=95 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0096.jpg" width=57 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.120</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0061.jpg" width=97 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0111.jpg" width=116 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0113.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0140.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0104.jpg" width=115 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0096.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0152.jpg" width=106 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0016.jpg" width=97 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.270</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0253.jpg" width=74 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0212.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0116.jpg" width=51 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0122.jpg" width=120 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0029.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0084.jpg" width=107 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0010.jpg" width=100 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0024.jpg" width=100 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.700</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0008.jpg" width=130 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0132.jpg" width=116 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0038.jpg" width=119 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0080.jpg" width=102 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0094.jpg" width=64 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0067.jpg" width=70 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0150.jpg" width=92 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0126.jpg" width=108 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.310</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0212.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0134.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0139.jpg" width=55 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0006.jpg" width=114 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0044.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0128.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0087.jpg" width=112 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0027.jpg" width=92 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.850</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0235.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0124.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0162.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0077.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0027.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0042.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0103.jpg" width=113 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0171.jpg" width=113 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.270</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0221.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0174.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0029.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0023.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0098.jpg" width=91 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0053.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0050.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0051.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.360</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0210.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0231.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0006.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0029.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0101.jpg" width=101 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0112.jpg" width=133 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0107.jpg" width=75 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0098.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.500</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0039.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0255.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0010.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0022.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0092.jpg" width=116 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0041.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0047.jpg" width=75 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0143.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.750</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0072.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0073.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0155.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0089.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0014.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0039.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0026.jpg" width=75 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0140.jpg" width=75 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.360</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0124.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0152.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0086.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0106.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0093.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0008.jpg" width=114 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0091.jpg" width=75 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0014.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.350</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0231.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0200.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0085.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0094.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0117.jpg" width=102 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0097.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0092.jpg" width=75 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0113.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.460</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0167.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0195.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0114.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0089.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0031.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0116.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0022.jpg" width=75 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0103.jpg" width=75 height=75><br><small>Forest</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.890</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0143.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0104.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0139.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0009.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0070.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0101.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0128.jpg" width=75 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0035.jpg" width=75 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
</table>
</center>

<center>
<h1>Bag of SIFT representation and linear SVM classifier</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.614
<p>

<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
<tr>
<td>Kitchen</td>
<td>0.570</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0079.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0103.jpg" width=103 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0166.jpg" width=111 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0118.jpg" width=57 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0023.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0157.jpg" width=90 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0123.jpg" width=114 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0021.jpg" width=100 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.440</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0072.jpg" width=74 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0145.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0076.jpg" width=54 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0114.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0124.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0061.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0070.jpg" width=101 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0141.jpg" width=125 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.350</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0193.jpg" width=105 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0028.jpg" width=97 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0090.jpg" width=108 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0033.jpg" width=101 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0084.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0150.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0170.jpg" width=93 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0087.jpg" width=50 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.180</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0220.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0038.jpg" width=99 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0093.jpg" width=116 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0116.jpg" width=51 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0128.jpg" width=115 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0108.jpg" width=133 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0142.jpg" width=100 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0043.jpg" width=100 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.900</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0184.jpg" width=109 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0078.jpg" width=116 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0114.jpg" width=117 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0168.jpg" width=112 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0132.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0117.jpg" width=114 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0155.jpg" width=118 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0148.jpg" width=100 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.400</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0078.jpg" width=105 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0034.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0045.jpg" width=61 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0040.jpg" width=135 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0017.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0002.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0001.jpg" width=67 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0125.jpg" width=46 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.960</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0151.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0224.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0046.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0119.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0116.jpg" width=126 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0138.jpg" width=100 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0041.jpg" width=113 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0053.jpg" width=113 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.470</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0242.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0018.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0104.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0105.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0060.jpg" width=57 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0086.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0095.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0041.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.690</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0148.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0331.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0044.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0080.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0102.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0123.jpg" width=120 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0127.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0083.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.540</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0173.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0005.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0136.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0012.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0084.jpg" width=110 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0043.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0105.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0045.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.820</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0120.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0049.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0105.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0068.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0080.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0004.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0026.jpg" width=75 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0136.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.380</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0398.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0130.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0120.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0112.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0140.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0096.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0038.jpg" width=75 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0122.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.810</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0034.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0326.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0077.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0056.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0136.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0122.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0114.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0036.jpg" width=75 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.810</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0276.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0226.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0031.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0037.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0048.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0040.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0091.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0081.jpg" width=75 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.890</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0055.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0189.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0138.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0127.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0046.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0001.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0110.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0124.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
</table>
</center>

<center>
<h1>Bag of SIFT representation and Non-linear SVM classifier (LibSVM with RBF kernel)</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.615
<p>

<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
<tr>
<td>Kitchen</td>
<td>0.540</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0083.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0004.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0072.jpg" width=107 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0009.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0143.jpg" width=110 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0119.jpg" width=108 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0075.jpg" width=107 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0044.jpg" width=90 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.490</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0066.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0119.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0015.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0086.jpg" width=111 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0122.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0096.jpg" width=78 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0056.jpg" width=100 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0090.jpg" width=112 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.360</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0216.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0197.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0156.jpg" width=99 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0119.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0025.jpg" width=113 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0057.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0081.jpg" width=107 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0153.jpg" width=114 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.340</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0030.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0193.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0086.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0088.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0056.jpg" width=113 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0140.jpg" width=103 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0022.jpg" width=100 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0136.jpg" width=100 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.750</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0053.jpg" width=111 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0090.jpg" width=107 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0103.jpg" width=104 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0150.jpg" width=92 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0020.jpg" width=113 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0111.jpg" width=88 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0089.jpg" width=92 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0012.jpg" width=87 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.470</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0031.jpg" width=99 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0097.jpg" width=57 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0139.jpg" width=55 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0132.jpg" width=51 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0062.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0136.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0101.jpg" width=113 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0108.jpg" width=100 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.920</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0090.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0218.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0102.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0147.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0102.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0114.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0154.jpg" width=113 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0155.jpg" width=113 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.500</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0242.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0070.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0097.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0104.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0087.jpg" width=112 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0121.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0001.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0007.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.570</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0233.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0011.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0059.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0117.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0126.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0007.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0040.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0048.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.610</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0043.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0004.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0138.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0141.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0140.jpg" width=98 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0038.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0109.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0074.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.820</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0073.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0016.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0053.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0056.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0005.jpg" width=114 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0058.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0001.jpg" width=75 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0020.jpg" width=75 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.530</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0363.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0342.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0054.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0082.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0021.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0102.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0064.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0027.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.710</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0189.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0326.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0079.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0029.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0034.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0022.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0113.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0017.jpg" width=75 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.730</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0345.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0208.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0032.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0049.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0162.jpg" width=113 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0012.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0075.jpg" width=75 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0082.jpg" width=75 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.890</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0003.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0162.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0044.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0059.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0076.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0057.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0117.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0010.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
</table>
</center>
