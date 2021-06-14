
                                         Version 2.1.7, 27 May 2021

# METAnnotatorX2: a Metagenomic Annotator
# Copyright (C) 2021 Lugli Gabriele Andrea and Milani Christian

# METAnnotatorX2 is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# METAnnotatorX2 is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

For the installation and usage of METAnnotatorX2, please refer to manual.pdf.

DESCRIPTION

METAnnotatorX2 is a bioinformatic platform for reads- and assembly-based 
analysis of metagenomics datasets. This pipeline allows the perform taxonomic
and a range of functional profiling analyses of next-generation shotgun 
sequencing data. Shotgun metagenomics datasets can also be assembled and the
resulting contigs can be taxonomically classified at the genus or species 
level with the generation of GenBank files with annotated ORFs for each taxon 
identified. Contigs corresponding to each genus or species profiles can also 
be functionally characterized.


Change log

Version 2.1.7, 27 May 2021
- Tweaking of filtering pipeline. Introduced the primer filtering hidden feature (place a list of primers in a file named "primers_list.txt" to trigger their filtering fro, sequences' edges).

Version 2.1.6, 20 May 2021
- Improved Host reads filtering. Switched to bwa and improved the databases.

Version 2.1.5, 05 March 2021
- Added script for taxonomic profiling of reads classified as EC numbers specified by the user.

Version 2.1.4, 18 February 2021
- Pathways profiling improved through analysis of metabolic reactions. A custom database was buiild based on MetaCyc data regarding EC numbers of reactions involved in prokaryotiic as well as fungi and protists metabolisms.

Version 2.1.3, 20 January 2021
- Added various customizable settings in the reads taxonomic profiling pipeline (see parameters file).

Version 2.1.2, 12 January 2021
- Added LCA taxonomy prediction for unclassified reads. Check unclassificable_reads_LCA_classification.txt file in output/reads_taxonomy folder.

Version 2.1.1, 21 December 2020
- Corrected an issue with reads-based pathways profiling script.

Version 2.1.0, 04 December 2020
- Added reads analysis with custom database.
