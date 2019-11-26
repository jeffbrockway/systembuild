#DIR="${BASH_SOURCE%/*}" if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi . "$DIR/incl.sh" . "$DIR/main.sh"
#. (dot) command is alias to source, $PWD is the Path for the Working Directory, BASH_SOURCE is an array variable whose members are the source filenames, ${string%substring} strips shortest match of $substring from back of $string

alias jcbhelp='more ~/.bash_aliases'
alias c='clear'
alias dailytest='node ~/git/itinero.us/backend/importers/wunderlist/wltest.js'
alias btudaily="cd ~/git/btucentral-new/php/html/btucentralserver/daily;pwd"
alias checksum="echo shasum -a 256 filename\nopenssl sha -sha256 <file>"
alias isohelp="hdiutil convert /path/imagefile.cdr -format UDTO -o /path/convertedimage.iso"
alias btod="cd ~/OneDrive\ -\ XXXX;pwd"
