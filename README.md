# FOSS Spring 2021 Team 1 
_______
# Members

## Karen McGinnis
Karen McGinnis is an associate professor of biology at Florida State University in Tallahassee, FL.  She is also the associate chair of undergraduate studies in the department of biological science.  Her research focuses on molecular genetics and genomics of maize.

## Lester Young
Lester Young is a Professional Research Associate in the Flax Breeding Program at the University of Saskatchewan. His work utilizes genomics, molecular biology and bioinformatics to develop improved flax lines. Current research projects include characterizing genetic loci for disease resistance and introducing germplasm from wild flax species to increase the genetic diversity of domesticated cultivars.

# Data Management Plans

## Karen McGinnis DMP

MEASUREMENT STANDARDS FOR THE RELEVANT EXPERIMENTAL SYSTEMS AND DATA THAT ARE ACCEPTED COMMUNITY-WIDE
All experiments described in this grant will be conducted with the ultimate goal of publication in a peer reviewed journal, and so we have designed all experiments in agreement with community wide acceptable standards for measurement.  Experiments will be conducted with the appropriate controls, and the techniques will be thoroughly described and subject to peer review with the relevant data.  Any new expectations revealed through peer review will be incorporated into future experiments, but we anticipate that we have met the community-wide expectations by familiarizing ourselves with the relevant literature.  We have already published all of the relevant data types  and resources for the proposed experiments, by ourselves or as part of collaborations, including transgene constructs, qPCR analysis of nucleic acids, and next-gen sequencing, and so we are aware of the best practices for data analysis for these techniques.  When relevant, we will follow the recommendations of the Functional Genomics Data Society (FGED).

PUBLIC AVAILABILITY OF THE DATA IN AN INTEROPERABLE FORMAT THAT ENABLES WIDE-SCALE DATA SHARING AND FACILITATES SECONDARY USE OF THE DATA.

Sharing Resources: This research project will generate and characterize transgenic lines and genetic mutants.  When sufficient stocks are available for the lines, seed will be released upon request to individuals or through the Maize Genetics Cooperative.  Scripts used for this project will be provided through Github.

Release of data:  We will submit complete data sets to the National Center for Biotechnology Information (NCBI) and Gene Expression Omnibus Database (GEO; http://www.ncbi.nlm.nih.gov/geo/) for all data sets generated and used in manuscripts.  Data that is housed at an external site (like GEO) will be saved on one FSU hard drive as a backup.

Data storage and backup: All project data that is only saved at FSU will be saved to two external hard drives at FSU.  Two 14TB hard drives will be purchases for these purposes.  Data generated at UW Bothell will also be saved locally, but will be sent to FSU for longer term storage.  Upon publication, relevant data sets will also be made available to maizegdb and genomaize for presentation at their discretion. Data that is housed at an external site (like GEO) will be saved on one FSU hard drive as a backup.

Period of Data Retention: All data will be retained for a minimum of three years after conclusion of the award or three years after public release, whichever is later.

Management of Intellectual Property:  Each university will decide whether to file patent applications protecting inventions that may be developed within the experimental aspects of this project at their institution, according to their normal policies and procedures.  All the investigators agree to disclose their intent to file a patent application to all other investigators in the program as soon as the decision to prepare a patent application is made.  In deciding inventorship, ownership, and rights to any invention, full and fair consideration will be given to any and all relevant contributions by other participants in the program.  

## Lester Young DMP
The Flax Breeding Program does not have a published DMP, however, many of the collaborative research projects have released NGS data to publically accessible databases such as NCBI's [Sequence Read Archive](https://www.ncbi.nlm.nih.gov/sra). We are also involved in Genome BC's [DivSeek project](https://github.com/DivSeek-Canada) which has developed tools to make plant genomic data more accessible.

One of the things I found interesting and thought-provoking in the FOSS course was the discussion on Open Science and reproducibility. The discussion has introduced me to the possibilities of 
incorporating Open Science in the Flax Breeding Program, particularly for managing, sharing and publishing data using FAIR principles. I am thinking of structuring new projects with a DMP and using 
GitHub (or purchasing an institutional license for LabArchives). This has become particularly relevant as recently the Government of Canada Tri-Agency funding bodies have released their [Data 
Management Policy](http://www.science.gc.ca/eic/site/063.nsf/eng/h_97610.html). This will eventually trickle down to all layers for government funding in Canada, so practicing good data management 
and Open Science now will help for a smoother transition in the future.

The importance of reproducibility and file management, particularly for bioinformatics rich projects, became more important while I was attending FOSS as I was in the process of submitting a 
manuscript with a lot of bioinformatics analysis in it. Controlling file names and locations, versions of shell scripts and repeated analyses had become a real issue. I am intrigued by the 
possibility of keeping this mess of data under control using `git` and being able to share it and being able to reuse the read data. For the capstone project I would have taken the scripts I used 
for the manuscript and containerized it, or possibly explored *snakemake*. Hhowever, time did not permit this to occurr, so I am submitting some code and some sample data that could have been a 
part of the capstone project.
