#!/bin/bash


name="noname" 
size=0 
count=1



while getopts ":v:h:s:n:f:" opt; do
    case "${opt}" in
        s)
            size=${OPTARG}
            ;;
        n)
            count=${OPTARG}
            ;;
        f)
            name=${OPTARG}
            ;;
        h)
              echo -e "
              mkfiles file1 file2 file3 ...
              OR
              mkfiles <options>
              options are:

              f)   filename        (default is noname)
              h)   display this help menu
              n)   number of files (default is 1)
              s)   size of files   (default is 0)
              v)   displays created filenames

              Examples:

              mkfiles
              mkfiles -h
              mkfiles -n 20
              mkfiles -n 40 -s 100
              mkfiles -n 40 -s 100 -f junk
              mkfiles -n 40 -s 100 -f junk -v
              mkfiles myfile hisfile herfile ourfile" 

            ;;
        v)
            ls -FRl $name
            ;;
        *)
            echo No options found 
            ;;
    esac
done
shift $((OPTIND-1))

for i in {1..5}; do truncate -s ${size}  ${name}${i}; done

truncate -s ${size} $name{1..${count}}.txt




#if [ -z "${s}" ] || [ -z "${p}" ]; then usage
#fi
#echo "s = ${s}"
#echo "p = ${p}"
