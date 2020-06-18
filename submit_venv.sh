#!/bin/bash
#SBATCH --account=def-mhodaie
#SBATCH --nodes=1
#SBATCH --gres=gpu:p100:1
#SBATCH --mem=127000M
#SBATCH --time=6-20:00

module load python/3.7
virtualenv --no-download $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate
pip install --no-index --upgrade pip

pip install --no-index -r requirements.txt

pip install tensorlayer-1.6.5-py3-none-any.whl
python train.py
