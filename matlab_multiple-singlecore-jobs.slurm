#!/bin/bash
# The above line needs to be at the top of all your SLURM scripts

### SLURM directives: This is where you tell SLURM what resources you need ###
### SLURM directives start with #SBATCH ###
### directives with a single - do not use a = sign ###
### directives with a double -- require a = sign ###
#SBATCH -J job_name                     # descriptive job name (not necessary)
#SBATCH -A groupname                    # group that SUs will be charged to
#SBATCH -t 1-12:00:00                   # wall time in D-HH:MM:SS
#SBATCH -p standard                     # which partition you want to use
#SBATCH --mem-per-cpu=8000              # memory per core in MB
#SBATCH --ntasks-per-node=1             # number of cores you want to use
#SBATCH -N 1                            # number of nodes you want to use
#SBATCH -o job_output.%a.out            # output file for a-th item in array
#SBATCH -e job_error.%a.err             # error file for a-th item in array
#SBATCH --array=0-99                    # array through which to iterate your job


###Job content: This is where you load software and specify your job commands###

module load matlab

matlab -nojmv -nodisplay -singCompThread \
-r "myFunc(${SLURM_ARRAY_TASK_ID}); exit;"