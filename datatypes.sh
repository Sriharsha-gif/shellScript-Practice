NUM1=10
NUM2=20

SUM=$(($NUM1+$NUM2))

echo "Sum is: $SUM"

###   ARRAY  ###
NAMES=("Varanasi" "BOB" "MAHESH")
#ndex always start from 0

echo "Names are : ${NAMES[@]}"
echo "First Name : ${NAMES[0]}"
echo "Second Name : ${NAMES[1]}"
echo "Third Name : ${NAMES[2]}"