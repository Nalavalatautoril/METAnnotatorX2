#!/bin/bash

echo "...METAnnotatorX2 Installer..."; echo ""

echo "This script installs both the software and databases of METAnnotatorX2, along with third party software needed."; echo ""

echo "Please note that METAnnotatorX2 and related databases will be installed in this current path:" ; pwd ;
echo ""
echo "At least 800gb of free disk space is required for installation (final size of METannotatorX2 folder will be <600 gb). METAnnotatorX2 executable will be copied in /user/local/bin"
echo ""
echo "Please be sure to execute this function as Superuser (sudo ./METAnnotatorX2_installer or METAnnotatorX2 -u if updating existing installation)"
	read -p " Press Enter to continue..."
echo ""

#Check Superuser
validationRoot() {
    if [ $USER != 'root' ]
        then
            echo "You're not Root! Please execute METAnnotatorX2 as superuser (sudo ./METAnnotatorX2_installer or METAnnotatorX2 -u if updating existing installation)"
            exit
    fi
}
validationRoot;
echo "Updater correctly executed as Superuser"
echo ""

#Check Disk  Space
reqSpace=800000000
availSpace=$(df "$PWD" | awk 'NR==2 { print $4 }')
if (( availSpace < reqSpace )); then
  echo "Not enough disk space available in $PWD, please execute METAnnotatorX2 installer in a directory with at least 1Tb of free space" >&2
  read -p "Press Enter to continue installation despite insufficent disk space detected or press CTRL+C to exit"
fi
echo "Available disk space sufficent for installation: $availSpace bytes"
echo ""

echo "Installing third party software:"

echo "Y" | sudo apt-get install default-jdk readseq gawk artemis emboss

echo "Done"
echo ""

echo "Installing latest version of METAnnotatorX2:"
wget probiogenomics.unipr.it/sw/METAnnotatorX2/METAnnotatorX2.zip ;
echo "Unzipping..."
unzip -q METAnnotatorX2.zip
rm METAnnotatorX2.zip
chmod a+wrx parameters
chmod a+wrx -R software
echo "$PWD" > folder.del
INSTALLATIONPATH=$(cat folder.del)
rm folder.del ;
NUMBEROFCORES=$(grep -c ^processor /proc/cpuinfo)
sed -i "s|@@CORES@@|$NUMBEROFCORES|g" parameters
sed -i "s|@@PATH@@|$INSTALLATIONPATH|g" parameters
cd software/scripts ;
sed -i "s|@@PATH@@|$INSTALLATIONPATH|g" METAnnotatorX2
sed -i "s|@@PATH@@|$INSTALLATIONPATH|g" METAnnotatorX2.sh
rm /usr/local/bin/METAnnotatorX2
cp METAnnotatorX2 /usr/local/bin/.
cd ..
cd ..
echo "Done"
echo ""

echo "Installing latest version of Databases:"
mkdir databases ;
cd databases ;
wget probiogenomics.unipr.it/sw/METAnnotatorX2/METAnnotatorX2_RapSearch_NCBI_RefSeq_complete_database.zip ;
echo "Unzipping..."
unzip -q METAnnotatorX2_RapSearch_NCBI_RefSeq_complete_database.zip ;
rm METAnnotatorX2_RapSearch_NCBI_RefSeq_complete_database.zip ;
wget probiogenomics.unipr.it/sw/METAnnotatorX2/METAnnotatorX2_BLASTn_taxonomy_databases.zip ;
echo "Unzipping..."
unzip -q METAnnotatorX2_BLASTn_taxonomy_databases.zip ;
rm METAnnotatorX2_BLASTn_taxonomy_databases.zip ;
wget probiogenomics.unipr.it/sw/METAnnotatorX2/METAnnotatorX2_RapSearch_functional_databases.zip ;
echo "Unzipping..."
unzip -q METAnnotatorX2_RapSearch_functional_databases.zip ;
rm METAnnotatorX2_RapSearch_functional_databases.zip ;
wget probiogenomics.unipr.it/sw/METAnnotatorX2/METAnnotatorX2_host_filtering_mapping_databases.zip ;
echo "Unzipping..."
unzip -q METAnnotatorX2_host_filtering_mapping_databases.zip ;
rm METAnnotatorX2_host_filtering_mapping_databases.zip ;

cd .. ;
chmod a+wrx -R databases
echo "Done"
echo ""

