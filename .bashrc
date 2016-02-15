#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'


function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='[\u@\h]::[\[\033[01;32m\]\D{%H:%M:%S v%W[m%m]/%b%d}\[\033[00m\]] $(parse_git_branch) \w\n $ '

export PAPER_SRC=/home/cra/inbox/paper-pottest

function share_screen() {
        ffmpeg -f x11grab -r 15 -s 1920x1080 -i :0.0+0,0 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video1
}

alias time-odintsovo="timedatectl set-timezone Europe/Moscow"
alias time-paris="timedatectl set-timezone Europe/Paris"
alias time-linkoping="timedatectl set-timezone Europe/Stockholm"

export PYTHONDOCS=/usr/share/doc/python2/html/

export WORKON_HOME=~/.py_venvs
alias arm_venw="source /usr/bin/virtualenvwrapper.sh"

function _date_in_russian_fmt()
{
        LC_TIME=ru_RU.utf8 date +"%d %B %Y [%A]" --date="$1"
}

alias tell_tomorrow='_date_in_russian_fmt tomorrow'
alias tell_yesterday='_date_in_russian_fmt yesterday'

function clone_yesterdays_plan_here()
{
    #mktemp -d plan$(date +%y%m%d).XXXX

    if [ $(pwd | grep ^/tmp) ]; then
        this_month_plans_dir=~/inbox/$(date '+%y%m')\ daily\ plans
        yesterday_plan=PLAN_$(date +%y%m%d --date='yesterday').tex
        today_plan=PLAN_$(date +%y%m%d).tex
        if [ ! -e "${this_month_plans_dir}/${yesterday_plan}" ]; then
            echo "Cannot find yesterday plan. Trying to find something earlier"
            for days_ago in `seq 2 10`; do
                yesterday_plan=PLAN_$(date +%y%m%d --date="${days_ago} days ago").tex
                if [ -e "${this_month_plans_dir}/${yesterday_plan}" ]; then
                    echo "Using plan from ${days_ago} days ago"
                    break
                fi
            done
        fi
        if [ -e "${this_month_plans_dir}/${yesterday_plan}" ]; then
                cp -iv "${this_month_plans_dir}/${yesterday_plan}" ./${today_plan}
        else
                echo "Can't find a suitable plan. Last tried: ${yesterday_plan}."
                echo "Please step in"
        fi
    else
        echo "Switch to a temporary directory first. I won't copy anything otherwise"
    fi
}

alias omodoro-tocks="echo Firing 4 tocsk with 30 min rest on completion; omodoro 4-45-15-30"

function lsh() {
    cd ~/sandbox/lsh_ng
    source ./venv/bin/activate
    cd ./frufru_ng/
    source user_settings.sh
    echo "Yo"
}

function katmandu() {
    cd ~/sandbox/katmandu-backend/
    source ./v/bin/activate

    echo "KADMANDUUU"
}

function ecfront() {
    cd ~/sandbox/escapecontrol/front/
    arm_venw
    workon py32env-ecfront

    echo "Escape. Control. Front. VENV ACTIVATED"
}

function LandOfLisp() {
    cd ~/sandbox/LandofLisp
}

function kbfix() {
    xset r rate 170 50
    setxkbmap dvp,us,ru,se_sv_dvorak
    xmodmap ~/.xmodmap
    xmodmap ~/.xmodmap
}

function kbfix-liu() {
    kbfix
    xmodmap ~/.xmodmap
}

function jbook() {
    jrnl reading <<EOF
30min $@
@programming
[[ short summary ]]
EOF
    jrnl reading -1 --edit
}

function jlispbook() {
    jbook land of lisp
}

function jfortranbook() {
    jbook "fortran95/2003" book
}


current_book="r book"
function jreading() {
    if [ $1 ]
    then
        time_m=$1
    else
        time_m=30
    fi

    jrnl reading <<EOF
${time_m}min ${current_book}
@programming
[[ short summary ]]
EOF
    jrnl reading -1 --edit

}

function jkanban_count() {
    echo "Number of items in backlog?"
    read
    BACKLOG=${REPLY}
    #echo "Number of items in today?"
    #read
    #TODAY=${REPLY}
    echo "Number of items in 'in work'?"
    read
    INWORK=${REPLY}
    echo "Number of items in 'done'?"
    read
    DONE=${REPLY}
#BACKLOG ${BACKLOG} TODAY ${TODAY} INWORK ${INWORK} DONE ${DONE} @count @liuboard
    jrnl kanban <<EOF
BACKLOG ${BACKLOG} INWORK ${INWORK} DONE ${DONE} @count @liuboard
EOF
    jrnl kanban -1 --edit
}
alias jkanban_edit_last='jrnl kanban -1 --edit'
alias jkanban_show_last='jrnl kanban -1'

function friday_reflection() {
    echo "Estimate the week on a scale from 1 to 10"
    read
    week_perception=${REPLY}
    echo "Week summary"
    read
    week_summary=${REPLY}
    echo "Three MITs for next week:"
    for ind in 1 2 3
    do
            echo "MIT${ind}:"
            read
            MIT[${ind}]=${REPLY}
    done

    jrnl <<EOF
${week_perception}/10 vecka `date +%W` friday @reflection.

SUMMARY:
${week_summary}

MITs for next week:
1. ${MIT[1]}
2. ${MIT[2]}
3. ${MIT[3]}
EOF

    jrnl -1 --edit
}

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
alias wcl="sudo wpa_cli"
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

alias feni='cd ~/inbox/1506\ FeNi\ 0K'


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

    #TEST=1

    if [ $TEST ]; then echo Test var was set; fi
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
alias pi=piy
alias iy=piy

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
    #mode=1920x1080
    mode=2048x1152 # Linkoping
    #xrandr_args="--output ${main} --auto --primary --output ${ext} --auto"
    xrandr_args="--output ${main} --auto --output ${ext} --primary --right-of ${main} --mode ${mode}" # Linkoping
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
alias py="ipython2 --no-banner --no-confirm --autoedit-syntax"
alias nb="ipython2 notebook"

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
alias xflux-linkoping="xflux -l 58.4167    -g 15.6167  -k 2000"
alias xflux-paris="xflux -l 48.864716    -g 2.349014" #  -k 2000"
alias xflux-ss="xflux -l 43.318334 -g -1.98123123"

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

