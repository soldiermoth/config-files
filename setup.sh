#! /bin/bash
# ~~~~~~~~~~~
# Currently works only on files not folders
# Places all files in project except those
# matches by `IGNORE_PATTERNS` into the home
# directory prefixed by a '.'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IGNORE_PATTERNS=( README.md setup.sh )
CONFIGS=$(echo $DIR | xargs ls)


for file in ${CONFIGS[@]}
do
	IGNORE="N"
	for ignore in ${IGNORE_PATTERNS[@]}
	do
		if [[ "$ignore" =~ $file ]]; then
			#echo "Ignoring $file"
			IGNORE="Y"
		fi
	done
	if [ $IGNORE == "N" ]; then
		echo "Linking: $file  -> ~/.$file"
		echo "$DIR"/"$file" ~/".$file"
		ln -f -s "$DIR"/"$file" ~/".$file"
	fi
done
