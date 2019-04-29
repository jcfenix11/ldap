#!/bin/bash
#user cn=admin,dc=quesitos,dc=com password pdc135
apt install slapd
apt install ldap-utils
nano rama.ldif
ldapadd -D "cn=admin,dc=quesitos,dc=com" -W -h 127.0.0.1 -x -f rama.ldif
nano cambiarPsw.ldif 
ldapadd -Y EXTERNAL -H ldapi:/// -f cambiarPsw.ldif
