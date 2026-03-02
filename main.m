clear, clc, close all
addpath requirements\
results = runtests(currentProject().RootFolder, 'IncludeSubfolders', true);
table(results) % This displays a nice summary table of what passed