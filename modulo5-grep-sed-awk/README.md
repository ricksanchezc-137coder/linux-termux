## Módulo 5 — grep, sed e awk na prática

### grep — busca de padrões
- `grep "padrao" arquivo` — busca simples
- `grep -i` — ignora maiúsculas/minúsculas
- `grep -v` — inverte (linhas que NÃO combinam)
- `grep -n` — mostra número da linha
- `grep -c` — conta linhas que combinam
- `grep -r` — busca recursiva em diretórios
- `grep -o` — mostra só o trecho que combinou
- `grep -E "a|b"` — regex estendida (OR, +, parênteses sem escapar)

### sed — edição de texto em fluxo
- `sed 's/antigo/novo/'` — substitui a 1ª ocorrência por linha (só exibe, não altera arquivo)
- `sed 's/antigo/novo/g'` — substitui todas as ocorrências (flag g)
- `sed -i 's/.../.../'` — edita o arquivo de verdade (in-place)
- `sed -n '2,4p'` — mostra só um intervalo de linhas (-n suprime saída padrão, p imprime)
- `sed '/padrao/d'` — deleta linhas que combinam com o padrão
- Sem `-i`, o `sed` só imprime na tela; o arquivo original fica intacto

### awk — processamento por campos
- `$1`, `$2`... — campos da linha (separados por espaço por padrão); `$0` = linha inteira
- `NF` — número de campos na linha atual
- `NR` — número da linha atual
- `awk -F',' ...` — muda o delimitador de campo
- `awk '$2 == "valor" {print ...}'` — filtro condicional por campo
- Campos são recalculados a cada execução — alterar o texto antes (ex. via `sed`) desloca a numeração dos campos

### Pipeline combinado
- `grep | sed | awk` — filtra, transforma e extrai em cadeia
- `sort | uniq -c` — ordena e conta ocorrências consecutivas (útil após extrair uma coluna com awk)

**Status:** Módulo 5 (grep, sed e awk) concluído.
