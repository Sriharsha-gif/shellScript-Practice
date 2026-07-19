NUM1=10
NUM2=20

SUM=$(($NUM1+$NUM2))

echo "Sum is: $SUM"

###   ARRAY  ###
MOVIES=("Varanasi" "BOB" "MAHESH")
#ndex always start from 0

echo "Movies are : ${MOVIES[@]}"