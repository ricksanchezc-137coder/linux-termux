## Módulo 6 — find e xargs (Currículo 13)

Aplicado `find` e `xargs` na manutenção e inspeção do projeto:

- **find**: busca por nome/tipo/tamanho/data/permissão (`-name`, `-iname`,
`-type`, `-maxdepth`, `-size`, `-empty`, `-mtime`, `-perm`); execução
direta com `-exec cmd {} \;` (um processo por arquivo) e `-exec cmd {} +`
(agrupado, mais eficiente); exclusão de diretórios com `-not -path`.
- **xargs**: pipe `find | xargs` quebra nomes de arquivo com espaço por
padrão — corrigido com `find -print0 | xargs -0` (terminador nulo).
`-I {}` também protege contra espaço, mas não contra quebra de linha
no nome.
- **Aplicado no projeto real**:
- Contagem de linhas por arquivo `.py`, excluindo `.venv`
(`find . -not -path "./.venv/*" -name "*.py" -print0 | xargs -0 wc -l`)
→ 3.278 linhas no total (sem excluir `.venv`, o find varre também os
pacotes do pip instalados e infla o número pra ~328k).
- Localização de arquivos de teste com `grep -l "def test_"`, ajustando
o padrão de nome pra `teste_*.py` (convenção real do projeto).
- Limpeza de `__pycache__` com `find -name "__pycache__" -type d -exec rm -rf {} +`.
