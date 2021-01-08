#!/bin/bash
for X in *-001.fasta
do
    echo $X
    raxml --all --msa $X --model GTR+G4 --bs-trees 1000 --threads 1 > $X.log
done

	 
