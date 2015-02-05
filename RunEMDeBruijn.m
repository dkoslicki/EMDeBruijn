function [dist,flow]=RunFastEMDAllPairwise(file_name1,file_name2,kmer_size)
%This is a wrapper for the FastEMD code that will take the input files and
%compute their EMD, and save the resulting distance and flow
%Kmer size is restricted to k=5, 6 or 7
addpath(genpath('FastEMD'))

%First, read in the Distance matrix
%Make sure the distance matrix is symmatrized.
D=load(sprintf('D%dSymm.mat',kmer_size));
D=D.D;
%read in file 1
fid=fopen(file_name1,'r');
P=textscan(fid,'%d');
fclose(fid);
P=double(P{:});
%normalize
P=P/sum(P);
%read in file 2
fid=fopen(file_name2,'r');
Q=textscan(fid,'%d');
fclose(fid);
Q=double(Q{:});
%normalize
Q=Q/sum(Q);
%Then run EMD
extra_mass_penalty = -1;
[dist, flow] = emd_hat_gd_metric_mex(P,Q,D,extra_mass_penalty,3);