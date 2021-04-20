#!/bin/bash
#SBATCH --time=0:30:00
#SBATCH --account=def-hmb959
#SBATCH --job-name=bcftools
#SBATCH --output=%j-%x.out
#SBATCH --cpus-per-task=4               # number of threads
#SBATCH --mem-per-cpu=4G      # memory; default unit is megabytes

#Performs standard bcftools analysis on a bam file

#module load bcftools

> bamfilelist.txt	#list of sorted bam files
> bcflist.txt		#list of sample bcf
> newsamplelist.txt	#list of new sample bcf


#Set references sequence. Just a fasta file of the target sequences
reference_seq="PM_consensus.fa"
startingbcf="36gtype.mpileup.bcf"

printf "Pileup and variant calling. Performed on all bam files\n"
\ls *.bam > bamfilelist.txt

bcftools mpileup --threads 4 -C 50 -O u -a AD,DP,ADF,ADR -f ${reference_seq} -b bamfilelist.txt | \
    	#Adjusting MQ using -C 50. Including DP and AD tags.

bcftools norm --threads 4 -m+any -c s -O u -f ${reference_seq} | \
    	#join biallelic sites into a single multiallelic one using -m+. Does noth SNPs and INDELs (-m+ any).Fix bad sites (in ref seq?) using -c s

bcftools call --threads 4 -m -v -G- -O b -o multisample.call.bcf
    	#each sample is called individually and no HWE called (using -G-). Only variants called (-v). Output vcf to stdout

#sed -e 's/.\///g' -e 's/.sort.bam//g' | bcftools view -o multisample.call.bcf
	#changes samplenames from ./name.sort.bam to name
	#changed this line as this analysis just used samplenames without ./ and .sort.bam

#now need to split multibcf into separate bcf for each sample as we want to remove ref variants

#bcftools +split -e 'GT[*]="ref"' -O b multisample.call.bcf -o .
	#splits bcf into individual bcf for each sample. Excludes variants that are entirely reference. Output to current dir
	#don't use as this will hide variants that are same as old reference but different in all other samples
bcftools +split -O b multisample.call.bcf -o .

bcftools query -l multisample.call.bcf > bcflist.txt

while read -r samplename
do
	newsamplename=${samplename}.tmp					#sets temp sample bcf name
	echo ${newsamplename} >> newsamplelist.txt			#sets new bcf name to samplename.bcf
	printf "Correcting genotypes for $samplename. "
	bcftools +setGT ${samplename}.bcf -- -t "b:AD<1e-2" -n M | bcftools +setGT -- -t "." -n 0 | \
	bcftools view -e 'GT="ref" | FORMAT/DP<3' -O b -o ${newsamplename}
	#replace hets with major allele, missing alleles with ref. Then outputs all variants except ref, missing and DP<4 to new bcf

	#\rm ${samplename}
done < bcflist.txt

bcftools merge --no-index -l newsamplelist.txt -O b -o PM_consensus.filtered.DP4.bcf
	#merges all bcfs without index
bcftools convert PM_consensus.filtered.DP4.bcf -O v -o PM_consensus.filtered.DP4.vcf