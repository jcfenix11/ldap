#!/bin/bash
#user cn=admin,dc=quesitos,dc=com password pdc135
apt install slapd
apt install ldap-utils
nano rama.ldif
ldapadd -D "cn=admin,dc=quesitos,dc=com" -W -h 127.0.0.1 -x -f rama.ldif

slappasswd -h {MD5} //cambiar pssw

nano cambiarPsw.ldif 
ldapadd -Y EXTERNAL -H ldapi:/// -f cambiarPsw.ldif

ldapsearch -x -LLL -b "dc=quesitos,dc=com" -D "cn=lector,dc=quesitos,dc=com" -W -h 127.0.0.1 "uid=jorge.gonzales"
ldapsearch -x -LLL -b "dc=quesitos,dc=com" -D "cn=admin,dc=quesitos,dc=com" -W -h 127.0.0.1 "cn=lector"
#uso de and
ldapsearch -x -LLL -b "dc=quesitos,dc=com" -D "cn=admin,dc=quesitos,dc=com" -W -h 127.0.0.1 "(&(objectClass=organizationalRole)(cn=lector))"
#alternativas a changetype
