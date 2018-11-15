#!/bin/bash

TESTCASES_DIR=${TEST_DIR:-.}/testcases/interp
INTERP=${INTERP:-./stinterp}

function do_test() {
    local input_file=$1

    while read instr
    do
        read outstr
	if [ "$outstr" = Type_error ]; then
	    echo "$instr" | $INTERP > test.out 2>&1
	    if grep Typing.Type_error test.out > /dev/null; then
		result=OK
	    else
		result=NG
	    fi
	else
	    echo "$instr" | $INTERP > test.out 2>&1
            echo $outstr | diff - test.out > /dev/null
      	    if [ $? = 0 ]; then
		result=OK
            else
		result=NG
            fi
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
