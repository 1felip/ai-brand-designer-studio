# AI Brand Designer Studio

Agente de IA **Designer & Estrategista de Branding** operado pelo Claude Code e versionado no GitHub.

**Marca atual:** Checkpoint Pop ([@checkpoint_pop](https://www.instagram.com/checkpoint_pop/)): cortes de games, filmes e séries

> Arquitetura completa do agente: [docs/arquitetura-agente.md](docs/arquitetura-agente.md)

## Comandos disponíveis

| Comando | O que faz |
| :--- | :--- |
| `/onboarding` | Analisa a marca e as referências, aplica o questionário A/B/C e gera o DNA da marca |
| `/post` | Direção de arte + 3 prompts técnicos para posts |
| `/logo` | Conceitos de identidade + prompts vetoriais (Recraft V3 SVG / Nano Banana Pro) |
| `/capa` · `/cape` | Capas e banners com mapa de safe zones |
| `/carrossel` | Roteiro visual slide a slide |
| `/dna` | Visualiza e ajusta as diretrizes da marca |

## Geração de imagens (melhor qualidade por peça)

| Peça | Modelo | Script | Chave |
| :--- | :--- | :--- | :--- |
| Posts, capas, carrosséis, lockups (final) | Nano Banana Pro `gemini-3-pro-image` | [scripts/gerar-imagem.ps1](scripts/gerar-imagem.ps1) `-Modelo pro` | `GEMINI_API_KEY` |
| Rascunhos, banners `4:1`, capa a partir de vídeo | Nano Banana 2.1 `gemini-nano-banana-2.1` | [scripts/gerar-imagem.ps1](scripts/gerar-imagem.ps1) `-Modelo flash` | `GEMINI_API_KEY` |
| Logo, ícones, selos (SVG) | Recraft Vectorize sobre PNG aprovado (Replicate) | [scripts/gerar-vetor.ps1](scripts/gerar-vetor.ps1) | `REPLICATE_API_TOKEN` |

Tabela completa de roteamento: [CLAUDE.md](CLAUDE.md#roteamento-de-modelos-melhor-qualidade-por-peça). As chaves ficam só em variáveis de ambiente, nunca no repositório.

## Status da marca

| Etapa | Status | Arquivo |
| :--- | :--- | :--- |
| Diagnóstico de referências | ✅ Concluído | [brand/diagnostico-referencias.md](brand/diagnostico-referencias.md) |
| Questionário de decisões | ✅ `1A, 2B, 3A, 4C, 5C` | [brand/questionario-decisoes.md](brand/questionario-decisoes.md) |
| Brand DNA | ✅ Travado | [brand/brand-dna.md](brand/brand-dna.md) |
| Logo | ✅ Travado: Pin D-Pad (8 versões SVG) | [prompts/logos/logo-001-pin-dpad.md](prompts/logos/logo-001-pin-dpad.md) |

**DNA em uma linha:** Neon Arcade Noturno · `#0A1628` / `#5EE6A8` / `#FFD23F` · Anton + Rubik + Press Start 2P · frame em tela cheia com moldura menta

## Índice de criações

### Posts
_Nenhum ainda._

### Logos
| # | Criação | Conceitos | Assets |
| :--- | :--- | :--- | :--- |
| 001 | [Pin D-Pad: ícone minimalista](prompts/logos/logo-001-pin-dpad.md) | C1 Pin Clássico · C2 Cruz-Pin · C3 Pixel Pin | ✅ **C1-V2 travado** · [principal](assets/logos/logo-001-pin-dpad-principal-escuro.svg) · [marca d'água](assets/logos/logo-001-pin-dpad-marca-dagua.svg) · [favicon](assets/logos/logo-001-pin-dpad-favicon-escuro.svg) · [prancha](assets/logos/logo-001-pin-dpad-final-prancha.png) · [todas as versões](prompts/logos/logo-001-pin-dpad.md#versões-oficiais-svg) |

### Capas
_Nenhuma ainda._

### Carrosséis
_Nenhum ainda._
