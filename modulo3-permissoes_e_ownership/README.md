MÓDULO 3 — PERMISSÕES E OWNERSHIP



1. Estrutura das permissões



Todo arquivo/diretório no Linux tem três categorias de “dono” — usuário (owner), grupo (group) e outros (others) — cada uma com três permissões possíveis: leitura (r), escrita (w) e execução (x).



No ls -la isso aparece como uma string de 10 caracteres, ex: -rwxr-x—



1º caractere: tipo (- arquivo, d diretório, l link)

Caracteres 2-4: permissões do owner

Caracteres 5-7: permissões do group

Caracteres 8-10: permissões de others



2. chmod — modo simbólico



Altera permissões usando letras e operadores:



Categorias: u (owner), g (group), o (others), a (all)

Operadores: + (adicionar), - (remover), = (definir exatamente)

Permissões: r, w, x



chmod u+x arquivo    (adiciona execução só pro owner)

chmod go-rwx arquivo (remove tudo de group e others)



3. chmod — modo numérico (octal)



Cada permissão vale um número, somado por categoria:

r = 4, w = 2, x = 1



Exemplos de combinações:

rwx = 7

rw- = 6

r-x = 5

— = 0



O comando usa um número de 3 dígitos (owner, group, others):



chmod 750 arquivo

(owner=7 rwx, group=5 r-x, others=0 —)



resultado: -rwxr-x—



4. chown — mudança de dono e grupo



Muda o proprietário e/ou grupo de um arquivo:



chown usuario:grupo arquivo

chown usuario arquivo     (só o dono)

chown :grupo arquivo      (só o grupo)



Ponto de atenção: $(comando) no bash executa o que está dentro dos parênteses como comando e substitui pela saída — não é um simples placeholder de texto. Usar $(whoami) funciona porque whoami é executado e devolve o nome do usuário atual; digitar o nome do usuário diretamente sem $() também funciona, desde que a grafia esteja correta (ex: underline vs. hífen fazem diferença e geram “invalid user”).



Em ambientes multiusuário restritos (como Termux/proot no Android), o chown para outro usuário normalmente exige privilégio de root, já que o processo só tem permissão sobre seus próprios arquivos.



5. umask — permissões padrão de arquivos novos



umask define quais permissões são subtraídas do máximo padrão ao criar arquivos/pastas novos:



Arquivos nascem, por padrão do sistema, com permissão máxima 666 (rw-rw-rw-)

Diretórios nascem com permissão máxima 777 (rwxrwxrwx)

O valor do umask é subtraído desse máximo



Exemplo: umask 077 → 666 - 077 = 600 → -rw—––

Exemplo: umask 022 → 666 - 022 = 644 → -rw-r–r–



O comando umask sozinho mostra o valor atual; umask NNN muda o valor para a sessão do shell atual.



6. Sticky bit



Aplicado em diretórios (não em arquivos individuais). Numa pasta onde vários usuários têm permissão de escrita, o sticky bit impede que um usuário apague ou renomeie arquivos de outros usuários dentro dessa pasta — só o dono do arquivo, o dono da pasta ou root podem fazer isso, mesmo com escrita liberada para todos na pasta.



Sintaxe simbólica: chmod +t pasta

Sintaxe numérica: dígito 1 na frente do número de 3 dígitos, ex. chmod 1777 pasta



Na saída do ls -la, o sticky bit aparece no lugar do x de others:

t minúsculo = sticky bit ativo E execução presente

T maiúsculo = sticky bit ativo SEM execução



Exemplo clássico de uso: a pasta /tmp do sistema, compartilhada por todos os usuários.



RESUMO DOS COMANDOS VISTOS

chmod u+x arquivo — adiciona permissão simbólica

chmod 750 arquivo — define permissão numérica completa

chown usuario:grupo arquivo — muda dono e grupo

umask — mostra/define permissões padrão de novos arquivos

chmod +t pasta ou chmod 1XXX pasta — ativa sticky bit

