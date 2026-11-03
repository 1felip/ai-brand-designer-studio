---
description: Gera roteiro visual e prompts de um carrossel slide a slide
argument-hint: [tema opcional]
---

# /carrossel — Carrossel slide a slide

Siga o `CLAUDE.md`. Tema sugerido (opcional): $ARGUMENTS

## 1. Carregar o DNA
Leia `brand/brand-dna.md`. Se não existir, pare e sugira `/onboarding`.

## 2. Mini-questionário (3 itens, opções A/B/C)
1. **Tema:** sugira 2 temas do nicho (A, B) + C: "tema meu: ___"
2. **Objetivo:** A: Educar/autoridade · B: Vender/oferta · C: Engajamento/salvamentos
3. **Número de slides:** A: 5 · B: 7 · C: 10

Peça a resposta no formato `1A, 2B, 3B`. **Pare e espere.**

## 3. Gerar o arquivo
Crie `prompts/carrosseis/carrossel-XXX-<slug>.md` com:
- **Narrativa:** gancho (slide 1), desenvolvimento, virada e CTA (último slide).
- **Sistema visual fixo** para garantir continuidade: grid, margens, posição do título, numeração, elemento recorrente e transição entre slides (elemento que "vaza" para o próximo, se fizer sentido). Formato padrão `4:5` (1080×1350).
- **Tabela slide a slide:** nº | texto na tela (PT) | descrição visual | cor dominante do slide.
- **Prompts em inglês por slide**, todos com o mesmo bloco de consistência (Master Style + paleta + `consistent series, same visual system, slide N of T`) e Negative Prompt Padrão.
- **Legenda do post** com CTA e hashtags sugeridas.

## 4. Gerar os assets (opcional)
Siga o roteamento de modelos do `CLAUDE.md`. Com `GEMINI_API_KEY` configurada:
1. Gere o **slide 1** com `scripts/gerar-imagem.ps1 -Modelo pro -Proporcao 4:5 -Tamanho 2K` e peça aprovação.
2. Gere os demais slides passando o slide 1 aprovado em `-Referencias` ("same visual system as the reference image, slide N of T"). Salve em `assets/posts/carrossel-XXX-<slug>-s<NN>.png`.
Sem chave ou sem crédito, avise que só os prompts foram entregues.

## 5. Registrar no painel local
Atualize o índice "Carrosséis" em `brand/painel.md`. Os arquivos ficam só na pasta local: **não** faça commit nem push (ver `CLAUDE.md` §3).
