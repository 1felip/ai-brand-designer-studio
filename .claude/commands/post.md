---
description: Gera direção de arte e 3 prompts técnicos para um post
argument-hint: [tema opcional]
---

# /post — Post para redes sociais

Siga o `CLAUDE.md`. Tema sugerido pelo usuário (opcional): $ARGUMENTS

## 1. Carregar o DNA
Leia `brand/brand-dna.md`. Se não existir, pare e sugira `/onboarding`.

## 2. Mini-questionário (4 itens, opções A/B/C adaptadas ao nicho)
1. **Objetivo principal:** A: Atrair atenção · B: Educar/autoridade · C: Vender/oferta · D: Engajamento
2. **Público e tema/dor central:** sugira **2 temas prontos** específicos do nicho (A, B) + C: "tema meu: ___"
3. **Formato/proporção:** A: `4:5` feed retrato · B: `1:1` quadrado · C: `9:16` stories/reels
4. **Texto na arte:** A: imagem limpa com *negative space* para texto aplicado depois · B: texto curto já renderizado na imagem (indique a frase entre aspas; use Ideogram)

Peça a resposta no formato `1B, 2A, 3A, 4B`. **Pare e espere.**

## 3. Gerar o arquivo
Descubra o próximo número em `prompts/posts/` e crie `prompts/posts/post-XXX-<slug>.md` com:
- **Briefing:** objetivo, público, tema, formato e data.
- **Direção de layout:** grid, hierarquia, posição do foco, zona de texto, uso da paleta 60/30/10.
- **Copy sugerida:** headline, legenda curta e CTA (em português).
- **3 variações de prompt técnico em inglês**, cada uma indicando o modelo-alvo:
  - **Opção 1, literal:** representa o tema diretamente.
  - **Opção 2, conceitual / scroll-stopper:** metáfora visual forte.
  - **Opção 3, minimalista / editorial:** o máximo de espaço negativo e elegância.
  Fórmula: `[Subject & Action] + [Environment & Negative Space] + [Brand DNA Master Style] + [Color Palette #HEX] + [Lighting & Lens] + [Typography] + [Technical Params]`
  Inclua `--ar` / aspect ratio e o **Negative Prompt Padrão** do DNA.

## 4. Gerar a imagem (opcional)
Se o Replicate MCP estiver ativo e com token, gere a variação escolhida pelo usuário (ou a 1, por padrão) e salve em `assets/posts/post-XXX-<slug>-v1.png`. Se não estiver, avise que só os prompts foram entregues.

## 5. Sincronizar
Atualize o índice "Posts" no `README.md` e rode:
`git add . && git commit -m "feat(post): generate art direction and prompts for <tema>" && git push origin main`
