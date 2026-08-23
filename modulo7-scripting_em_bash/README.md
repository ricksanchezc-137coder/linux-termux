
## Módulo 7 — Scripting em bash (Currículo 13)

Praticado em `terminal-linux/modulo7-scripting_em_bash/`, cobrindo:

- **Condicionais**: `if/elif/else`, `[ ]` vs `[[ ]]`, `case`
- **Loops**: `for`, brace expansion (`{1..5}`), `while`, `until`
- **Funções**: argumentos posicionais, `return` (código de saída) vs. `echo` + `$(...)` para capturar valor, escopo `local` vs. global
- **Arrays**: declaração, `${arr[@]}`, `${#arr[@]}`, `+=` para adicionar, `unset` para remover

Todos os passos testados e confirmados no terminal. Dois bugs reais depurados no processo: brace expansion com pontuação errada (`{1...5}` vs `{1..5}`) e conflito de nome entre variável de loop e array
