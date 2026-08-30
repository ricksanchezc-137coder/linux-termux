# Módulo 13 — Agendamento de tarefas (cron)

Testado agendamento com cron no Termux (`cronie`/`crond`) e no Ubuntu via proot-distro (`cron`), sem depender de systemd (ausente nos dois ambientes — confirma o que já tínhamos visto no Módulo 11 com o sshd).

**Principais achados:**
- `service cron start` funciona no Ubuntu proot-distro mesmo sem systemd (cai automaticamente pro SysV init).
- `proot-distro` não isola a tabela de processos — Termux e Ubuntu compartilham o mesmo espaço de PIDs.
- Persistência do `crond` no Termux não é garantida a longo prazo; sobrevive a fechar a sessão (`exit`), mas pode ser morto pelo Android (indício de relação com bateria baixa, não totalmente confirmado).
- `%` precisa ser escapado (`\%`) dentro de comandos no crontab.

**Aplicação prática:** cron job de teste automatizando o backup do sistema-bancario (reaproveitando o `tar` do Módulo 9, com exclusões de `.venv`, `__pycache__`, `.git`, `.pytest_cache`, `htmlcov`). Validado com execuções reais e depois removido — não há automação de backup rodando de fato, só serviu pra provar o mecanismo.

Notas completas em `notas-modulo13.md`.
