#!/bin/bash
# Usage: bootstrap.sh alignment # of_bootstrap_replicates
##Example: bootstrap.sh art.fasta 1000 

raxml --all --threads 1 --msa $1 --model GTR+G --tree pars{10} --bs-trees $2


##bootstrap.sh sim100.fasta 1000 
