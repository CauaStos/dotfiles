#/bin/bash

# Get the search term
SEARCH_TERM="$1"  # %s first parameter (aka query passed to the script [is also first term] )

#Checks if search term is file
if [[ "$SEARCH_TERM" == *.* ]]; then IS_FILE=true
else IS_FILE=false
fi

#If it's not a file it opens normally
if [[ "$IS_FILE" = "true" ]]; then zeditor "$SEARCH_TERM"
else
#Query it on zoxide and open zed on path
  FOLDER_PATH=$(zoxide query "$SEARCH_TERM")
  zeditor "$FOLDER_PATH"
fi
