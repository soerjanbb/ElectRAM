clear, clc, close all
addpath requirements\
slreq.open('Electram Requirements.slreqx')
results = runtests(currentProject().RootFolder, 'IncludeSubfolders', true);
table(results)