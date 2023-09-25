%% Script: Benchmarking the sum-function in Matlab
% Author: Philipp Kinon
clearvars; clc; close all;

sample_size=1000;
time_buildin_sample = zeros(sample_size,1);
time_handwritten_sample = zeros(sample_size,1);
random_numbers = rand(1e7,1);

for j = 1:sample_size 
    
    % built-in sum-function
    starttime = tic(); %define starting time
    b = sum(random_numbers);
    time_buildin_sample(j) = toc(starttime); %stop time sampling
    
    % handwritten sum-function
    starttime = tic();
    c = compute_handwritten_sum(random_numbers);
    time_handwritten_sample(j) = toc(starttime);

end

% Compute mean over sample
time_buildin = mean(time_buildin_sample);
time_handwritten = mean(time_handwritten_sample);

%%%%%
function handwritten_sum = compute_handwritten_sum(vector)
    
    handwritten_sum = 0;
    for vector_index=1:length(vector)
        handwritten_sum = handwritten_sum + vector(vector_index);
    end

end