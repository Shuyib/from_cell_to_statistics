[![cell2statistics study Continuous Integration/Continuos Delivery](https://github.com/Shuyib/from_cell_to_statistics/actions/workflows/dev.yml/badge.svg)](https://github.com/Shuyib/from_cell_to_statistics/actions/workflows/devops.yml)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Shuyib/from_cell_to_statistics/HEAD)


This is a workshop about Genomic Data Science/Bioinformatics. We go from the basics of cell
and molecular biology to the analysis of high-throughput sequencing data. We use a couple of
examples to illustrate the concepts and tools used in the field. The workshop is divided in:

* Genomic Data science discipline & definition.      
* Cell & Molecular biology basics.     
* DNA (Deoxyribonucleic acid) where is it? how to isolate it? replicate it?   
  getting it's order.    
* How DNA is stored in files FASTA(.fa) & FASTQ (.fastq) to enable use of computer
  science skills & statistical skills.     
* Apply programming to answer a common problem: GC content.    
* Cancer definition predisposing factors, how to study variation DNA in a massive.    
  sample using short nucleotide polymorphisms(snp).   
* Determining flanking regions of BRCA1.   

Goals:
* Understand Genomic Data science and what it entails?       
* Understand the principles of cell biology that is, cell. How it replicates, reproduces
  and where the genetic material is.   
* Get to know molecular techniques to study the cell (genetic material/genetic code)
  Polymerase chain reaction(P.C.R) and Sequencing.   
* Be able to use programming to determine GC content of any .fa file for any living
  organism.     
* Identify cancer predisposing factors and define cancer.     
* Able to apply a workflow to find snp flanking regions for BRCA 1 gene.      
* Develop an interest for bioinformatics.

Where to learn more:   
* [Rosalind](https://rosalind.info/problems/locations/)    
* [Coursera Specialization: Genomic Data Science](https://www.coursera.org/specializations/genomic-data-science)    
* [Bioinformatics Specialization](https://www.coursera.org/specializations/genomic-data-science)     
* East African Bioinformatics communities:    
  <ins>bhki.org</ins>
  [EanBit](https://eanbit.icipe.org/)    
  [H3Africa](https://h3africa.org/)    

# File structure
```
.
├── data
│   ├── 60731777.jpeg - Bhki logo
│   ├── Bioinformatics for everyone.pptx - full presentation    	   
│   ├── chr-1.fasta - Chromosome 1 of human genome   
│   ├── dna_20000.txt - DNA sequence of 20000 nucleotides   
│   ├── ecoli.fasta - Ecoli genome   
│   └── SRR835775_1.first1000.fastq - First 1000 reads of a fastq file   
├── Dockerfile - Dockerfile to reproduce the environment   
├── Makefile - Workflow to run the scripts   
├── Practicing file manipulation for bioinformatics1.ipynb - Jupyter notebook  
├── readfastq.py - Python script to read fastq files  
├── README.md - This file  
├── Replicate this in other IDE-2.png - Image  
├── Replicate this in other IDEs -1.png - Image   
└── requirements.txt - Python packages to install   
└── LICENSE - License file CC BY-NC-SA 4.0   
```

# Setup virtual environment
```bash
python3 -m venv venv
source venv/bin/activate 
pip install --no-cache-dir upgrade pip
pip install --no-cache-dir -r requirements.txt
```
Or

``` bash
make install
```

# Run the notebook   
```bash
jupyter notebook 
```
# View notebook    
https://nbsanity.com/Shuyib/from_cell_to_statistics/blob/main/Practicing%20file%20manipulation%20for%20bioinformatics1.ipynb

# Run Docker container   
```bash
docker build -t bioenv .
sudo docker run -p 9090:9090 bioenv
```

Or
    
```bash
make docker_build docker_run
```
