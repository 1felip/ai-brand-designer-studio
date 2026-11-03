# AI Brand Designer Studio

Agente de IA **Designer & Estrategista de Branding** operado pelo Claude Code. Clone o repositório, abra a pasta no Claude Code e rode `/onboarding` para criar a identidade visual da sua marca.

> Arquitetura completa do agente: [docs/arquitetura-agente.md](docs/arquitetura-agente.md)

## Seus dados ficam só no seu computador

Este repositório distribui apenas o agente (instruções, comandos e scripts). Tudo o que é da sua marca é gerado e guardado **somente na sua pasta local** e já está no `.gitignore`:

| Pasta | Conteúdo |
| :--- | :--- |
| `brand/` | Diagnóstico, questionário, `brand-dna.md` (paleta, tipografia, master style) e o painel `brand/painel.md` com status e índice de criações |
| `prompts/<tipo>/` | Direção de arte e prompts de cada post, logo, capa e carrossel |
| `assets/<tipo>/` | Imagens e SVGs gerados, screenshots de referência |

O agente não faz commit nem push desses arquivos. Se quiser fazer backup da sua marca, use uma pasta sincronizada (OneDrive, Google Drive) ou um repositório **privado** separado.

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
