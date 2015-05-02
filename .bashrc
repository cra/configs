#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h]::[\[\033[01;32m\]\D{%H:%M:%S %b%d}\[\033[00m\]] \w\n $ '

export PAPER_SRC=/home/cra/inbox/paper-pottest

function write_paper() {
    TMP=/tmp/paper #TMP=`mktemp -d`
    if [ -d ${TMP} ]
    then
        echo "${TMP} already exists. Just cd'ing there"
        cd ${TMP}
    else
        mkdir ${TMP}
        cd ${TMP}
        cmake ${PAPER_SRC}
        make
        touch *.tex
        make
        bibtex paper
        touch *.tex
        make
        touch *.tex
        make
        evince paper.pdf &
        #clear
    fi
}

export EDITOR="vim"
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

export PATH=/opt/toec-scripts/bin:$PATH

shopt -s checkwinsize

alias svenska="setxkbmap se,ru"
alias dvp="setxkbmap dvp,ru"

alias bunzip='bunzip2'
alias grep='grep --color'
alias egrep='egrep --color'
alias psg='ps ax | grep'
alias bc='bc -l -q'
alias gnuplot='gnuplot -persist'
alias R='R --quiet'
alias pacman='pacman-color'
alias cal="cal -m3"
alias gitk="gitk --all"
alias postgres-start="sudo systemctl start postgresql"

alias dropbox-restart="dropbox stop; dropbox start"
alias puburl="dropbox puburl"

alias dhcp-lan="sudo dhcpcd -d -t0 --rebind enp0s20u1"
alias net-wifi="sudo wpa_supplicant -Dwext -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -B ; sudo dhcpcd -d -t0 --rebind wlp2s0"

alias yoaurt='yaourt'
alias yuaort='yaourt'

alias crl="crontab -l"
alias cre="crontab -e"

alias dummy_smtpd="python -m smtpd -n -c DebuggingServer localhost:1025"

# mplayer
# do not make aliases with mplayer-{word}, since it breaks the tab competition
# of simple mplayer invocation
alias loud-mplayer="mplayer -af volume=10.1:0"
alias scale-mplayer="mplayer -af scaletempo"
alias m="mplayer"
alias mq="mplayer -really-quiet"
alias mpq="mplayer -really-quiet"
alias quiet-mplayer="mplayer -really-quiet"

alias wcli="sudo wpa_cli"
alias wrecon="sudo wpa_cli reconfigure"
alias wrc="sudo wpa_cli reconfigure"
alias wscan="sudo wpa_cli scan && sudo wpa_cli scan_results"
alias wsc="sudo wpa_cli scan && sudo wpa_cli scan_results"
alias wstat="sudo wpa_cli status"
alias wst="sudo wpa_cli status"

# dirs
alias a="cd ~/archive/"
alias p="cd ~/projects/"
alias s="cd ~/sandbox/"


alias xchat="echo use smuxi"
alias mencoder-crop="echo mencoder -ss 0:48 -ovc lavc -oac pcm -o 130kg.mp4 MOV_0185.mp4"

alias backlight="/bin/bash /usr/bin/asus-screen-brightness"

function linscp()
{
    scp -r igomo@lindgren.pdc.kth.se:$1 /tmp && echo "Copied requested path to /tmp"
}

function droppub()
{
    cp $1 ~/Dropbox/Public
    dropbox puburl ~/Dropbox/Public/`basename $1`
}

function new_project()
{
    sudo mkdir /opt/$1
    sudo chown -R cra.users /opt/$1
    echo "Created $1 in /opt with your rights on it"
}

alias wazap='sudo tail -F /var/log/messages.log'
alias xln='ssh incraft'
alias um='udiskie-umount'
alias ffmpeg_apply="echo ffmpeg -threads 4 -i /media/FLOPPY/tmp/out-3.ogv -i /home/cra/starting_srazu.wav -f mpegts -vb 3000k /home/cra/newmovie-3000k.mpg"
alias ffmpeg_crop="echo ffmpeg -threads auto -i /media/FLOPPY/tmp/ZOOM0088.M4A -ss 00:00:18 /home/cra/starting_srazu.wav"

alias pwsafe="pwsafe -s Both"

# ssh
alias k="ssh -Y kappa"
alias t="ssh -Y triolith"
alias fru="ssh letnyaya"
alias lingd='ssh igomo@lindgren.pdc.kth.se'
alias lin='lingd'
alias l='lingd'
alias besk='ssh igomo@beskow.pdc.kth.se'
alias besky='ssh -Y igomo@beskow.pdc.kth.se'
alias pdc-kinit='kinit -f -l 700h igomo@NADA.KTH.SE'
alias cherry="ssh cherry"

function yoba-test()
{
    case $1 in
        'yoba'*)
            echo "OLOLO"
            ;;
        'fuck'*)
            echo 'fuck yourself'
            ;;
        *)
            echo "UUU"
            ;;
    esac
}

function tmpd() {
    TMPD=`TMPDIR=$1 mktemp -d`
    echo "Created a dir ${TMPD}"
    export TMPD
    echo "this path is saved in TMPD enviromental variable"
}

function piy() {
    while true; do
        ping www.ya.ru
        echo "Sleep 1 sec"
        sleep 1
        ping www.ya.ru
        echo "Sleep 1 sec"
        sleep 1
        ping www.ya.ru
        echo "sleep 5 sec"
        sleep 5
    done
}

function flash_keys() {
    while true; do
        asus-kbd-backlight 3
        sleep 1.0
        asus-kbd-backlight 0
        sleep 0.5
    done
}


function wake_at() {
    tid=`date +%s -d "$1"`
    sudo rtcwake -m mem -t $tid
}

function calc() {
    echo $@ | bc
}



alias infimake="while [ 1 ]; do make; sleep 1; done | grep -v Built"

alias X2="XINITRC=.xinitrc2 xinit -- :1"
alias crabber="mcabber -f ~/Dropbox/mine/crabberrc"

function _external_monitor() {
    main=eDP1
    ext=VGA1
    #xrandr_args="--output ${main} --auto --primary --output ${ext} --auto"
    xrandr_args="--output ${main} --auto --primary --output ${ext} --mode 1920x1200"
    case $1 in
        'above'*)
            xrandr ${xrandr_args} --above ${main}
            ;;
        'right-rotate'*)
            xrandr ${xrandr_args} --right-of ${main} --rotate left
            ;;
        'right'*)
            xrandr ${xrandr_args} --right-of ${main}
            ;;
        'left-rotate'*)
            xrandr ${xrandr_args} --left-of ${main} --rotate left
            ;;
        'off'*)
            xrandr --output ${ext} --off
            ;;
        *)
            xrandr ${xrandr_args}
            ;;
    esac


}

alias presentation_above="_external_monitor above"
alias presentation_right="_external_monitor right"
alias presentation_leftrotate="_external_monitor left-rotate"
alias presentation_rightrotate="_external_monitor right-rotate"
alias presentation_off="_external_monitor off"


alias food="ipython -i ~/sandbox/food.py"
alias recoursive_bzip_all="find . -type f -exec bzip2 {} +"
alias py="ipython2 --no-banner --no-confirm"

alias clonev="python2 /usr/lib/python2.7/site-packages/clonevirtualenv.py"

function bunzip2_all_the_things() {
    for file in "$@"
    do
        echo ${file}
        bunzip2 ${file}
    done
}

function dp() {
    dropbox puburl $1 | parcellite -c
}

alias telegram="telegram -N"
alias xflux-odintsovo="xflux -l 55.6806789 -g 37.2818590" #-k 2000
alias xflux-linkoping="xflux -l 58.4167    -g 15.6167" #  -k 2000"

alias idag=`date '+%Y-%m-%d'`

function pretty_json() {
    echo $@ | python2 -mjson.tool | pygmentize -l javascript
}

function _fail() {
    echo "Sigh..."
    idag=`date '+%Y-%m-%d'`
    link="http://www.reddit.com/message/compose/?to=badgebot"
    firefox "${link}&subject=${1}&message=${idag}"
}

function fap_fail() {
    _fail nofap
}

function porn_fail() {
    _fail pornfree
}

function wifi-no-powersave() {
    IFACE=wlp2s0
    echo "Before:"
    iwconfig ${IFACE} | egrep "ESSID|Power\ Management"
    sudo iwconfig ${IFACE} power off
    echo "After:"
    iwconfig ${IFACE} | egrep "ESSID|Power\ Management"
}

# TDEP stuff
PATH=$PATH:/opt/tdep-trunk/bin
export PATH
alias gnuplot='gnuplot -persist'

eval $(dircolors /usr/share/dircolors/dircolors.ansi-dark)
