---
description: Onboarding da marca — análise de referências, questionário A/B/C e geração do Brand DNA
argument-hint: [url-da-marca] [urls-de-referencia...]
---

# /onboarding — Onboarding da marca

Siga o `CLAUDE.md`. Execute as 3 etapas em sequência, **parando para esperar a resposta do usuário** quando indicado.

Argumentos recebidos (opcionais): $ARGUMENTS

---

## Etapa 1: Coleta e análise

1. Se os links não vieram nos argumentos, peça:
   - O **link da página da marca** (site, landing page ou Instagram). Se a marca ainda não tiver página, peça nome, nicho e uma descrição em 2 linhas.
   - De **1 a 3 páginas de referência** do nicho (concorrentes ou marcas admiradas).
   **Pare e espere a resposta.**
2. Para cada URL:
   - **Playwright MCP:** navegue, salve um screenshot de página inteira em `assets/referencias/<NN>-<slug-do-dominio>.png` (ex.: `01-marca.png`, `02-concorrente-x.png`) e extraia as cores e fontes computadas com `browser_evaluate`. Colete `color`, `background-color`, `border-color` e `font-family` dos elementos visíveis, agrupe por frequência e converta para `#HEX`.
   - **Firecrawl MCP** (ou WebFetch, se não houver chave): extraia headline, proposta de valor, tom de voz e estrutura das seções.
   - Analise visualmente os screenshots (Claude Vision): composição, densidade, estilo de imagem, iluminação, hierarquia tipográfica.
3. Gere `brand/diagnostico-referencias.md` com:
   - **Leitura da Marca Atual:** paleta detectada (HEX + % aproximada), fontes, tom de voz, pontos fortes e fracos.
   - **Padrões das Referências:** o que o nicho repete (cores, linguagem visual, clichês).
   - **Oportunidade de Diferenciação:** 3 territórios visuais onde a marca pode se destacar.
   - Tabela com links para os screenshots.
4. Atualize o `README.md` (status: Diagnóstico ✅) e rode:
   `git add . && git commit -m "docs(brand): add visual analysis of brand and niche references" && git push origin main`

---

## Etapa 2: Questionário de direção de arte

Com base no diagnóstico, apresente na tela **e** salve em `brand/questionario-decisoes.md` as 5 decisões. Cada uma tem **3 opções personalizadas (A, B, C)**, específicas para esta marca e não genéricas:

1. **Personalidade e estética central (mood):** 3 moods, cada um com 3 adjetivos e uma frase de referência.
2. **Paleta de cores estratégica:** 3 combinações completas com `#HEX` para 60% dominante, 30% secundária e 10% acento, mais uma justificativa curta de cada.
3. **Linguagem visual predominante:**
   A: Fotografia editorial realista · B: Design gráfico e tipográfico minimalista · C: Ilustração digital / 3D moderno / colagem
   (adapte a descrição de cada uma ao nicho)
4. **Iluminação e atmosfera:**
   A: High-key, luz natural · B: Low-key, estúdio com rim light · C: Pop studio / vibrante
5. **Estilo tipográfico e layout:**
   A: Sans-serif geométrica · B: Serifada editorial + sans-serif · C: Display/bold expressiva
   (sugira Google Fonts reais para cada opção)

Peça para o usuário responder no formato `1A, 2B, 3C, 4A, 5B`; combinações e ajustes livres também valem.
**Pare e espere a resposta.**

---

## Etapa 3: Consolidação do DNA

1. Registre as escolhas em `brand/questionario-decisoes.md` (seção "Decisões Finais", com data).
2. Gere `brand/brand-dna.md` com:
   - **Manual de Direção de Arte:** mood, paleta 60/30/10 com HEX e uso de cada cor, tipografia (títulos, corpo, pesos e tamanhos relativos), linguagem visual, iluminação, regras de composição, o que fazer e o que não fazer.
   - **Master Style Prompt** (bloco fixo em inglês, pronto para colar no fim de qualquer prompt).
   - **Negative Prompt Padrão** (em inglês).
   - **Variações do Master Style** por modelo: Flux.1 Pro, Ideogram e Recraft V3.
3. Atualize o `README.md` (Questionário ✅, Brand DNA ✅) e rode:
   `git add . && git commit -m "feat(dna): lock brand visual identity and master style prompt" && git push origin main`
4. Mostre um resumo visual do DNA e o menu:
   - `/post`: posts para feed e stories
   - `/logo`: conceitos de logo e prompts vetoriais
   - `/capa`: capas, banners e thumbnails
   - `/carrossel`: carrosséis slide a slide
   - `/dna`: ver e ajustar as diretrizes
