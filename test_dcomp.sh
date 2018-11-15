#!/bin/bash

TESTCASES_DIR=${TEST_DIR:-.}/testcases/dcomp
COMP=${INTERP:-./dcomp}

function do_test() {
    local input_file=$1

    while read instr
    do
        read outstr
	echo "$instr" | $COMP > a.s
	if [ $? = 0 ]; then
	    gcc a.s
	    ./a.out
	    echo $? > test.out
	    echo $outstr | diff -b - test.out > /dev/null
      	    if [ $? = 0 ]; then
		result=OK
	    else
		result=NG
	    fi
	else
	    result=NG
	fi

	echo "======== testcase ========"
	echo "INPUT:"
	echo "$instr"
	echo "OUTPUT:"
	cat test.out
	echo "ANSWER:"
	echo "$outstr"
	echo "RESULT: $result"
    done < $input_file
}

for i in $TESTCASES_DIR/*.in
do
    echo testing ${i##*/} || exit 1
    do_test $i
done
