#!/bin/bash -l

#SBATCH -n 4
#SBATCH -t 01:00:00  
#SBATCH -J openfoam-waterDam-waterDam
#SBATCH --partition=green-ib

#the following 2 lines are only needed if not done manually in command-line
module load mpi/openmpi-x86_64
source /share/apps/HPC2/OpenFOAM/OpenFOAM-v1912/etc/bashrc

tar -xvf finalMesh.tar.xz
rm finalMesh.tar.xz
ideasUnvToFoam finalMesh.unv
cp boundary /constant/polyMesh
setFields
checkMesh
interFoam
