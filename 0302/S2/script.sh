#!/bin/bash

# Clears current screen
clear

# Coverts .pdf to .txt
pdftotext -layout result_CHN.pdf result_CHN.txt

# Separates out results of CS students
grep --no-group-separator -A3 "CHN18CS" result_CHN.txt > result_cs.txt

# Cleans up and arranges the data in organised manner
tr  '\n' ' ' < result_cs.txt > result_nn.txt
sed 's/\t//g' result_nn.txt > result_na.txt
awk '{$1=$1;print}' result_na.txt > result_nn.txt
sed 's/CHN/\nCHN/g' result_nn.txt > result_na.txt
tr  ',' ' ' < result_na.txt > result.txt

# Convert Grades to Grade Points 
sed -i 's/(O)/ 10/g' result.txt
sed -i 's/(A+)/ 9/g' result.txt
sed -i 's/(A)/ 8.5/g' result.txt
sed -i 's/(B+)/ 8/g' result.txt
sed -i 's/(B)/ 7/g' result.txt
sed -i 's/(C)/ 6/g' result.txt
sed -i 's/(P)/ 5/g' result.txt
sed -i 's/(F)/ 0/g' result.txt
sed -i 's/(FE)/ 0/g' result.txt
sed -i 's/(I)/ 0/g' result.txt
sed -i 's/(Absent)/ 0/g' result.txt

# Seperates gradepoints 
awk  '{  
	print $1,$3,$5,$7,$9,$11,$13,$15,$17,$19
 }' result.txt > gp.txt 

# Computes CGPA and counts subjects failed in
awk '{
	sum = 0
	flag = 0
	fails = 0
	for(var =2; var<=NF; var++)
	{	
		if($var == 0) 
		{
			flag = 1
			fails = fails + 1
		}
		sum += $var
	}
	cgpa = sum/9
	if (flag == 0) {	
	 	printf("%s %0.2f\n",$1,cgpa)
	}
	if (flag == 1) {
		printf("%s failed in %d\n",$1,fails)
	}
}' gp.txt > cgpa_raw.txt



# adds name and roll no
join students.txt  cgpa_raw.txt > cgpa.txt

# Removes temperory files used to process
rm result.txt
rm result_cs.txt
rm result_na.txt
rm result_nn.txt
rm gp.txt
rm cgpa_raw.txt
