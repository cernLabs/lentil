# ask for the input
echo "input thing and when(during/after) separated by comma"
read var_input 

# build append function
function append_line() {
	local var=$1
	echo "$var" >> things_to_do_after_during_MS.csv
	echo "row appended"
}

# sync to github
function ghsync() {
	git add things_to_do_after_during_MS.csv
	git commit -m "appended row to things_to_do_after_during_MS.csv" >/dev/null 2>&1
	git push >/dev/null 2>&1
	echo "synced to github"
}

# prompt confirmation
echo "you typed: $var_input"
read -p "are you sure you want to add this? (y+ENTER to confirm, any other button to close)" var_confirm

# run cases
case "$var_confirm" in
	[yY]) # if user typed y or Y
		append_line "$var_input"
		ghsync
		;;
	*)  # if user typed anything else, close program
		exit 0
		;;
esac
