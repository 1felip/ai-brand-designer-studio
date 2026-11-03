# Logo 001: Pin D-Pad (ícone minimalista)

> Marca: **Checkpoint Pop** · Criado em 2026-11-03 · DNA: [brand/brand-dna.md](../../brand/brand-dna.md)
> Respostas: `1D, 2D, 3B1, 4C` → **sem slogan · ícone minimalista · pin de mapa com d-pad · versátil (claro e escuro)**

---

## Briefing

| | |
| :--- | :--- |
| **Nome** | Checkpoint Pop (só aparece no lockup secundário; o logo principal é o ícone) |
| **Slogan** | Nenhum |
| **Tipo** | Ícone minimalista: avatar, marca d'água dos cortes, favicon, selo |
| **Símbolo** | Pin de mapa + d-pad: o **checkpoint** (lugar salvo no mapa) + o **controle** (games) |
| **Fundo** | Versátil: precisa funcionar em Azul-Noite `#0A1628` e em Branco-gelo `#F2F7F5`, e em 1 cor |
| **Cores do DNA** | `#0A1628` (base) · `#5EE6A8` (símbolo) · `#FFD23F` (só o ponto "salvo", ≤ 10% da área) · `#F2F7F5` (fundo claro) |
| **Tipografia (lockup)** | "CHECKPOINT POP" em **Anton**, caixa alta. Variante micro em **Press Start 2P** só para o selo `CHECKPOINT #001` |

**Racional geral:** o feed é um mapa de checkpoints, e cada corte é "o momento que vale salvar". O pin diz *"salvo aqui"* e o d-pad diz *"games"*. O avatar atual já usa esse símbolo, então evoluir em vez de trocar preserva o reconhecimento (o perfil ainda está em 0 posts, a hora certa de travar o símbolo).

---

## Conceito 1: **Pin Clássico** (evolução direta do avatar)

- **Racional:** máxima continuidade com o avatar atual e leitura instantânea de "localização / checkpoint". É o mais seguro para o 16px.
- **Forma:** silhueta de pin de mapa (gota invertida) sólida em menta. Dentro da cabeça circular, um **d-pad em cruz recortado em negativo** (mostra o fundo). No **centro do d-pad**, um quadrado/círculo pequeno amarelo-moeda: o "ponto salvo". Cantos levemente arredondados (raio ≈ 8% do braço da cruz) para conversar com a moldura de 24px do template.
- **Cores:** pin `#5EE6A8` · recorte = cor do fundo (`#0A1628` ou `#F2F7F5`) · ponto `#FFD23F`.
- **Versão 1 cor:** pin sólido + d-pad vazado; o ponto amarelo vira vazado também (ou some).

### Recraft V3 (SVG) · `recraft-ai/recraft-v3-svg` · style `vector_illustration` / `icon`
```text
flat vector logo icon, minimalist, clean lines, scalable, solid background, no realistic shading, a single bold map location pin silhouette in mint green (#5EE6A8), inside the round head of the pin a game controller d-pad cross shape cut out as negative space showing the background, a tiny coin-yellow (#FFD23F) square dot in the exact center of the d-pad, slightly rounded corners, perfectly symmetrical, centered composition with generous padding, solid deep night-navy (#0A1628) background, geometric precision, reads clearly at 16px, Checkpoint Pop brand style, flat vector illustration, solid colors only from palette #0A1628 #5EE6A8 #FFD23F #F2F7F5, no gradients
```

### Nano Banana Pro (lockup com nome) · `-Modelo pro -Proporcao 1:1`
```text
minimalist flat vector logo, a bold mint green (#5EE6A8) map location pin icon with a game d-pad cross cut out inside its round head and a tiny coin-yellow (#FFD23F) dot in the center, centered above the text "CHECKPOINT POP" in a bold condensed uppercase Anton-style font in off-white (#F2F7F5), solid deep navy (#0A1628) background, clean layout, generous negative space, perfectly legible typography, no spelling errors, flat colors, no gradients
```

---

## Conceito 2: **Cruz-Pin** (o d-pad vira o pin)

- **Racional:** mais autoral e geométrico. Em vez de pôr o d-pad *dentro* do pin, o **próprio d-pad é o pin**: o braço inferior da cruz se afina em ponta, como a agulha de um pin. Um símbolo só, mais único e mais registrável.
- **Forma:** cruz de d-pad sólida em menta; o braço inferior alonga e termina em ponta (V). No centro da cruz, círculo pequeno amarelo (o "salvo"). Opcional: anel fino menta ao redor (como o "raio" de um checkpoint no mapa) só nas versões grandes.
- **Cores:** cruz `#5EE6A8` · centro `#FFD23F` · fundo `#0A1628` / `#F2F7F5`.
- **Versão 1 cor:** cruz sólida + centro vazado.
- **Risco:** a leitura de "pin" depende da ponta; validar em 16px.

### Recraft V3 (SVG) · `recraft-ai/recraft-v3-svg` · style `icon`
```text
flat vector logo icon, minimalist, clean lines, scalable, solid background, no realistic shading, a bold game controller d-pad cross shape in mint green (#5EE6A8) whose bottom arm extends and tapers into a sharp point like the needle of a map location pin, merging d-pad and map pin into one single geometric symbol, a small coin-yellow (#FFD23F) circle in the center of the cross, slightly rounded outer corners, perfectly symmetrical, centered with generous padding, solid deep night-navy (#0A1628) background, Checkpoint Pop brand style, flat vector illustration, solid colors only from palette #0A1628 #5EE6A8 #FFD23F #F2F7F5, no gradients, reads clearly at 16px
```

### Nano Banana Pro (lockup com nome) · `-Modelo pro -Proporcao 1:1`
```text
minimalist flat vector logo, a geometric mint green (#5EE6A8) game d-pad cross whose bottom arm tapers into the point of a map pin, small coin-yellow (#FFD23F) dot in the center, placed to the left of the text "CHECKPOINT POP" in a bold condensed uppercase Anton-style font in off-white (#F2F7F5), horizontal lockup, solid deep navy (#0A1628) background, clean layout, perfectly legible typography, no spelling errors, flat colors, no gradients
```

---

## Conceito 3: **Pixel Pin** (8-bit)

- **Racional:** puxa a nostalgia arcade do mood "Neon Arcade Noturno" e conversa com os selos em Press Start 2P. Fica com cara de **sprite de "save point"** de jogo retrô, diferente dos ícones lisos do nicho.
- **Forma:** pin de mapa desenhado numa grade de pixels (≈ 12×16 módulos), em menta. O d-pad é vazado em pixels na cabeça do pin. Um único pixel (ou bloco 2×2) amarelo no centro. Sem anti-aliasing: só quadrados.
- **Cores:** pin `#5EE6A8` · pixel salvo `#FFD23F` · fundo `#0A1628` / `#F2F7F5`.
- **Versão 1 cor:** pixels sólidos + d-pad vazado.
- **Cuidado:** usar grade grossa (poucos módulos) para não "embolar" em 16px; manter o pixel coerente com o grid em cada tamanho exportado.

### Recraft V3 (SVG) · `recraft-ai/recraft-v3-svg` · style `icon`
```text
flat vector logo icon, minimalist, clean lines, scalable, solid background, no realistic shading, an 8-bit pixel art map location pin built from large square pixels on a coarse grid, mint green (#5EE6A8), with a game d-pad cross cut out of pixels inside the round head of the pin showing the background, a single coin-yellow (#FFD23F) pixel block in the center of the d-pad, crisp hard pixel edges, no anti-aliasing, retro arcade save point sprite, perfectly symmetrical, centered with generous padding, solid deep night-navy (#0A1628) background, Checkpoint Pop brand style, solid colors only from palette #0A1628 #5EE6A8 #FFD23F #F2F7F5, no gradients
```

### Nano Banana Pro (lockup com nome) · `-Modelo pro -Proporcao 1:1`
```text
retro 8-bit pixel art logo, a mint green (#5EE6A8) pixel map pin with a pixel d-pad cut out in its head and one coin-yellow (#FFD23F) center pixel, above the text "CHECKPOINT POP" in a bold condensed uppercase Anton-style font in off-white (#F2F7F5), small retro pixel font badge "CHECKPOINT #001" in a mint pill below, solid deep navy (#0A1628) background, clean layout, perfectly legible typography, no spelling errors, flat colors, no gradients
```

---

## Negative prompt (todos os conceitos)

```text
photorealistic, 3D render, gradients, drop shadow, texture, mockup, busy background, multiple logos, watermark, blurry, red color scheme, purple and pink RGB gamer aesthetic, rainbow gradients, glitch effects, chromatic aberration, washed out colors, desaturated, low contrast, pixelated, jpeg artifacts, cluttered layout, too many elements, multiple competing focal points, comic sans, generic futuristic sci-fi fonts, thin fonts, misspelled text, distorted letters, third-party logos, copyright logos, frame borders in other colors, low resolution
```
> Exceção do Conceito 3: retire `pixelated` do negative (o pixel é intencional).

---

## Versões obrigatórias (por ser fundo versátil)

| Versão | Símbolo | Detalhe | Fundo |
| :--- | :--- | :--- | :--- |
| **Positiva escura** (principal) | `#5EE6A8` | ponto `#FFD23F` | `#0A1628` |
| **Positiva clara** | `#0A1628` | ponto `#FFD23F`* | `#F2F7F5` |
| **1 cor escura** | `#F2F7F5` | vazado | `#0A1628` |
| **1 cor clara** | `#0A1628` | vazado | `#F2F7F5` |
| **Marca d'água dos cortes** | `#F2F7F5` a 70% | vazado | sobre o frame |

\* No fundo claro, o símbolo vai para Azul-Noite: menta sobre branco-gelo tem contraste baixo (≈ 1,5:1) e some em 16px. O amarelo no claro só funciona se tiver ≥ 3px; abaixo disso, vazar.

---

## Checklist de validação

- [ ] **Legível em 16px** (favicon) e em 110px (avatar do Instagram): o d-pad continua visível?
- [ ] **Funciona em uma cor só** (sem o ponto amarelo)
- [ ] **Positivo/negativo**: sobre `#0A1628` e sobre `#F2F7F5`
- [ ] **Recorte circular do avatar**: nada importante encosta na borda do círculo
- [ ] **Área de proteção**: margem mínima = largura de 1 braço do d-pad em todos os lados
- [ ] **Tamanho mínimo**: 16px digital · 8mm impresso
- [ ] Amarelo ocupa **≤ 10%** da área (regra 60/30/10 do DNA)
- [ ] Nenhum vermelho, roxo/rosa ou degradê
- [ ] SVG limpo: poucos nós, sem traços (só preenchimentos), cores exatas em HEX

---

## Assets gerados

| Conceito | Rascunho PNG (Nano Banana 2.1 · 1K) | SVG final (Recraft V3) |
| :--- | :--- | :--- |
| C1 Pin Clássico | [logo-001-pin-dpad-c1-rascunho.png](../../assets/logos/logo-001-pin-dpad-c1-rascunho.png) | ⏳ Aguardando escolha |
| C2 Cruz-Pin | [logo-001-pin-dpad-c2-rascunho.png](../../assets/logos/logo-001-pin-dpad-c2-rascunho.png) | ⏳ Aguardando escolha |
| C3 Pixel Pin | [logo-001-pin-dpad-c3-rascunho.png](../../assets/logos/logo-001-pin-dpad-c3-rascunho.png) | ⏳ Aguardando escolha |

### Análise dos rascunhos (2026-11-03)

| | Acertos | Problemas |
| :--- | :--- | :--- |
| **C1** | Paleta exata, silhueta limpa, lê bem em tamanho pequeno | **A cruz dentro do pin lê como "farmácia/hospital no mapa"** |
| **C2** | Forma única, ponto amarelo forte | A leitura de pin é fraca (parece um "+" com seta ou uma espada); também lembra cruz médica |
| **C3** | O mais "game" dos três: o pixel deixa claro que é d-pad e não cruz médica; combina com os selos em Press Start 2P | A ponta de 1 pixel some em 16px; o contorno precisa de grade mais grossa |

**Correção para a próxima rodada (qualquer conceito):** dar ao d-pad marcas inconfundíveis de controle, como **setinhas triangulares na ponta de cada braço** e/ou um **disco rebaixado no centro**, para afastar a leitura de cruz médica.

### Rodada 2: C1 refinado (Nano Banana Pro · 2K · rascunho do C1 como referência)

Escolha do usuário: **C1 Pin Clássico**, com a correção do d-pad.

| Variação | Arquivo | Leitura |
| :--- | :--- | :--- |
| V1 | [logo-001-pin-dpad-c1-v1.png](../../assets/logos/logo-001-pin-dpad-c1-v1.png) | Poço circular + d-pad menta com setas + disco amarelo |
| **V2 (recomendada)** | [logo-001-pin-dpad-c1-v2.png](../../assets/logos/logo-001-pin-dpad-c1-v2.png) | Mesma estrutura, setas maiores e mais nítidas, ponta mais longa |
| Validação V2 | [logo-001-pin-dpad-c1-v2-validacao.png](../../assets/logos/logo-001-pin-dpad-c1-v2-validacao.png) | Escuro × claro em 110 / 48 / 32 / 16 px |

**Resultado do checklist (V2):**
- [x] Não lê mais como cruz médica: as setas e o poço circular dizem "controle"
- [x] Funciona em escuro (menta) e em claro (azul-noite), com o amarelo ≤ 10%
- [x] 110px (avatar) e 48px: perfeito · 32px: bom
- [ ] **16px:** a silhueta do pin + o anel + o ponto amarelo continuam legíveis, mas as setas somem → criar uma **versão favicon simplificada** (pin + anel + ponto, sem d-pad)
- [ ] SVG vetorial final

**Prompt usado (V2):** ver o histórico do commit; a base é o prompt C1 + "circular navy hole like a controller button well, chunky d-pad with engraved triangle arrows, NOT a medical or plus sign".

> 2026-11-03: a primeira tentativa no Replicate (`recraft-ai/recraft-v3-svg`) retornou **402 Payment Required**, ou seja, a conta está sem crédito. O SVG final do conceito escolhido sai por `scripts/gerar-vetor.ps1` assim que houver saldo.
