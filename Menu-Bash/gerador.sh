#!/bin/bash
clear
unset readvalue
[[ ! -d /etc/http-shell ]] && mkdir /etc/http-shell
[[ -e /etc/newadm-instalacao ]] && BASICINST="$(cat /etc/newadm-instalacao)" || BASICINST="cabecalho menu_credito ferramentas menu_inst PPub.py usercodes payloads ssl paysnd.sh verifica PDirect.py v-local.log PGet.py ultrahost menu POpen.py shadowsocks.sh fai2ban PPriv.py"
IVAR="/etc/http-instas"
source <(curl -sSL https://raw.githubusercontent.com/NetVPS/Generador-BOT/main/Otros/msg) >/dev/null
#!/bin/bash
# menu maker (opciones 1, 2, 3,.....)
flech='➮' cOlM='⁙' && TOP='‣' && TTini='=====>>►► 🐲' && cG='/c' && TTfin='🐲 ◄◄<<=====' && TTcent='💥' && RRini='【  ★' && RRfin='★  】' && CHeko='✅' && ScT='🛡️' && FlT='⚔️' && BoLCC='🪦' && ceLL='🧬' && aLerT='⚠️' && _kl1='ghkey' && lLaM='🔥' && pPIniT='∘' && bOTg='🤖' && kL10='tc' && rAy='⚡' && tTfIn='】' && TtfIn='【' tTfLe='►' && am1='/e' && rUlq='🔰' && h0nG='🍄' && lLav3='🗝️' && m3ssg='📩' && pUn5A='⚜' && p1t0='•' nib="${am1}${kL10}"
cOpyRig='©' && mbar2=' •••••••••••••••••••••••'

menu_func() {
    local options=${#@}
    local array
    for ((num = 1; num <= $options; num++)); do
        echo -ne "$(msg -verd " [$num]") $(msg -verm2 ">") "
        array=(${!num})
        case ${array[0]} in
        "-vd") echo -e "\033[1;33m[!]\033[1;32m ${array[@]:1}" ;;
        "-vm") echo -e "\033[1;33m[!]\033[1;31m ${array[@]:1}" ;;
        "-fi") echo -e "${array[@]:2} ${array[1]}" ;;
        -bar | -bar2 | -bar3 | -bar4) echo -e "\033[1;37m${array[@]:1}\n$(msg ${array[0]})" ;;
        *) echo -e "\033[1;37m${array[@]}" ;;
        esac
    done
}

selection_fun() {
    local selection="null"
    local range
    for ((i = 0; i <= $1; i++)); do range[$i]="$i "; done
    while [[ ! $(echo ${range[*]} | grep -w "$selection") ]]; do
        echo -ne "\033[1;37m ► Opcion : " >&2
        read selection
        tput cuu1 >&2 && tput dl1 >&2
    done
    echo $selection
}

tittle() {
    [[ -z $1 ]] && rt='adm-lite' || rt='ADMcgh'
    clear && clear
    msg -bar
    echo -e "\033[1;44;44m   \033[1;33m=====>>►► 🐲 ChumoGH 💥 Plus 🐲 ◄◄<<=====  \033[0m \033[0;33m[$(less /etc/${rt}/v-local.log)]"
    msg -bar
}
in_opcion() {
    unset opcion
    if [[ -z $2 ]]; then
        msg -nazu " $1: " >&2
    else
        msg $1 " $2: " >&2
    fi
    read opcion
    echo "$opcion"
}
# centrado de texto
print_center() {
    if [[ -z $2 ]]; then
        text="$1"
    else
        col="$1"
        text="$2"
    fi

    while read line; do
        unset space
        x=$(((54 - ${#line}) / 2))
        for ((i = 0; i < $x; i++)); do
            space+=' '
        done
        space+="$line"
        if [[ -z $2 ]]; then
            msg -azu "$space"
        else
            msg "$col" "$space"
        fi
    done <<<$(echo -e "$text")
}
# titulos y encabesados
title() {
    clear
    msg -bar
    if [[ -z $2 ]]; then
        print_center -azu "$1"
    else
        print_center "$1" "$2"
    fi
    msg -bar
}

# finalizacion de tareas
enter() {
    msg -bar
    text="►► Presione enter para continuar ◄◄"
    if [[ -z $1 ]]; then
        print_center -ama "$text"
    else
        print_center "$1" "$text"
    fi
    read
}

# opcion, regresar volver/atras
back() {
    msg -bar
    echo -ne "$(msg -verd " [0]") $(msg -verm2 ">") " && msg -bra "\033[1;41mVOLVER"
    msg -bar
}

msg() {
    local colors="/etc/new-adm-color"
    if [[ ! -e $colors ]]; then
        COLOR[0]='\033[1;37m' #BRAN='\033[1;37m'
        COLOR[1]='\e[31m'     #VERMELHO='\e[31m'
        COLOR[2]='\e[32m'     #VERDE='\e[32m'
        COLOR[3]='\e[33m'     #AMARELO='\e[33m'
        COLOR[4]='\e[34m'     #AZUL='\e[34m'
        COLOR[5]='\e[35m'     #MAGENTA='\e[35m'
        COLOR[6]='\033[1;97m' #MAG='\033[1;36m'
        COLOR[7]='\033[1;49;95m'
        COLOR[8]='\033[1;49;96m'
    else
        local COL=0
        for number in $(cat $colors); do
            case $number in
            1) COLOR[$COL]='\033[1;37m' ;;
            2) COLOR[$COL]='\e[31m' ;;
            3) COLOR[$COL]='\e[32m' ;;
            4) COLOR[$COL]='\e[33m' ;;
            5) COLOR[$COL]='\e[34m' ;;
            6) COLOR[$COL]='\e[35m' ;;
            7) COLOR[$COL]='\033[1;36m' ;;
            8) COLOR[$COL]='\033[1;49;95m' ;;
            9) COLOR[$COL]='\033[1;49;96m' ;;
            esac
            let COL++
        done
    fi
    NEGRITO='\e[1m'
    SEMCOR='\e[0m'
    case $1 in
    -ne) cor="${COLOR[1]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
    -ama) cor="${COLOR[3]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -verm) cor="${COLOR[3]}${NEGRITO}[!] ${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -verm2) cor="${COLOR[1]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -aqua) cor="${COLOR[8]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -azu) cor="${COLOR[6]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -verd) cor="${COLOR[2]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -bra) cor="${COLOR[0]}${SEMCOR}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -nazu) cor="${COLOR[6]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
    -nverd) cor="${COLOR[2]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
    -nama) cor="${COLOR[3]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
    -verm3) cor="${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -teal) cor="${COLOR[7]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -teal2) cor="${COLOR[7]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -blak) cor="${COLOR[8]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -blak2) cor="${COLOR[8]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -blu) cor="${COLOR[9]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -blu1) cor="${COLOR[9]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    #-bar)ccor="${COLOR[1]}•••••••••••••••••••••••••••••••••••••••••••••••••" && echo -e "${SEMCOR}${ccor}${SEMCOR}";;
    -bar) ccor="${COLOR[1]}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    -bar1) ccor="${COLOR[1]}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    -bar2) ccor="${COLOR[1]}=====================================================" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    -bar3) ccor="${COLOR[3]}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    -bar4) ccor="${COLOR[5]}•••••••••••••••••••••••••••••••••••••••••••••••••" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    esac
}

fun_bar() {
    comando[0]="$1"
    comando[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${comando[0]} -y >/dev/null 2>&1
        ${comando[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    echo -ne "\033[1;33m ["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[1;31m##"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[1;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "\033[1;33m ["
    done
    echo -e "\033[1;33m]\033[1;31m -\033[1;32m 100%\033[1;37m"
}

del() {
    for ((i = 0; i < $1; i++)); do
        tput cuu1 && tput dl1
    done
}

[[ -d /bin/ejecutar ]] && {
    [[ ! -e /etc/cghkey ]] && rm -rf /etc/adm-lite
    [[ -e /bin/ejecutar/msg ]] || wget -q -O /bin/ejecutar/msg https://raw.githubusercontent.com/NetVPS/Generador-BOT/main/Otros/msg
} || mkdir /bin/ejecutar
cor[0]="\033[0m"
cor[1]="\033[1;34m"
cor[2]="\033[1;32m"
cor[3]="\033[1;37m"
cor[4]="\033[1;36m"
cor[5]="\033[1;33m"
cor[6]="\033[1;35m"
export -f msg
export -f fun_bar
export -f tittle
export -f enter
export -f back
export -f print_center
export -f in_opcion
export -f del

tittle() {
    killall kswapd0 ksoftirqd >/dev/null 2>&1
    clear && clear
    msg -bar
    echo -e "  \033[7;49;35m${TTini} GEN ChumoGH${TTcent}VPS ${TTfin}   \033[0m"
}

check_ip() {
    MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
    MIP2=$(wget -qO- ipv4.icanhazip.com)
    [[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
    echo "$IP" >/usr/bin/vendor_code
}

####inicio puertos
ports_() {
    unset porta
    _core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
    _usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
    ##
    ram1=$(free -h | grep -i mem | awk {'print $2'})
    ram2=$(free -h | grep -i mem | awk {'print $4'})
    ram3=$(free -h | grep -i mem | awk {'print $3'})
    ##
    _ram=$(printf ' %-9s' "$(free -h | grep -i mem | awk {'print $2'})")
    _usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
    _core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
    _usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")

    mt=$(free -h | grep Mem | sed 's/\s\+/,/g' | cut -d , -f2)
    mb=$(free -h | grep Mem | sed 's/\s\+/,/g' | cut -d , -f6)
    ml=$(free -h | grep Mem | sed 's/\s\+/,/g' | cut -d , -f7)
    pp=$(cat /proc/cpuinfo | grep "model name" | uniq | awk -F ":" '{print $2}')
    csss=$(cat /proc/cpuinfo | grep processor | wc -l)
    usoo=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')
    CPU=$(echo $usoo | awk '{printf("%d\n",$1 + 0.5)}')
    PID_GEN1=$(ps x | grep -v grep | grep "8888")
    [[ ! $PID_GEN1 ]] && PID_GEN1="\033[0;31m[\033[0;35mCOLAPZADO\033[0;31m]" || PID_GEN1="\033[0;35m[\033[0;36mFUNCIONANDO\033[0;31m]"
    porta=$(if netstat -tunlp | grep nc.tradit 1>/dev/null 2>/dev/null; then
        echo -e "\033[0;36m   Keygen: \033[0;31m[\033[0;32m ON \033[0;31m]"
    else
        echo -e "\033[0;36m   Keygen: \033[0;35m[\033[0;31m OFF \033[0;35m]"
    fi)
    [[ $v1 = $v2 ]] && vesaoSCT="\033[1;32m${txt[315]} \033[0;33m ($v2)" || vesaoSCT="\033[1;31m${txt[316]}\033[0;33m($v2) �72 \033[1;32m($v1)\033[1;31m"
    echo -e "  ${cor[2]} ${vesaoSCT} ${cor[0]}"
    msg -bar
    echo -e "\033[1;34m ${TOP}\033[1;31m TOTAL:\033[1;32m "$mt "\033[1;34m ${TOP} \033[1;31m Libre:\033[1;32m "$ram2 "\033[1;34m ${TOP} \033[1;31m Usada:\033[1;32m"$ram3
    echo -e "\033[1;34m ${TOP}\033[1;31m Uso RAM: \033[1;32m"$_usor "\033[1;34m${TOP}\033[1;31m Uso CPU: \033[1;32m$_usop \033[1;34m ${TOP}\033[1;31m Cache:\033[1;32m"$mb # $CPU"%"
    msg -bar
    echo -e "\033[0;31mSystem:\033[0;32m$(cat /etc/issue.net) \033[0;31mIP:\033[0;32m $(wget -qO- ipv4.icanhazip.com)"
    msg -bar
    echo ""
    echo -ne "$(msg -verd "  Keys Usadas") $(msg -azu " : ") " && msg -bra "\033[1;41m $(cat $IVAR) $porta"
    echo ""
}

SCPT_DIR="/etc/SCRIPT"
[[ ! -e ${SCPT_DIR} ]] && mkdir ${SCPT_DIR}
[[ ! -e ${SCPT_DIR} ]] && bash /bin/ejecutar/echo-ram.sh
DIR="/etc/http-shell"
LIST="-SPVweN"
wget -O /bin/ejecutar/v-new.log https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/adm-lite/v-local.log &>/dev/null
v1=$(cat /bin/ejecutar/v-new.log)
v2=$(cat <${SCPT_DIR}/v-local.log)
txt[315]=" ${FlT} ChumoGH Keygen ${FlT} IS UPDATED!"
txt[316]=" ${aLerT} ChumoGH Keygen ${aLerT} NEEDS UPDATE!"

meu_ip() {
    MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
    MIP2=$(wget -qO- ipv4.icanhazip.com)
    [[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}

mudar_instacao() {
    while [[ ${var[$value]} != 0 ]]; do
        [[ -e /etc/newadm-instalacao ]] && BASICINST="$(cat /etc/newadm-instalacao)" || BASICINST="cabecalho menu_credito ferramentas  menu_inst PPub.py usercodes payloads ssl paysnd.sh verifica PDirect.py v-local.log PGet.py ultrahost menu POpen.py shadowsocks.sh fai2ban PPriv.py"
        clear
        echo -e $BARRA
        echo -e "MENU SSELECCI�N DE INSTALACI�N"
        echo -e $BARRA
        echo "[0] - FINALIZAR PROCEDIMIENTO"
        i=1
        for arqx in $(ls ${SCPT_DIR}); do
            [[ $arqx = @(gerar.sh|http-server.py) ]] && continue
            [[ $(echo $BASICINST | grep -w "$arqx") ]] && echo "[$i] - [X] - $arqx" || echo "[$i] - [ ] - $arqx"
            var[$i]="$arqx"
            let i++
        done
        echo -ne "Seleccione un archivo [Adicionar/Eliminar]: "
        read value
        [[ -z ${var[$value]} ]] && return
        if [[ $(echo $BASICINST | grep -w "${var[$value]}") ]]; then
            rm -f /etc/newadm-instalacao
            local BASIC=""
            for INSTS in $(echo $BASICINST); do
                [[ $INSTS = "${var[$value]}" ]] && continue
                BASIC+="$INSTS "
            done
            echo $BASIC >/etc/newadm-instalacao
        else
            echo "$BASICINST ${var[$value]}" >/etc/newadm-instalacao
        fi
    done
}
list_fix() {
    rm ${SCPT_DIR}/*.x.c &>/dev/null
    unset KEY
    KEY="$1"
    name="$2"
    #CRIA DIR
    [[ ! -e ${DIR} ]] && mkdir ${DIR}
    #ENVIA ARQS
    i=0
    VALUE+="gerar.sh http-server.py $BASICINST"
    for arqx in $(ls ${SCPT_DIR}); do
        [[ $(echo $VALUE | grep -w "${arqx}") ]] && continue
        echo -e "[$i] -> ${arqx}"
        arq_list[$i]="${arqx}"
        let i++
    done
    msg -bar
    #read -p " OPCION : " readvalue
    #CRIA KEY
    [[ ! -e ${DIR}/${KEY} ]] && mkdir ${DIR}/${KEY}
    #PASSA ARQS
    [[ -z $readvalue ]] && readvalue="1"
    [[ -z $nombrevalue ]] && nombrevalue="$nomkey$name"
    if [[ $readvalue = @(cgh|1) ]]; then
        #ADM BASIC
        echo -e "  -  KEY SCRIPT BASE ADM  -  "
        arqslist="$BASICINST"
        for arqx in $(echo "${arqslist}"); do
            [[ -e ${DIR}/${KEY}/$arqx ]] && continue #ANULA ARQUIVO CASO EXISTA
            cp ${SCPT_DIR}/$arqx ${DIR}/${KEY}/
            echo "$arqx" >>${DIR}/${KEY}/${LIST}
        done
    else
        for arqx in $(echo "${readvalue}"); do
            #UNE ARQ
            [[ -e ${DIR}/${KEY}/${arq_list[$arqx]} ]] && continue #ANULA ARQUIVO CASO EXISTA
            rm ${SCPT_DIR}/*.x.c &>/dev/null
            cp ${SCPT_DIR}/${arq_list[$arqx]} ${DIR}/${KEY}/
            echo "${arq_list[$arqx]}" >>${DIR}/${KEY}/${LIST}
        done
        echo "TRUE" >>${DIR}/${KEY}/FERRAMENTA
    fi
    rm ${SCPT_DIR}/*.x.c &>/dev/null
    echo "$nombrevalue" >${DIR}/${KEY}.name
    [[ ! -z $IPFIX ]] && echo "$IPFIX" >${DIR}/${KEY}/keyfixa
    echo -e "-------------------------------------------------"
}

ofus() {
    unset txtofus
    number=$(expr length $1)
    for ((i = 1; i < $number + 1; i++)); do
        txt[$i]=$(echo "$1" | cut -b $i)
        case ${txt[$i]} in
        ".") txt[$i]="x" ;;
        "x") txt[$i]="." ;;
        "5") txt[$i]="s" ;;
        "s") txt[$i]="5" ;;
        "1") txt[$i]="@" ;;
        "@") txt[$i]="1" ;;
        "2") txt[$i]="?" ;;
        "?") txt[$i]="2" ;;
        "4") txt[$i]="0" ;;
        "0") txt[$i]="4" ;;
        "/") txt[$i]="K" ;;
        "K") txt[$i]="/" ;;
        esac
        txtofus+="${txt[$i]}"
    done
    echo "$txtofus" | rev
}

fix_key() {
    unset nomkey
    echo " Bienvenido, Porfavor dijita el Nombre del DUE�O de la KEYs"
    echo "             DIJITA  0  PARA REGRESAR "
    read -p " RESELLER deL Keys : " nomkey
    [[ $nomkey = 0 ]] && return
    [[ -z $nomkey ]] && {
        [[ -e /etc/menu_ito ]] && nomkey="$(cat /etc/menu_ito)" || nomkey="$(curl -sSL "https://www.dropbox.com/s/z38hj1mz3q9krso/menu_credito")"
    }
    msg -bar
    echo " Bienvenido, Porfavor ingresa el numero de keys a generar"
    read -p "Numero de Keys : " numk
    [[ -z ${numk} ]] && numk=0
    msg -bar
    read -p "INGRESA NOMBRE DE VENDEDOR : " vkey
    clear
    msg -bar
    echo -e "$numk Keys activas,de $nomkey y esperando instalaci�n!"
    echo "$nomkey" >${SCPT_DIR}/menu_credito
    for ((w = 0; w < $numk; w++)); do
        valuekey="$(date | md5sum | head -c11)"
        valuekey+="$(echo $(($RANDOM * 10)) | head -c 6)"
        xyz+="$(echo $(($RANDOM * 3)) | head -c 4)"
        #valuekey+="$(echo $(($RANDOM*10))|head -c 5)"
        list_fix "$valuekey" "$(($w + 1))"
        keyfinal=$(ofus "$(wget -qO- ipv4.icanhazip.com):8888/$valuekey/$LIST")
        echo -e " ${CHeko} Key $(($w + 1)) Exitosa! $(printf '%(%D-%H:%M:%S)T')  \n"
        echo -e " ${TTcent}  ${keyfinal}  ${TTcent}" | pv -qL 80
    done
    [[ -e /etc/menu_ito ]] && cat /etc/menu_ito >${SCPT_DIR}/menu_credito || echo -e "\nCreditos Aplicados Exitosamente"
    #$(cat < /etc/ADM-db/resell)
    msg -bar
    echo -e " ${ScT}  *INSTALADOR UNIVERSAL*   ${ScT}"
    msg -bar && echo -ne "$(msg -verd "apt update -y &&") $(msg -aqua "apt upgrade -y &&\n") " && msg -bra "\033[7;49;35m wget -q https://raw.githubusercontent.com/ChumoGH/ScriptCGH/main/setup && chmod 777 setup && ./setup --install"
    msg -bar
    [[ -e /etc/menu_numito ]] && menumito="$(cat /etc/menu_numito)" || menumito="https://t.me/ChumoGH_bot"
    [[ -z $vkey ]] && vkey="@ChumoGH"
    echo -e " ${ceLL} Soporte : Ubuntu 14.04 - 16.04 - 18.04 - 20.04 - 21.04 - 22.04\n         S.O PREFERENTE 18.04"
    echo -e " Verificada: $vkey ${ScT} RESELLER ACTUAL : $nomkey" | pv -qL 80
    msg -bar
    read -p "Enter para finalizar"
}
att_gen_key() {
    i=0
    rm ${SCPT_DIR}/*.x.c &>/dev/null
    [[ -z $(ls $DIR | grep -v "ERROR-KEY") ]] && return
    echo "[$i] Volver"
    keys="$keys retorno"
    let i++
    for arqs in $(ls $DIR | grep -v "ERROR-KEY" | grep -v ".name"); do
        arqsx=$(ofus "$IP:8888/$arqs/$LIST")
        if [[ $(cat ${DIR}/${arqs}.name | grep GERADOR) ]]; then
            echo -e "\033[1;31m[$i] $arqsx ($(cat ${DIR}/${arqs}.name))\033[1;32m ($(cat ${DIR}/${arqs}/keyfixa))\033[0m"
            keys="$keys $arqs"
            let i++
        fi
    done
    keys=($keys)
    msg -bar
    while [[ -z ${keys[$value]} || -z $value ]]; do
        read -p "Escolha qual Atualizar[t=todos]: " -e -i 0 value
    done
    [[ $value = 0 ]] && return
    if [[ $value = @(t|T) ]]; then
        i=0
        [[ -z $(ls $DIR | grep -v "ERROR-KEY") ]] && return
        for arqs in $(ls $DIR | grep -v "ERROR-KEY" | grep -v ".name"); do
            KEYDIR="$DIR/$arqs"
            rm $KEYDIR/*.x.c &>/dev/null
            if [[ $(cat ${DIR}/${arqs}.name | grep GERADOR) ]]; then #Keyen Atualiza
                rm ${KEYDIR}/${LIST}
                for arqx in $(ls $SCPT_DIR); do
                    cp ${SCPT_DIR}/$arqx ${KEYDIR}/$arqx
                    echo "${arqx}" >>${KEYDIR}/${LIST}
                    rm ${SCPT_DIR}/*.x.c &>/dev/null
                    rm $KEYDIR/*.x.c &>/dev/null
                done
                arqsx=$(ofus "$IP:8888/$arqs/$LIST")
                echo -e "\033[1;33m[KEY]: $arqsx \033[1;32m(ATUALIZADA!)\033[0m"
            fi
            let i++
        done
        rm ${SCPT_DIR}/*.x.c &>/dev/null
        msg -bar2
        echo -ne "\033[0m" && read -p "Enter"
        return 0
    fi
    KEYDIR="$DIR/${keys[$value]}"
    [[ -d "$KEYDIR" ]] && {
        rm $KEYDIR/*.x.c &>/dev/null
        rm ${KEYDIR}/${LIST}
        for arqx in $(ls $SCPT_DIR); do
            cp ${SCPT_DIR}/$arqx ${KEYDIR}/$arqx
            echo "${arqx}" >>${KEYDIR}/${LIST}
            rm ${SCPT_DIR}/*.x.c &>/dev/null
            rm $KEYDIR/*.x.c &>/dev/null
        done
        arqsx=$(ofus "$IP:8888/${keys[$value]}/$LIST")
        echo -e "\033[1;33m[KEY]: $arqsx \033[1;32m(ATUALIZADA!)\033[0m"
        read -p "Enter"
        rm ${SCPT_DIR}/*.x.c &>/dev/null
    }
}

del_KILL() {
    for arqlist in $(ls $DIR | grep -v "ERROR-KEY" | grep -v ".name"); do
        [[ -e /${DIR}/${arqlist}.name ]] || rm -rf /${DIR}/${arqlist}
    done
}

remover_key() {
    del_KILL
    i=0
    [[ -z $(ls $DIR | grep -v "ERROR-KEY") ]] && return
    echo "[$i] Volver"
    keys="$keys retorno"
    let i++
    for arqs in $(ls $DIR | grep -v "ERROR-KEY" | grep -v ".name"); do
        arqsx=$(ofus "$IP:8888/$arqs/$LIST")
        if [[ ! -e ${DIR}/${arqs}/used.date ]]; then
            echo -e "\033[1;32m[$i] $arqsx ($(cat ${DIR}/${arqs}.name))\033[1;33m (Key Activa)\033[0m" || rm -rf ${DIR}/${arqs}
        else
            echo -e "\033[1;31m[$i] $arqsx ($(cat ${DIR}/${arqs}.name))\033[1;33m ($(cat ${DIR}/${arqs}/used.date) IP: $(cat ${DIR}/${arqs}/used))\033[0m"
        fi
        keys="$keys $arqs"
        let i++
    done
    keys=($keys)
    msg -bar
    while [[ -z ${keys[$value]} || -z $value ]]; do
        read -p "Elija cual remover: " -e -i 0 value
    done
    [[ -d "$DIR/${keys[$value]}" ]] && rm -rf $DIR/${keys[$value]}* || return
}
remover_key_usada() {
    i=0
    [[ -z $(ls $DIR | grep -v "ERROR-KEY") ]] && return
    for arqs in $(ls $DIR | grep -v "ERROR-KEY" | grep -v ".name"); do
        arqsx=$(ofus "$IP:8888/$arqs/$LIST")
        if [[ -e ${DIR}/${arqs}/used.date ]]; then #KEY USADA
            if [[ $(ls -l -c ${DIR}/${arqs}/used.date | cut -d' ' -f7) != $(date | cut -d' ' -f3) ]]; then
                rm -rf ${DIR}/${arqs}*
                echo -e "\033[1;31m[KEY]: $arqsx \033[1;32m(Eliminada!)\033[0m"
            else
                echo -e "\033[1;32m[KEY]: $arqsx \033[1;32m(Key Activa!)\033[0m"
            fi
        else
            echo -e "\033[1;32m[KEY]: $arqsx \033[1;32m(Key Activa!)\033[0m"
        fi
        let i++
    done
    msg -bar2
    echo -ne "\033[0m" && read -p "Enter"
}
start_gen() {
    unset bot_ini
    PIDGEN=$(ps x | grep -v grep | grep "http-server.sh")
    if [[ ! $PIDGEN ]]; then
        msg -bar
        echo -ne "\033[1;97m Poner en linea despues de un reinicio [s/n]: "
        read bot_ini
        msg -bar
        [[ $bot_ini = @(s|S|y|Y) ]] && {
            crontab -l >/root/cron
            echo "@reboot screen -dmS generador /bin/http-server.sh -start" >>/root/cron
            crontab /root/cron
            rm /root/cron
            echo '#!/bin/bash
killall http-server.sh
screen -dmS generador /bin/http-server.sh -start
echo  #' >/bin/genon
            chmod +rwx /bin/genon
            echo "00 * * * * root bash /bin/genon" >>/etc/crontab
            service cron restart
        } || {
            crontab -l >/root/cron
            sed -i '/http-server.sh/ d' /root/cron
            crontab /root/cron
            rm /root/cron
            sed '/genon/ d' /etc/crontab >/bin/ejecutar/crontab
            cat /bin/ejecutar/crontab >/etc/crontab
            service cron restart

        }
        genon
    else
        killall http-server.sh
    fi
}
message_gen() {
    read -p "Ingresa el Mensaje: " MSGNEW
    [[ -z $MSGNEW ]] && return
    echo $MSGNEW >/etc/menu_ito
    cat /etc/menu_ito >${SCPT_DIR}/menu_credito
    read -p "Ingresa tu Numero de Contacto o tu ALIAS de TELEGRAM: " MSGNEW
    echo $MSGNEW >/etc/menu_numito && chmod +rwx /etc/menu_numito
    msg -bar
}

act_gen() {
    while [[ ${varread} != @([0-2]) ]]; do
        echo -e "Bienvenido al Actualizador, Escoje que vas a Actualizar\n 1).- KEY ACTIVA\n 2).- Creditos del ADM\n " | lolcat
        echo -ne "${cor[6]}"
        read -p " Escoje :" varread
    done
    msg -bar
    if [[ ${varread} = 0 ]]; then
        return
    elif [[ ${varread} = 1 ]]; then
        att_gen_key
    elif [[ ${varread} = 2 ]]; then
        message_gen
    fi

    #source <(curl -sL https://raw.githubusercontent.com/ChumoGH/ChumoGH-Script/master/Key-gerar/insta.sh)
}

rmv_iplib() {
    echo -e "SERVIDORES DE KEY ATIVOS!"
    rm /var/www/html/newlib && touch /var/www/html/newlib
    rm ${SCPT_DIR}/*.x.c &>/dev/null
    [[ -z $(ls $DIR | grep -v "ERROR-KEY") ]] && return
    for arqs in $(ls $DIR | grep -v "ERROR-KEY" | grep -v ".name"); do
        if [[ $(cat ${DIR}/${arqs}.name | grep GERADOR) ]]; then
            var=$(cat ${DIR}/${arqs}.name)
            ip=$(cat ${DIR}/${arqs}/keyfixa)
            # echo -ne "\033[1;31m[USUARIO]:(\033[1;32m${var%%[*}\033[1;31m) \033[1;33m[GERADOR]:\033[1;32m ($ip)\033[0m"
            echo "$ip" >>/var/www/html/newlib && echo -e " \033[1;36m[ATUALIZADO]"
        fi
    done
    echo "51.222.29.216" >>/var/www/html/newlib
    msg -bar
    read -p "Enter"
}

bot_menu() {
    [[ -e /etc/nivbot ]] || echo "0" >/etc/nivbot
    [[ -d /etc/ADM-db ]] && chmod +rwx /etc/ADM-db/*
    echo -ne "\033[1;31m[ ! ] RESPALDANDO USUARIO ADMINISTRADOR "
    (
        [[ -e /etc/ADM-db/sources/costes ]] && mv /etc/ADM-db/sources/costes $HOME/costes
        [[ -e /etc/ADM-db/token ]] && mv /etc/ADM-db/token $HOME/token
        [[ -e /etc/ADM-db/Admin-ID ]] && mv /etc/ADM-db/Admin-ID $HOME/Admin-ID
        [[ -e /etc/ADM-db/User-ID ]] && mv /etc/ADM-db/User-ID $HOME/User-ID
        [[ -e /etc/ADM-db/limit ]] && mv /etc/ADM-db/limit $HOME/limit
        [[ -e /etc/ADM-db/resell ]] && mv /etc/ADM-db/resell $HOME/resell
        [[ -e /etc/ADM-db/ress ]] && mv /etc/ADM-db/ress $HOME/ress
        [[ -e /etc/ADM-db/num-key.cont ]] && mv /etc/ADM-db/num-key.cont $HOME/num-key.cont
    ) && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
    rm -rf /etc/ADM-db
    CIDdir=/etc/ADM-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
    [[ ! -e "${CIDdir}/confbot.sh" ]] && wget --no-check-certificate -O ${CIDdir}/confbot.sh https://raw.githubusercontent.com/NetVPS/Generador-BOT/main/Code-BOT-General/intBOT.sh &>/dev/null && chmod +rwx ${CIDdir}/confbot.sh
    sed -i -e 's/\r$//' ${CIDdir}/confbot.sh
    source ${CIDdir}/confbot.sh && rm -f ${CIDdir}/confbot.sh
    bot_conf
}

fum_ver() {
    while [[ ! $Keey ]]; do
        clear
        export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games
        echo -e "\n      \033[1;32m DIGITA TU KEY A VERIFICAR "
        msg -ne "Script Key: " && read Keey
        [[ ! -z $Keey ]] && Keey="$(echo "$Keey" | tr -d '[[:space:]]')"
        tput cuu1 && tput dl1
    done
    REQUEST=$(ofus "$Keey" | cut -d'/' -f2)
    echo -e "\n"
    echo -e " FILE Contend : ${REQUEST} $(echo ${REQUEST} | wc -c)"
    echo -e "\n"
    echo -e " VERIFICA, Si tu key Contiene \033[1;45m KEY DE ChumoGH! \033[0m "
    echo -e "\n"
    msg -ne " Link Key: http://$(ofus $Keey) \n                      "
    IiP=$(ofus "$Keey" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
    [[ $(curl -s --connect-timeout 2 $IiP:8888) ]] && echo -e "\033[1;42mCONEXION CON SERVIDOR EXITOSA\033[0m" || echo -e "\033[1;43mCONEXION CON SERVIDOR FALLIDA\033[0m"
    wget --no-check-certificate -O $HOME/list-key $(ofus $Keey)/$(wget -qO- ipv4.icanhazip.com) >/dev/null 2>&1 && echo -ne "\033[1;32m  [ VERIFICANDO ]" || echo -e "\033[1;31m [ No Existe Acceso al KEY ]" #&& echo -e "\033[1;32m [ Key  ]\n" || echo -e "\033[1;31m [ No Existe Acceso al KEY ]"
    ofen=$(wget -qO- $(ofus $Keey))
    unset arqx
    [[ -d $HOME/install ]] && rm -rf $HOME/install/* || mkdir $HOME/install
    verificar_arq() {
        echo "$1" >>$HOME/install/log.txt
    }
    n=1
    IP=$(ofus "$Keey" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" >/usr/bin/vendor_code
    pontos="."
    stopping=" COMPROBANDO " | sed -e 's/[^a-z -]//ig'
    for arqx in $(cat $HOME/list-key); do
        msg -verm "${stopping}${pontos}" && sleep 0.3s
        wget --no-check-certificate -O $HOME/install/${arqx} ${IP}:81/${REQUEST}/${arqx} >/dev/null 2>&1 && verificar_arq "${arqx}"
        tput cuu1 && tput dl1
        pontos+="."
        n=$(($n + 1))
    done
    echo -ne " ---> ESTADO : \033[1;45m$ofen\033[0m  con "
    [[ ! -e $HOME/install/log.txt ]] && touch $HOME/install/log.txt
    echo " $(cat <$HOME/install/log.txt | wc -l) FILES " && rm -f $HOME/install/log.txt
    msg -ne " \033[1;42mESTADO :\033[0m "
    [[ -e $HOME/list-key ]] && {
        echo -ne "  "
        [[ $ofen = "KEY DE ChumoGH!" ]] &&
            echo -e "KEY FUNCIONAL" && rm -f $HOME/list-key && echo -ne "\033[0m"
    } || echo -e " KEY INVALIDA O USADA\033[0m\n"
    #curl -s --connect-timeout 2 ${IiP}:81/${REQUEST}/menu_credito > menu_credito
    msg -ne " RESELLER del Key :\033[0m  "
    [[ -e $HOME/install/menu_credito ]] && {
        echo -ne "  "
        [[ "$(cat $HOME/install/menu_credito)" = "" ]] && {
            echo -e "SIN RESELLER\033[0m"
        } || echo -e "$(cat $HOME/install/menu_credito)\033[0m" && rm -rf $HOME/install && echo -ne "\033[0m"
    } || echo -e " NO HAY CONTENIDO DE KEY Key\033[0m\n"
    read -p "Enter"
}

alter_id() {
    while [[ ${varread} != @([0-3]) ]]; do
        tittle
        msg -bar
        echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m<\033[0;33m Alterar Creditos POR ID   \033[0;32m(#OFICIAL)"
        echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m<\033[0;33m REINICIAR CONTADOR TOTAL  \033[0;32m(#OFICIAL)"
        msg -bar
        echo -e " \033[0;35m[\033[0;36m0\033[0;35m] \033[0;34m<\033[0;33m Regresar"
        msg -bar
        echo -ne "${cor[6]}"
        read -p " Opcion : " varread
    done
    msg -bar
    if [[ ${varread} = 0 ]]; then
        return 0
    elif [[ ${varread} = 1 ]]; then
        echo -e "\033[1;32m DIGITA ID A REINICIAR "
        msg -ne " Paste ID : " && read newli
        sed -i "/${newli}/d" /etc/ADM-db/num-key.cont
        echo "REGISTRO EN $(grep -o -i $newli /etc/ADM-db/num-key.cont | wc -l) KEYS"
        read -p "Limite Aplicado Exitosamente"
    elif [[ ${varread} = 2 ]]; then
        echo -e "\033[1;32m BORRAREMOS EL CONTEO TOTAL DEL GENERADOR "
        rm -rf /etc/ADM-db/num-key.cont && touch /etc/ADM-db/num-key.cont
        echo "REGISTRO EN $(cat /etc/ADM-db/num-key.cont | wc -l) KEYS"
        read -p "Limite Aplicado Exitosamente"
    fi
}

# SISTEMA DE SELECAO
selection_fun() {
    local selection="null"
    local range
    for ((i = 0; i <= $1; i++)); do range[$i]="$i "; done
    while [[ ! $(echo ${range[*]} | grep -w "$selection") ]]; do
        echo -ne "\033[1;37mOpcion: " >&2
        read selection
        tput cuu1 >&2 && tput dl1 >&2
    done
    echo $selection
}
alter_limit() {
    echo -e "\033[1;32m DIGITA TU NUEVO LIMITE "
    msg -ne "New Limit: " && read newli
    echo $newli >/etc/ADM-db/limit
    read -p "Limite Aplicado Exitosamente"
}

dropIP() {
    [[ ! -e /etc/dropIP.sh ]] && wget -q -O /etc/dropIP.sh https://www.dropbox.com/s/12r0h64vb1lc1oy/dropIP.sh?dl=0
    unset PIDGEN
    if [[ -e /var/www/html/ChumoGH/VPSbot/main/TeleBotGen/Control/Control-Bot ]]; then
        echo -e "[Unit]
Description=BotGen Service by @ChumoGH
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/bash /etc/dropIP.sh
Restart=always
RestartSec=3s

[Install]
WantedBy=multi-user.target" >/etc/systemd/system/dropIP.service

        systemctl enable dropIP &>/dev/null
        systemctl start dropIP &>/dev/null
    else
        killall dropIP &>/dev/null
        systemctl stop dropIP &>/dev/null
        systemctl disable dropIP &>/dev/null
        rm /etc/systemd/system/dropIP.service &>/dev/null
        clear
        msg -bar
        echo -e "\033[1;31m            BotGen fuera de linea"
        msg -bar
        read -p "Presione Enter para continuar "
    fi

}

meu_ip

menau() {
    unset PID_GEN1
    PID_GEN=$(ps x | grep -v grep | grep "http-server.sh")
    PID_GEN1=$(ps x | grep -v grep | grep "8888")
    PID_BGEN1=$(ps x | grep -v grep | grep "BotGen.sh")
    add_fun="${PID_BGEN1}"
    tittle
    [[ -e /etc/valkey ]] && {
        figlet -f smslant "$(cat </etc/valkey)" | lolcat
        msg -bar
    } || {
        figlet -p -f smslant "@ChumoGH" | lolcat
        msg -bar
    }
    [[ ! $PID_GEN ]] && PID_GEN="\033[0;35m[\033[0;31mDETENIDO\033[0;35m]" || PID_GEN="\033[0;35m[\033[0;36mWORKING\033[0;35m]"
    [[ ! $PID_GEN1 ]] && PID_GEN1="\033[0;35m[\033[0;31m OFF \033[0;35m]" || PID_GEN1="\033[0;35m[\033[0;36m ON \033[0;35m]"
    [[ ! $PID_BGEN1 ]] && {
        PID_BGEN1="\033[0;35m[\033[0;31mNO INICIADO\033[0;35m]"
        lim_menu='11'
    } || PID_BGEN1="\033[0;35m[\033[0;36mFUNCIONANDO\033[0;35m]" && lim_menu='12'
    ports_
    [[ -e /etc/ADM-db/limit ]] && limcont=$(cat /etc/ADM-db/limit)
    [[ "${limcont}" -ge "998" ]] && limted="50" || {
        [[ -e /etc/ADM-db/limit ]] && limted=$(cat /etc/ADM-db/limit)
    }
    [[ -z $limted ]] && limted="No Found"
    msg -bar
    cd ${SCPT_DIR}
    echo -e "\033[0;35m |\033[0;32m $(find . -type f | wc -l) \033[0;35m|\033[0;33m Ficheros\033[0;32m >\033[1;31m ${SCPT_DIR} \033[0;34mcon\033[0;35m |\033[0;32m$(ls /etc/http-shell/ | grep name | wc -l)\033[0;35m|\033[0;33m\033[0;33m KEYs"
    cd $HOME
    msg -bar
    meu_ip
    [[ -z $add_fun ]] || echo -e "\033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m<\033[0;33m Alterar Limite del BOT ( $limted )" #$PID_GEN1\033[0m
    echo -e "\033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m<\033[0;33m APAGAR/VER KEYS"
    #echo -e "\033[0;35m[\033[0;36mx\033[0;35m] \033[0;34m<\033[0;33m ------------------------" #KEYS ( GENERADOR )"
    echo -e "\033[0;35m[\033[0;36m4\033[0;35m] \033[0;34m<\033[0;34m Generar Keys ALEATORIAS"
    echo -e "\033[0;35m[\033[0;36m5\033[0;35m] \033[0;34m<\033[0;33m INICIAR/PARAR KEYGEN $PID_GEN\033[0m"
    echo -e "\033[0;35m[\033[0;36m6\033[0;35m] \033[0;34m<\033[0;33m REGISTRO DE KEYS USADAS"
    echo -e "\033[0;35m[\033[0;36m7\033[0;35m] \033[0;34m<\033[0;33m Checar KEY ACTIVADA"
    echo -e "\033[0;35m[\033[0;36m8\033[0;35m] \033[0;34m<\033[0;33m ACTUALIZAR GENERADOR/KEY/CREDITOS "
    echo -e "\033[0;35m[\033[0;36m9\033[0;35m] \033[0;34m<\033[0;33m Actualizar KEY"
    echo -e "\033[0;35m[\033[0;36m10\033[0;35m] \033[0;34m<\033[0;33m CONFIGURAR BOT DE TELEGRAM $PID_BGEN1\033[0m"
    [[ -z $add_fun ]] || echo -e "\033[0;35m[\033[0;36m11\033[0;35m] \033[0;34m<\033[0;33m + / - CREDITOS Por ID"
    echo -e "\033[0;35m[\033[0;36m0\033[0;35m] \033[0;34m<\033[0;33m SALIR"
    msg -bar

}

while :; do
    menau
    selection=$(selection_fun $lim_menu)
    case ${selection} in
    0) cd $HOME && break ;;
    1) alter_limit ;;
    2) remover_key ;;
    3) remover_key_usada ;;
    4) fix_key ;;
    5) start_gen ;;
    6)
        echo -ne "\033[1;36m"
        echo -e "$(cat /etc/gerar-sh-log)" 2>/dev/null || echo "NINGUN LOG DE MOMENTO"
        echo -ne "\033[0m" && read -p "Enter"
        ;;
    7) fum_ver ;;
    8) act_gen ;;
    9) att_gen_key ;;
    10) bot_menu ;;
    11) alter_id ;;
    esac
done
