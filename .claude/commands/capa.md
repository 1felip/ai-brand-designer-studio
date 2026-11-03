---
description: Gera capas, banners e thumbnails com mapa de safe zones
argument-hint: [canal opcional]
---

# /capa — Capas, banners e thumbnails

Siga o `CLAUDE.md`. Argumentos (opcionais): $ARGUMENTS

## 1. Carregar o DNA
Leia `brand/brand-dna.md`. Se não existir, pare e sugira `/onboarding`.

## 2. Mini-questionário (4 itens)
1. **Canal e proporção:** A: `16:9` YouTube thumbnail · B: `4:1` banner do LinkedIn · C: `9:16` capa de Reels/destaque · D: `21:9` hero de site
2. **Elemento focal:** A: Retrato do especialista · B: Produto/mockup · C: Composição abstrata
3. **Zona de respiro (safe zone):** sugira A/B/C de posição do foco e do texto conforme o canal (ex.: foco à direita e texto à esquerda; avatar do LinkedIn no canto inferior esquerdo)
4. **Headline curta:** sugira 3 headlines (A/B/C) de até 6 palavras

Peça a resposta no formato `1A, 2A, 3B, 4C`. **Pare e espere.**

## 3. Gerar o arquivo
Crie `prompts/capas/capa-XXX-<slug>.md` com:
- **Mapa de margens de segurança:** dimensões em px do canal, áreas cortadas ou cobertas pela interface (avatar, botões, timestamp do YouTube, recorte mobile) e um diagrama ASCII da composição.
  Referência: YouTube 1280×720 (evite o canto inferior direito, onde fica o timestamp) · LinkedIn 1584×396 (avatar no canto inferior esquerdo, ~25% da largura) · Reels 1080×1920 (centro de 1080×1080 seguro para capa no grid) · Hero 2560×1097.
- **Direção de arte:** hierarquia, contraste da headline e cores do DNA.
- **3 prompts técnicos em inglês** com espaço negativo calculado (ex.: `subject positioned on right third, empty clean area on left 45% for headline`), modelo-alvo, aspect ratio e Negative Prompt Padrão.

## 4. Gerar o asset (opcional)
Siga o roteamento de modelos do `CLAUDE.md`. Com `GEMINI_API_KEY` configurada:
- Rascunhos com `scripts/gerar-imagem.ps1 -Modelo flash -Tamanho 1K`. Final aprovado com `-Modelo pro -Tamanho 2K` em `assets/capas/capa-XXX-<slug>-v1.png`.
- **Banner `4:1`** (ou outra proporção extrema): use `-Modelo flash` também no final, porque o Pro não aceita essas proporções.
- **Capa de um corte:** se houver o frame ou o link do vídeo, passe o frame em `-Referencias` para a capa usar a cena real.
Sem chave ou sem crédito, avise que só os prompts foram entregues.

## 5. Sincronizar
Atualize o índice "Capas" no `README.md` e rode:
`git add . && git commit -m "feat(capa): generate cover art direction for <canal/tema>" && git push origin main`
