# EMDeBruijn
Earth mover's distance between de Bruijn graphs

## Installation ##
First, you need to compile the FastEMD code. Go to the FastEMD sub-directory and:

In Matlab:

``>> compile_FastEMD``

In a linux shell:

``>> make``

##Usage##
The script RunEMDeBruijn.m contains a Matlab function

``[dist,flow]=RunFastEMDAllPairwise(file_name1,file_name2,kmer_size)``

The files ``file_name1`` and ``file_name2`` contain the kmer_size counts (one per line, in lexicographic order). The script will return the distance ``dist`` and the ``flow``
(a matrix of size 4^kmer_size x 4^kmer_size telling what kmer mass got moved where).

###Restrictions###
Currently, the ``kmer_size`` is restricted to 5, 6, or 7.

####Acknowledgments####
The FastEMD code is due to Ofir Pele. See the file FastEMD/README.txt
