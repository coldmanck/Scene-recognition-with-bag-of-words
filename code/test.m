num_categories = 15;
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