printf "Checking paths relative to workspace:\n\n" 

format="%-17s | %-7s | %-30s\n"
flag="SUCCESS"

if [ -d $1 ] 
then
    flag="SUCCESS"
else
    flag="ERROR"
fi

printf "$format" "--workspaceRoot" "$flag" "$1" 

if [ -d $2 ] 
then
    flag="SUCCESS"
else
    flag="ERROR"
fi

printf "$format" "--workspaceFolder" "$flag" "$2" 

addonsFolder="$1/../../../addons"

if [ -d $addonsFolder ] 
then
    flag="SUCCESS"
else
    flag="ERROR"
fi

printf "$format" "--addons" "$flag" "$addonsFolder" 

ofFolder="$1/../../../libs/openFrameworks"

if [ -d $ofFolder ] 
then
    flag="SUCCESS"
else
    flag="ERROR"
fi

printf "$format" "--openframeworks" "$flag" "$ofFolder" 

printf "\nTo prevent errors, clone the repository in [path-to-openframeworks]/apps/
" 