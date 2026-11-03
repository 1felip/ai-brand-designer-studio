---
description: Visualiza e ajusta o Brand DNA (paleta, tipografia, master style)
argument-hint: [ajuste opcional]
---

# /dna — Ver e ajustar o Brand DNA

Siga o `CLAUDE.md`. Ajuste solicitado (opcional): $ARGUMENTS

1. Leia `brand/brand-dna.md`. Se não existir, sugira `/onboarding`.
2. Mostre um **resumo compacto**: mood, paleta 60/30/10 (HEX), tipografia, linguagem visual, iluminação, Master Style Prompt e Negative Prompt.
3. Se nenhum ajuste veio nos argumentos, pergunte o que ajustar com opções:
   A: Paleta · B: Tipografia · C: Mood/linguagem visual · D: Iluminação · E: Master/Negative Prompt
   Para o item escolhido, ofereça **3 alternativas (A/B/C)** coerentes com o restante do DNA. **Pare e espere.**
4. Aplique a mudança em `brand/brand-dna.md`, mantendo o documento coerente: se a paleta mudar, atualize também o Master Style Prompt. Registre a alteração numa seção **"Histórico de alterações"** no fim do arquivo (data, o que mudou e por quê).
5. Atualize o `README.md`, se necessário, e rode:
   `git add . && git commit -m "feat(dna): update <diretriz> guidelines" && git push origin main`
