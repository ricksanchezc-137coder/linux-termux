## Módulo 12 — Gerenciamento de pacotes do sistema (apt/dpkg)

Executado dentro do Ubuntu via `proot-distro login ubuntu`.

- `apt update`/`upgrade`: atualização do índice de pacotes vs. atualização dos pacotes instalados.
- `apt install`/`remove`/`purge`: diferença entre manter e apagar arquivos de configuração (`rc` vs. status limpo no `dpkg -l`).
- `apt search`/`show`/`list --installed`: pesquisa e inspeção de pacotes antes de instalar.
- `dpkg -l`/`-L`/`-S`: a camada de baixo nível por trás do apt — listagem de pacotes, arquivos instalados e busca reversa por caminho (achado: `/bin` é symlink pra `/usr/bin` no Ubuntu, o que afeta o `dpkg -S`).
- `dpkg -i` + `apt --fix-broken install`: reprodução de uma dependência quebrada (htop → libnl) e correção via apt.
- `apt autoremove`/`clean`/`autoclean`: limpeza de dependências órfãs e do cache de `.deb` (achado: o ambiente já limpa o cache automaticamente via hook `docker-clean`).
- Aplicação prática: rastreamento das dependências de sistema por trás do `sqlite3` do Python (`libsqlite3-0`), usado pelo sistema-bancario.

**Status: concluído.**
