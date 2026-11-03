---
description: Gera 3 conceitos de logo e prompts vetoriais (Recraft V3 SVG / Nano Banana Pro)
argument-hint: [nome da marca opcional]
---

# /logo — Identidade e logotipo

Siga o `CLAUDE.md`. Argumentos (opcionais): $ARGUMENTS

## 1. Carregar o DNA
Leia `brand/brand-dna.md`. Se não existir, pare e sugira `/onboarding`.

## 2. Mini-questionário (4 itens com sugestões)
1. **Nome exato e slogan:** confirme a grafia (maiúsculas, acentos) e sugira A/B/C de slogan, ou "sem slogan".
2. **Tipo de logo:** A: Combination mark (símbolo + nome) · B: Wordmark (só tipografia) · C: Monograma · D: Ícone minimalista
3. **Conceito/símbolo:** A: Geométrico abstrato · B: Literal (dê **2 sugestões concretas** do nicho) · C: Tipográfico (ligadura, corte ou recurso na letra)
4. **Fundo principal:** A: Claro · B: Escuro · C: Versátil (precisa funcionar nos dois)

Peça a resposta no formato `1A, 2A, 3B, 4C`. **Pare e espere.**

## 3. Gerar o arquivo
Crie `prompts/logos/logo-XXX-<slug>.md` com:
- **3 conceitos de identidade:** nome do conceito, racional estratégico, descrição da forma, cores do DNA aplicadas e tipografia.
- Para cada conceito, prompts em inglês:
  - **Recraft V3 (SVG vetorial):** `flat vector logo, minimalist, clean lines, scalable, solid background, no realistic shading, ...` + paleta HEX + estilo `vector_illustration` / `icon`.
  - **Nano Banana Pro (lockup com nome):** com o nome da marca entre aspas para renderizar o texto com precisão.
- **Negative prompt:** `photorealistic, 3D render, gradients, drop shadow, texture, mockup, busy background, multiple logos, watermark, blurry`, mais o negative do DNA.
- **Checklist de validação:** legível em 16px, funciona em uma cor só, positivo/negativo, área de proteção.

## 4. Gerar o asset (opcional)
Siga o roteamento de modelos do `CLAUDE.md`:
- **Exploração:** rascunhos PNG dos 3 conceitos com `scripts/gerar-imagem.ps1 -Modelo flash -Tamanho 1K`. Refino do escolhido com `-Modelo pro`, passando o rascunho em `-Referencias`.
- **Validação:** prancha escuro × claro em 110 / 48 / 32 / 16 px antes de vetorizar.
- **Vetor final:** `scripts/gerar-vetor.ps1 -Vetorizar <png aprovado> -Paleta "<HEX do DNA>"` → `assets/logos/logo-XXX-<slug>-c<N>-vetorizado.svg`. Depois gere as versões oficiais (principal escuro/claro/sem fundo, mono escuro/claro, marca d'água, favicon) recolorindo as camadas com os HEX exatos.
- **Lockup com nome / mockup (opcional):** `scripts/gerar-imagem.ps1 -Modelo pro -Proporcao 1:1` → `assets/logos/logo-XXX-<slug>-c<N>-lockup.png`.
Sem a chave do modelo ou sem crédito, avise que só os prompts foram entregues.

## 5. Sincronizar
Atualize o índice "Logos" no `README.md` e rode:
`git add . && git commit -m "feat(logo): generate identity concepts and vector prompts for <nome>" && git push origin main`
