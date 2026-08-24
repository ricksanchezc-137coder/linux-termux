# Módulo 8 — Variáveis de ambiente e PATH

Aprofundamento do `export` e do PATH já vistos por cima no Currículo 12, agora olhando login/non-login shell, os arquivos de configuração do Termux e a precedência de comandos no PATH.

## Testado

- **Variável de shell vs. ambiente**: variável sem `export` não é herdada por subshell (`bash -c`); com `export`, é.
- **Tipo de sessão**: `$-` (flag `i`) e `shopt login_shell` confirmam que a sessão do Termux é login shell interativa.
- **Arquivos de config**: `~/.bash_profile` e `~/.bashrc` existem, idênticos (linha de PATH escrita pelo `pipx ensurepath` do Currículo 12), sem um dar `source` no outro.
- **Bug/particularidade do Termux**: `bash -l` executa **os dois** arquivos (contrariando a regra padrão do bash, que só leria `.bash_profile` numa login shell). Confirmado via linhas de rastro e documentado no issue `termux/termux-packages#25264` (`$PREFIX/etc/profile` força a leitura do `.bashrc`). Explica o PATH duplicado.
- **Precedência do PATH**: `type -a` lista todas as ocorrências de um comando na ordem de busca. Prepend (`PATH="novo:$PATH"`) testado na prática — um `ls` falso colocado na frente do PATH sequestrou o comando real.
- Limpeza confirmada: `env | grep -c '^'` e `printenv | wc -l` batendo (39).

## Conclusão

Módulo 8 concluído. Próximo: Módulo 9 (Compressão e arquivamento — tar, gzip, zip).
