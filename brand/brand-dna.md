# Brand DNA: Checkpoint Pop

> **Fonte da verdade** para todos os comandos (`/post`, `/logo`, `/capa`, `/carrossel`).
> Criado em 2026-11-03 a partir de `1A, 2B, 3A, 4C, 5C` · [diagnóstico](diagnostico-referencias.md) · [questionário](questionario-decisoes.md)

---

## 1. Essência

| | |
| :--- | :--- |
| **Marca** | Checkpoint Pop · [@checkpoint_pop](https://www.instagram.com/checkpoint_pop/) |
| **O que é** | Perfil de **cortes** de games (foco), filmes e séries da cultura pop |
| **Promessa** | *"Cada corte é um checkpoint: o momento que vale salvar."* |
| **Mood** | **Save Point Noturno → Neon Arcade Noturno**: imersivo, preciso, tech na estrutura; vibrante e pop no conteúdo |
| **Território** | O feed como **mapa de checkpoints**: template fixo, selos de categoria, pin como assinatura. Verde-menta contra o vermelho do nicho |
| **Tom de voz (copy)** | Direto, empolgado, com gírias de gamer na medida certa ("SALVA ESSE", "BOSS FIGHT", "PLOT TWIST"). Frases curtas, sempre com gancho |

---

## 2. Paleta de cores: Menta + Moeda

| Papel | Nome | HEX | RGB | Uso |
| :--- | :--- | :--- | :--- | :--- |
| **60% Dominante** | Azul-Noite | `#0A1628` | 10, 22, 40 | Fundos, faixas de legenda, molduras, barras do template |
| **30% Secundária** | Menta Checkpoint | `#5EE6A8` | 94, 230, 168 | Pin, moldura do frame, selos, sublinhados, brilhos, palavras de destaque |
| **10% Acento** | Amarelo-Moeda | `#FFD23F` | 255, 210, 63 | **Só** a palavra-gancho da legenda, setas, ícone de "novo". Nunca como fundo grande |

**Apoio:**
| Papel | HEX | Uso |
| :--- | :--- | :--- |
| Petróleo (profundidade) | `#13364A` | Degradês do fundo, grade HUD |
| Teal grade | `#19656A` | Linhas da grade/radar (opacidade 20–40%) |
| Branco-gelo | `#F2F7F5` | Texto principal sobre escuro |
| Preto-tinta | `#05090F` | Contorno de legenda, sombras |

**Regras de contraste:**
- Texto sobre `#0A1628` → `#F2F7F5`, `#5EE6A8` ou `#FFD23F` (todos passam AA).
- Texto sobre `#5EE6A8` ou `#FFD23F` → **sempre** `#0A1628`. Nunca branco.
- Nunca usar menta e amarelo como texto lado a lado na mesma palavra; o amarelo é exclusivo do gancho.
- **Proibido:** vermelho como cor de marca, roxo/rosa "RGB gamer", degradê arco-íris.

---

## 3. Tipografia

| Papel | Fonte (Google Fonts) | Peso | Estilo |
| :--- | :--- | :--- | :--- |
| **Títulos / gancho** | **Anton** | Regular (já é display) | CAIXA ALTA, entrelinha 0.95, tracking 0 a +1% |
| **Legendas / corpo** | **Rubik** | Bold 700 (legenda) · Medium 500 (texto) | Caixa alta nas legendas de vídeo, frase normal nos textos de post |
| **Selos / micro-UI** | **Press Start 2P** | Regular | Só em selos curtos (≤ 12 caracteres): `GAME`, `FILME`, `SÉRIE`, `CHECKPOINT #012`. Nunca em frases |

**Escala (base 1080px de largura):**
- Gancho (Anton): 96–120px
- Legenda do vídeo (Rubik Bold): 54–64px, até 2 linhas, contorno `#05090F` de 6px ou caixa `#0A1628` a 85%
- Selo (Press Start 2P): 22–26px dentro de pílula `#5EE6A8` com texto `#0A1628`
- Marca d'água "@checkpoint_pop" (Rubik Medium): 28px, branco a 70%

---

## 4. Linguagem visual: frame em tela cheia

- **O frame do game/filme/série é o herói** e ocupa a maior parte da tela. A marca vive na **moldura**, não por cima do conteúdo.
- Tratamento de cor dos frames (**pop studio**): saturação +15–25%, contraste alto, pretos profundos, realces vibrantes. Nada de "cinema dessaturado".
- **Assinaturas fixas da marca:**
  1. **Moldura menta** de 4–6px com cantos arredondados (24px) ao redor do frame.
  2. **Pin Checkpoint** no canto, como marca d'água. Arquivo oficial: [`logo-001-pin-dpad-marca-dagua.svg`](../assets/logos/logo-001-pin-dpad-marca-dagua.svg) (todas as versões em [logo-001](../prompts/logos/logo-001-pin-dpad.md#versões-oficiais-svg)).
  3. **Selo de categoria** em Press Start 2P: `GAME` · `FILME` · `SÉRIE`.
  4. **Numeração de checkpoint**: `CHECKPOINT #001`, que transforma o feed em coleção.
  5. **Grade HUD** sutil (teal 20%) só nas faixas de fundo, nunca sobre o frame.
- **Composição:** um ponto focal por peça (rosto, personagem ou momento). Gancho no terço superior.

---

## 5. Iluminação e atmosfera: pop studio sobre base noturna

- Luz **vibrante e saturada**, com sombras duras e coloridas.
- **Rim light menta `#5EE6A8`** e brilhos amarelos `#FFD23F` como luz de recorte em elementos gráficos e renders.
- Fundo de estrutura sempre escuro (azul-noite → petróleo), o que faz o conteúdo "acender".
- Brilho/bloom leve só em elementos de marca (pin, moldura), nunca no texto.

---

## 6. Templates de cortes (vídeo 9:16)

**Canvas:** 1080 × 1920 · **Safe zone de texto:** 120px de margem lateral, livre de 0–220px do topo e dos 380px inferiores (UI do Reels/TikTok).

```
┌──────────────────────────┐ 0
│   (zona da UI do app)    │
├──────────────────────────┤ 220
│ [GAME]   CHECKPOINT #012 │  ← selo + número (Press Start 2P)
│  GANCHO EM ANTON         │  ← branco + 1 palavra amarela
│  ATÉ 2 LINHAS            │
├──────────────────────────┤ ~620
│╭────────────────────────╮│
││                        ││  ← frame do corte (16:9 ou crop)
││   FRAME EM TELA CHEIA  ││     moldura menta 5px, raio 24px
││                        ││
│╰────────────────────────╯│
│   LEGENDA RUBIK BOLD     │  ← legenda dinâmica
├──────────────────────────┤ 1540
│ 📍 @checkpoint_pop       │  ← pin + @ (marca d'água)
│   (zona da UI do app)    │
└──────────────────────────┘ 1920
```
Fundo das faixas: `#0A1628` com degradê para `#13364A` + grade HUD teal a 20%.

**Capa do Reels (grid 4:5 / centro 1080×1350):** frame em tela cheia + gancho Anton no terço superior + selo de categoria. O centro de 1080×1080 precisa funcionar sozinho no grid do perfil.

---

## 7. O que fazer / o que não fazer

| ✅ Faça | ❌ Não faça |
| :--- | :--- |
| Um gancho por peça, máx. 6 palavras | Empilhar emojis, setas e 3 cores de texto |
| Amarelo só na palavra mais importante | Usar vermelho de "urgência" |
| Sempre moldura menta + selo + pin | Cobrir o rosto/ação principal do frame com texto |
| Numerar os checkpoints | Glitch RGB, roxo/rosa "gamer", fontes "futuristas" genéricas |
| Frames saturados e nítidos | Frames lavados, pixelados ou com marca d'água de terceiros |

---

## 8. Master Style Prompt (EN)

> Cole este bloco no **final** de qualquer prompt visual da marca.

```text
Checkpoint Pop brand style: "neon arcade at night" aesthetic, bold pop-culture gaming media design, full-bleed vibrant hero image as the main focus, framed by a rounded mint-green border (#5EE6A8, 24px radius), deep night-navy background (#0A1628) with subtle dark-teal HUD grid lines (#19656A, low opacity) and petrol-blue gradient (#13364A), single coin-yellow accent (#FFD23F) used sparingly for highlights, pop studio lighting with saturated colors, hard colorful shadows, mint rim light and soft glow on graphic elements, high contrast, crisp details, clean modern social media layout, strong single focal point, generous negative space for bold condensed uppercase headline typography (Anton style), tiny retro pixel-font badge accents
```

### Variações por modelo

> O Nano Banana entende linguagem natural melhor que listas de tags: escreva a cena em frases e cole o Master Style no final.

**Nano Banana Pro: cenas, personagens, fotorrealismo (sem texto):**
```text
... , cinematic yet vibrant pop studio lighting, mint-green (#5EE6A8) rim light, saturated color grading, deep navy (#0A1628) shadows, sharp focus, high dynamic range, shot on a 35mm lens with shallow depth of field, ultra-detailed. The image contains no text, letters or logos.
```

**Nano Banana Pro: texto renderizado na arte (posts, capas, carrosséis):**
```text
... , the headline "<TEXTO EXATO>" set in a bold condensed uppercase sans-serif in the style of Anton, off-white (#F2F7F5), with only the word "<PALAVRA-GANCHO>" in coin yellow (#FFD23F); a small mint-green (#5EE6A8) pill badge reading "<GAME|FILME|SÉRIE>" in a retro 8-bit pixel font with navy (#0A1628) text. Render every letter exactly as written, perfectly legible, no extra text anywhere else.
```
> Dica: com o logo/pin aprovado, passe o arquivo como imagem de referência e escreva "place the provided pin icon in the bottom-left corner as a watermark".

**Recraft V3 SVG (vetor: logo, ícones, pin, selos):**
```text
... , flat vector illustration, minimalist geometric shapes, clean lines, solid colors only from palette #0A1628 #5EE6A8 #FFD23F #F2F7F5, map pin with game d-pad motif, no gradients, no realistic shading, scalable
```

---

## 9. Negative Prompt Padrão (EN)

```text
red color scheme, purple and pink RGB gamer aesthetic, rainbow gradients, glitch effects, chromatic aberration, washed out colors, desaturated, muddy shadows, low contrast, blurry, pixelated, jpeg artifacts, cluttered layout, too many elements, multiple competing focal points, stacked emojis, comic sans, generic futuristic sci-fi fonts, thin fonts, misspelled text, distorted letters, extra fingers, deformed faces, watermark, third-party logos, copyright logos, frame borders in other colors, low resolution
```

---

## Histórico de alterações
| Data | Alteração | Motivo |
| :--- | :--- | :--- |
| 2026-11-03 | Criação do DNA (`1A, 2B, 3A, 4C, 5C`) | Onboarding inicial |
| 2026-11-03 | Variações por modelo: Flux.1 Pro + Ideogram → **Nano Banana Pro**; Recraft V3 SVG mantido para vetor | Integração híbrida focada na melhor qualidade por peça (paleta, fontes e estilo não mudaram) |
| 2026-11-03 | **Logo oficial travado:** Pin D-Pad C1-V2 (pin menta + poço circular + d-pad com setas + ponto amarelo), 8 versões SVG | `/logo` 001 aprovado pelo usuário |
