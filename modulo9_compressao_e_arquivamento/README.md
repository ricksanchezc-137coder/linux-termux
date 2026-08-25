## Módulo 9 — Compressão e arquivamento (Currículo 13)

- Aplicado tar/gzip/zip para gerar backups compactados do projeto.
- Pacote de distribuição criado com tar.gz, excluindo `.venv`, `__pycache__`, `.git` e `*.pyc`:

```bash
tar -czf sistema-bancario-backup-$(date +%Y%m%d).tar.gz \
--exclude='.venv' --exclude='__pycache__' \
--exclude='.git' --exclude='*.pyc' .
