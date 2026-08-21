Módulo 2 — Redirecionamento e pipes avançados



stdout, stderr e os descritores de arquivo



Todo processo tem três canais abertos por padrão: 0 (stdin), 1 (stdout) e 2 (stderr). O operador > sozinho redireciona apenas o stdout — o stderr continua indo para o terminal a menos que seja redirecionado explicitamente.



ls /existe /nao-existe 1> saida.txt 2> erros.txt



Combinando stdout e stderr — a ordem importa



2>&1 copia o destino atual do stdout para o stderr, no momento em que é executado — não cria um vínculo permanente. Por isso a ordem dos redirecionamentos muda o resultado:



Funciona: stdout já aponta pro arquivo quando 2>&1 é aplicado

ls /existe /nao-existe > tudo.txt 2>&1



Não funciona como esperado: 2>&1 copia o destino antigo (terminal) antes do stdout ser redirecionado pro arquivo

ls /existe /nao-existe 2>&1 > tudo.txt



Process substitution



<(comando) executa um comando e expõe sua saída como se fosse um arquivo (via /dev/fd/…), sem precisar de arquivo temporário. Útil para comparar saídas de dois comandos diretamente:



diff <(ls pasta1) <(ls pasta2)



tee — duplicando um fluxo

tee recebe dados via stdin, exibe na tela e grava em arquivo simultaneamente, permitindo inspecionar dados no meio de uma pipeline sem interrompê-la:



ls -la | tee listagem.txt | grep txt   (grava tudo, filtra o repasse)

echo “linha” | tee -a log.txt          (-a evita sobrescrever o arquivo)







