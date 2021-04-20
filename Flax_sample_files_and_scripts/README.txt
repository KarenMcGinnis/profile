Some sample flax files with bam information in them
The files were originally obtained by aligning illumina reads of different accessions and varieties against `PM_consensus.fa` using *bowtie2*. This was done on ComputeCanada's Cedar server.

The script further filters the bam files to remove reads that were messed up during the alignment, or have become separated from their paired-end read. A couple of microsatellite regions 
were present in the PM_consensus sequence, so these were removed as well. Duplicate reads were also removed. This is all in `fixmate_rmdup_coverage.sh`

Another analysis that was done on the bam files was `slurm_bcftools_PM-13Mar.sh`. This script finds variants for each of the bam files in the PM_consensus sequence. This script was written to be run 
on Cedar and requires bowtie2, samtools and bcftools. In the script it contains "module load bowtie2" etc, which loads these applications, however, these programs could be incorporated into a 
container with this script to make it more portable to other servers and independant of updates to the programs that might break the script.