#!/bin/bash
# -*- ENCODING: UTF-8 -*-

CIDdir=/etc/ADM-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
SRC="${CIDdir}/sources" && [[ ! -d ${SRC} ]] && mkdir ${SRC}
CID="${CIDdir}/User-ID" && [[ ! -e ${CID} ]] && echo > ${CID}
keytxt="${CIDdir}/keys" && [[ ! -d ${keytxt} ]] && mkdir ${keytxt}
LINE="   ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••"

# Token del bot
bot_token="$(cat ${CIDdir}/token)"

msj_add () {
[[ -z $bot_token ]] && exit
ID=$1 && ID="$(echo $ID | awk '{print $1}' | sed -e 's/[^0-9]//ig')"
[[ ${ID} -lt '999' ]] && ID='576145089'
urlBOT="https://api.telegram.org/bot$TOKEN/sendMessage"
#curl -s --max-time 10 -d "chat_id=$ID&disable_web_page_preview=1&text=$(echo -e "$MENSAJE")" $urlBOT &>/dev/null
curl -s -X POST $urlBOT -d chat_id=$ID -d text="$(echo -e "$MENSAJE")" &>/dev/null
}

#FUNCION DESTRUIR ID
unset i
for i in $(cat /etc/ADM-db/User-ID | awk '{print $3}'); do 
[[ "$(date -d $(date '+%C%y-%m-%d') +%s)" -ge "$(date -d $i +%s)" ]] && {
for id in $(cat /etc/ADM-db/User-ID | grep "$i" | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig'); do
sed -i "/${id}/d" /etc/ADM-db/User-ID
echo -e " ID : ${id} REMOVIDO $i en $(date '+%C%y-%m-%d') - $(date +%R) " >> $HOME/killID.log
          MENSAJE="•••••••••••••••••📩𝙈𝙀𝙉𝙎𝘼𝙅𝙀 𝙍𝙀𝘾𝙄𝘽𝙄𝘿𝙊📩•••••••••••••••••\n"
          MENSAJE+=" SU MEMBRESIA HA FINALIZADO MEDIANTE KILL-ID\n"
          MENSAJE+=" FIN DE CONTRADO : $(date '+%C%y-%m-%d') - $(date +%R) \n"
          MENSAJE+=" SI DESEAS APELAR TU CONTRADO, CONTACTA CON $(cat < /etc/ADM-db/resell)\n"
          MENSAJE+=" $LINE\n"
          MENSAJE+=" ADQUIERE TU MEMBRESIA DESDE @$(ShellBot.username) , DIGITANDO /prices \n"
          MENSAJE+=" RECUERDA MANTENER TU CAPTURA DE PAGO, PARA ALGUN RECLAMO!\n"
          MENSAJE+=" $LINE\n"
msj_add ${id}
done
}
done

exit
