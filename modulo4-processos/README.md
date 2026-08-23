## Módulo 4 — Processos

### Visualização de processos (ps)
- `ps` — snapshot dos processos do terminal atual (não atualiza sozinho)
- `ps aux` — todos os processos do sistema, formato BSD (colunas: USER, PID, %CPU, %MEM, STAT, COMMAND)
- `ps -ef` — todos os processos, formato UNIX/System V (colunas: UID, PID, PPID, CMD)
- Cada execução de `ps`/`ps aux`/`ps -ef` gera um PID novo pra si mesma; processos persistentes (ex. o shell) mantêm o mesmo PID entre chamadas

### Monitoramento em tempo real (top / htop)
- `top` — monitor padrão, tecla `P` ordena por CPU, `M` por memória, `k` mata processo, `q` sai
- `htop` — versão visual (`pkg install htop`), navegação por setas, `F9` mata processo selecionado, `F6` muda ordenação
- No Termux: campos como Load average, Uptime e núcleos "offline" aparecem como `nan`/`unknown`/`offline` — limitação esperada do sandbox Android, não é erro

### Sinais e kill
- `kill PID` — envia SIGTERM (15): pede término educado, processo pode capturar e limpar antes de sair
- `kill -9 PID` — envia SIGKILL (9): mata imediatamente via kernel, sem chance de reação do processo
- `killall nome` — mata por nome do processo em vez de PID
- `kill -l` — lista todos os sinais disponíveis
- Saída do shell diferencia o sinal usado: `Terminated` (SIGTERM) vs `Killed` (SIGKILL)

### Controle de jobs (jobs, fg, bg)
- `comando &` — roda em background e vira um job numerado do shell (`[1]`, `[2]`...)
- `jobs` — lista jobs do shell atual com status (Running/Stopped)
- `Ctrl+Z` — pausa (STOPPED) o processo em foreground, sem matar
- `bg %N` — retoma job N em background
- `fg %N` — traz job N para foreground
- Referências de job: `%N` (número), `%+`/`%%` (job atual/mais recente), `%-` (job anterior), `%nome` (por prefixo do comando)
- `%N` também funciona com `kill` (ex. `kill %1`)

### nohup e persistência de processos
- Por padrão, `comando &` está preso à sessão do shell: fechar o terminal envia SIGHUP e mata o processo
- `nohup comando &` — blinda contra SIGHUP; redireciona saída para `nohup.out` (aviso impresso na hora, dispensa checar com `ls`)
- `disown` — remove o job da tabela de jobs do shell (não precisa de redirecionamento como o nohup)
- `nohup comando & disown` — combinação comum para automações resilientes ao fechamento do terminal
- Para automação recorrente: `cron` (agendada) ou `systemd`/init scripts (serviços que reiniciam sozinhos) — fora do escopo direto de `&`/`nohup`
- Limitação específica do ambiente mobile: o Android pode matar o processo do app Termux por gerenciamento de memória, independente do shell
