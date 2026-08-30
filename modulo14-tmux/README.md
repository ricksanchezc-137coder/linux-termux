# Módulo 14 — tmux (multiplexador de terminal)

Uso do tmux pra manter sessões de trabalho persistentes no Termux, resolvendo o problema de processos morrerem quando o app é fechado.

## O que foi feito

- Sessões, janelas e painéis (split) criados, navegados e encerrados na prática
- **Persistência real confirmada**: um `while true` rodando data/hora a cada 5s sobreviveu ao Termux sendo encerrado de verdade (notificação + apps recentes), sem gaps no output
- Configuração básica via `~/.tmux.conf` (mouse, history-limit, cor da status bar)
- Aplicação prática no sistema-bancario: sessão dedicada com testes rodando em loop num painel e edição de código no outro

## Comandos principais

| Comando | Ação |
|---|---|
| `tmux new -s nome` | Cria sessão |
| `tmux attach -t nome` | Reconecta |
| `Ctrl+b d` | Detach (sai sem matar) |
| `Ctrl+b c` | Nova janela |
| `Ctrl+b %` / `Ctrl+b "` | Split vertical / horizontal |
| `tmux source-file ~/.tmux.conf` | Recarrega config |

## Troubleshooting encontrado

- Bug intermitente: `tmux` morrendo com `[exited]` logo ao iniciar, em 2 tentativas seguidas — causa raiz não confirmada (não reapareceu depois)
- `pytest` global quebrado: shebang apontando pra `python3.13`, removido após o Termux atualizar o Python pra 3.14 — resolvido rodando os testes de dentro do `.venv` do projeto (correção definitiva do pytest global ainda pendente)

## Status
Módulo 14 concluído.
