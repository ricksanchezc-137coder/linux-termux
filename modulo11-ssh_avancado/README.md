### Módulo 11 — SSH avançado (chaves, config, agent, tunneling)

Geração de chaves ed25519, `~/.ssh/config` com aliases, permissões
(700/600), `ssh-agent`/`ssh-add`, e `sshd` local (porta 8022) montado
como alvo de teste. Tunelamento testado nos três modos: local (`-L`),
remoto (`-R`) e dinâmico/SOCKS (`-D`) — todos validados com `curl`
retornando 200 OK (incluindo um teste real via proxy SOCKS contra o
github.com).

Status: passos 1–7 concluídos. Passo 8 (aplicação na config real do
GitHub + limpeza da chave/sshd de teste) pendente.
