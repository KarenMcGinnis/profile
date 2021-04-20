#/!/bin

#Takes .bam file, sorts by name, fixes mates, marks and removes duplivates, sorts by coordinate
#The && are in place because I thought that sometimes the script got ahead of itself, but I'm not sure if they are necessary
> Coverage.txt

#Get list of .bam files. The for every item in the list process the reads
for bamfile in `\ls *.sort.bam`
do
	outputfile=`echo ${bamfile} | sed 's/.sort.bam/.fix.rmdup.bam/'`
	#generate index file the keep reads on non-repeditive regions. The sort file
	samtools index ${bamfile}	&&
	samtools view -h -L non-SNV.bed ${bamfile} | \
	samtools sort -@ 4 -n -u - -o tempfile.bam &&

	#fixmates and remove duplicate reads from bam file
	samtools fixmate -@ 4 -r -u -m tempfile.bam - | \
	samtools sort -@ 4 - -o tempfile.bam &&
	samtools markdup --write-index -@ 4 -r tempfile.bam ${outputfile}
	printf "${outputfile}\n" >> Coverage.txt

	#now get some stats about the fixed and deduplicated reads in the bam files
#	samtools bedcov non-SNV.bed ${outputfile} >> Core_depths.nomicrosat.txt
	samtools coverage -H -r PM_consensus:1200-14800 ${outputfile} >> Coverage.txt
	samtools coverage -H -r PM_consensus:26000-34988 ${outputfile} >> Coverage.txt
done
