
def readFastq(filename):
    """
    Read and parse a FASTQ file.

    Parameters
    ----------
    filename : str
        The name of the FASTQ file to read.

    Returns
    -------
    tuple
        A tuple containing two lists: the sequences and the quality scores.

    Notes
    -----
    This function reads a FASTQ file and extracts the base sequences and quality scores for each read. It returns
    two lists: one containing the sequences and one containing the quality scores.

    Examples
    --------
    >>> sequences, qualities = readFastq('example.fastq')
    """
    sequences = [] # stores a list sequences 
    qualities = [] # stores a list of quality scores
    with open(filename) as fh: # open the file and store it in a file handle
        while True: # loop through the file
            fh.readline() # skip name line
            seq = fh.readline().rstrip() # read base sequence and store it
            fh.readline() # skip placeholder line
            qual = fh.readline().rstrip() # read base quality scores and store them
            if len(seq) == 0: # if the end of the file is reached 
                break # stop looping through the file
            sequences.append(seq) # the elif we are still reading through the file append it to seq
            qualities.append(qual) # continue appending the quality scores past the influence of the loop
    return sequences, qualities # returns multiple values

# testing the function on a file 
seqs, quals = readFastq('data/SRR835775_1.first1000.fastq')
print (seqs[:5]) ; print (quals[:5])
