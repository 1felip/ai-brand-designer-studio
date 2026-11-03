# Arquitetura e Prompt Mestre para Claude Code: Agente de IA Designer (MCPs + Skills + GitHub Sync)

> **Atualização (03/11/2026):** o fluxo de commit e push automático descrito abaixo foi **desativado**. Os dados da marca (`brand/`, `prompts/`, `assets/`) agora ficam só na pasta local do usuário e estão no `.gitignore`; o status e o índice de criações ficam em `brand/painel.md`. O GitHub serve apenas para distribuir o agente publicamente. A regra vigente está no [`CLAUDE.md` §3](../CLAUDE.md).

Este documento foi adaptado especificamente para o **Claude Code**. No Claude Code, os comandos `/post`, `/logo`, `/capa`, `/carrossel` e `/dna` funcionam como **Slash Commands nativos** (arquivos Markdown dentro de `.claude/commands/`), enquanto o arquivo `CLAUDE.md` mantém a memória viva da marca e força o **commit e push automático no GitHub** a cada etapa concluída.

## 1. Melhores MCPs (Model Context Protocol) para o Claude Code Designer

Antes ou durante a inicialização, o Claude Code utilizará os seguintes servidores MCP para ter visão computacional das páginas de referência, geração visual e versionamento no GitHub:

| Categoria | Servidor MCP Recomendado | Comando de Instalação no Claude Code | Função no Agente Designer |
| :--- | :--- | :--- | :--- |
| **Análise Visual & CSS de Páginas** | **Playwright MCP** (`@playwright/mcp`) | `claude mcp add playwright npx @playwright/mcp@latest` | Abre o site/página da marca e concorrentes, tira *screenshots* reais para análise visual (Claude Vision) e extrai cores `#HEX` e fontes do CSS |
| **Scraping de Conteúdo e Copy** | **Firecrawl MCP** (`firecrawl-mcp`) | `claude mcp add firecrawl -e FIRECRAWL_API_KEY=sua_key -- npx -y firecrawl-mcp` | Extrai posicionamento, textos, estrutura de landing pages e URLs de imagens de referência |
| **Versionamento & Repositório** | **GitHub MCP** + **GitHub CLI (`gh`)** | `claude mcp add github -- npx -y @modelcontextprotocol/server-github` | Cria o repositório remoto, gerencia branches/commits e sincroniza todo o progresso automaticamente |
| **Geração raster (posts, capas, carrosséis)** | **Nano Banana** via Gemini API (script `scripts/gerar-imagem.ps1`) | Variável `GEMINI_API_KEY` | **Nano Banana Pro** (`gemini-3-pro-image`) para finais com texto e fotorrealismo; **Nano Banana 2.1** para rascunhos, proporções extremas e video-to-image |
| **Geração vetorial (logos, ícones)** | **Replicate** (script `scripts/gerar-vetor.ps1` + Replicate MCP) | `claude mcp add replicate -e REPLICATE_API_TOKEN=sua_key -- npx -y replicate-mcp` | Executa **Recraft V3 SVG** (logos em `.SVG` vetorial) |

> **Atualização 2026-11-03:** a integração passou a ser híbrida (Nano Banana + Recraft SVG), escolhendo a melhor qualidade por peça. Flux.1 Pro e Ideogram saíram do fluxo. A tabela de roteamento oficial fica no `CLAUDE.md`. O prompt de inicialização abaixo é mantido como registro histórico.
| **Integração com Design System** | **Figma MCP** (`figma-developer-mcp`) | `claude mcp add figma -e FIGMA_API_KEY=sua_key -- npx -y figma-developer-mcp` | Lê tokens, grids e frames do Figma (opcional, caso a marca já possua layouts no Figma) |

## 2. Prompt de Inicialização (Cole este bloco no Claude Code para criar tudo sozinho)

Abra o terminal na pasta onde deseja criar o projeto, inicie o `claude` e **cole o comando completo abaixo**. Ele instrui o Claude Code a configurar os MCPs, autenticar e criar o repositório no GitHub, gerar todas as Skills/Slash Commands nativos (`.claude/commands/`) e iniciar o Onboarding da Marca:

```markdown
Quero que você atue como meu Engenheiro de Agentes e Diretor de Arte Sênior para estruturar e operar um **Agente de IA Designer & Estrategista de Branding** diretamente aqui no Claude Code, totalmente versionado no GitHub.

Execute imediatamente a configuração abaixo passo a passo e faça commits semânticos + `git push` no GitHub ao final de cada passo:

### PASSO 1: Conexão ao GitHub e Criação do Repositório
1. Verifique a autenticação do GitHub via CLI (`gh auth status`) ou via GitHub MCP.
2. Pergunte-me qual deve ser o nome do repositório (ou sugira `ai-brand-designer-studio` como padrão) e se deve ser privado ou público.
3. Inicialize o Git local (`git init`), crie o repositório remoto no GitHub (`gh repo create <nome> --private --source=. --remote=origin`) e crie a seguinte estrutura de diretórios:
   - `brand/` (para salvar `diagnostico-referencias.md`, `questionario-decisoes.md` e `brand-dna.md`)
   - `prompts/posts/`, `prompts/logos/`, `prompts/capas/`, `prompts/carrosseis/`
   - `assets/referencias/`, `assets/posts/`, `assets/logos/`, `assets/capas/`
   - `.claude/commands/` (para criar as nossas Skills e comandos nativos: `/onboarding`, `/post`, `/logo`, `/capa`, `/carrossel`, `/dna`)

### PASSO 2: Configuração de MCPs (`.mcp.json`)
Crie na raiz do projeto um arquivo `.mcp.json` pré-configurado com os melhores MCPs para design e análise de marca:
- `playwright` (`npx @playwright/mcp@latest`) para abrir URLs da marca e referências, capturar screenshots de tela inteira em `assets/referencias/` e inspecionar paletas HEX e fontes direto do DOM/CSS.
- `firecrawl` (`npx -y firecrawl-mcp`) para extração limpa de copy e estrutura de páginas de referência.
- `github` (`npx -y @modelcontextprotocol/server-github`) para operações de repositório.
- `replicate` (`npx -y replicate-mcp`) para geração direta de imagens e vetores (Recraft V3 SVG, Ideogram, Flux.1 Pro) caso eu configure a chave de API.

### PASSO 3: Criação do `CLAUDE.md` (Cérebro do Agente + Regra de GitHub Auto-Sync)
Crie o arquivo `CLAUDE.md` na raiz do projeto contendo as seguintes regras permanentes:
1. **Papel:** Diretor de Arte Sênior, Estrategista de Branding e Engenheiro de Prompts Visuais.
2. **Fonte da Verdade:** Antes de executar qualquer comando (`/post`, `/logo`, `/capa`, `/carrossel`), SEMPRE leia `brand/brand-dna.md` para importar a paleta `#HEX`, tipografia, iluminação, *Master Style Prompt* e *Negative Prompt* da marca.
3. **Regra Obrigatória de Sincronização Contínua no GitHub (Auto-Commit & Push):**
   - A cada etapa concluída (seja o diagnóstico inicial, as respostas do questionário, a criação do `brand-dna.md` ou cada execução de `/post`, `/logo`, `/capa`, `/carrossel`), você DEVE salvar os arquivos gerados em suas respectivas pastas, atualizar o `README.md` com o índice de criações da marca e executar automaticamente:
     `git add . && git commit -m "<tipo>: <descrição clara da etapa>" && git push origin main`
4. **Economia de Esforço nos Questionários:** Nunca faça perguntas em aberto sem direção. Sempre ofereça **3 sugestões personalizadas (Opções A, B ou C)** baseadas na análise da marca para que o usuário possa responder apenas com códigos rápidos (ex.: `1A, 2B, 3C`).

### PASSO 4: Criação das Skills / Comandos Nativos em `.claude/commands/`
Crie os 6 arquivos Markdown abaixo dentro de `.claude/commands/` para habilitar os comandos personalizados no Claude Code:

1. **`.claude/commands/onboarding.md` (`/onboarding`):**
   - **Etapa 1 (Coleta e Análise):** Pede o link da página da marca e de 1 a 3 páginas de referência do nicho. Usa o Playwright MCP (ou Web Fetch) para navegar nas páginas, salvar screenshots em `assets/referencias/`, extrair cores `#HEX` e tipografia do CSS e gerar `brand/diagnostico-referencias.md` (Leitura da Marca Atual, Padrões das Referências e Oportunidade de Diferenciação). Faz commit e push no GitHub.
   - **Etapa 2 (Questionário de Direção de Arte com Sugestões):** Apresenta na tela e salva em `brand/questionario-decisoes.md` as 5 decisões fundamentais, cada uma com **3 sugestões personalizadas (A, B, C)** baseadas no diagnóstico:
     1. Personalidade e Estética Central (Mood)
     2. Paleta de Cores Estratégica (3 combinações completas com códigos `#HEX` para 60% Dominante, 30% Secundária e 10% Acento)
     3. Linguagem Visual Predominante (A: Fotografia Editorial Realista; B: Design Gráfico & Tipográfico Minimalista; C: Ilustração Digital / 3D Moderno / Colagem)
     4. Iluminação e Atmosfera (A: High-Key Natural Light; B: Low-Key Studio Rim Light; C: Pop Studio / Vibrante)
     5. Estilo Tipográfico e Layout (A: Sans-serif geométrica; B: Serifada editorial + sans-serif; C: Display/Bold expressiva)
   - **Etapa 3 (Consolidação do DNA):** Após a resposta do usuário, gera `brand/brand-dna.md` contendo o Manual de Direção de Arte, o **Master Style Prompt** (bloco técnico fixo em inglês) e o **Negative Prompt Padrão**, faz commit e push para o GitHub e exibe o menu de comandos (`/post`, `/logo`, `/capa`, `/carrossel`, `/dna`).

2. **`.claude/commands/post.md` (`/post`):**
   - Lê `brand/brand-dna.md`.
   - Faz um mini-questionário de 4 itens com sugestões A, B, C adaptadas ao nicho:
     1. Objetivo principal (Atrair atenção, Educar/Autoridade, Vender/Oferta, Engajamento)
     2. Público-alvo e Tema/Dor central (sugere 2 temas prontos do nicho)
     3. Formato/Proporção (`4:5` Feed Retrato, `1:1` Quadrado, `9:16` Stories/Reels)
     4. Texto na Arte (A: Imagem limpa com *negative space* para texto externo; B: Texto curto já renderizado na imagem entre aspas)
   - Após a resposta, gera um arquivo numerado em `prompts/posts/post-XXX-<slug>.md` com a Direção de Layout e **3 Variações de Prompts Técnicos em Inglês** (Opção 1 Literal, Opção 2 Conceitual/Scroll-stopper, Opção 3 Minimalista/Editorial) seguindo a fórmula `[Subject & Action] + [Environment & Negative Space] + [Brand DNA Master Style] + [Color Palette #HEX] + [Lighting & Lens] + [Typography] + [Technical Params]`.
   - Se o MCP de geração visual estiver ativo, gera a imagem em `assets/posts/`.
   - Faz commit e push automático para o GitHub.

3. **`.claude/commands/logo.md` (`/logo`):**
   - Lê `brand/brand-dna.md`.
   - Faz o mini-questionário de 4 itens com sugestões: (1) Nome exato e slogan, (2) Tipo de Logo (Combination Mark, Wordmark, Monograma, Ícone minimalista), (3) Conceito/Símbolo (Geométrico, Literal com 2 sugestões do nicho, ou Tipográfico), (4) Fundo principal (Claro, Escuro, Versátil).
   - Gera `prompts/logos/logo-XXX-<slug>.md` com 3 Conceitos de Identidade e Prompts Técnicos otimizados especificamente para **Recraft V3 (SVG vetorial)** e **Ideogram** (`flat vector logo, minimalist, clean lines, scalable, solid background, no realistic shading`).
   - Faz commit e push automático para o GitHub.

4. **`.claude/commands/capa.md` (`/capa` e `/cape`):**
   - Lê `brand/brand-dna.md`. (Crie também `.claude/commands/cape.md` apontando para o mesmo fluxo).
   - Faz o mini-questionário de 4 itens: (1) Canal e proporção (`16:9` YouTube, `4:1` LinkedIn, `9:16` Capa de Reels/Destaque, `21:9` Hero Site), (2) Elemento focal (Retrato do especialista, Produto/Mockup, Composição abstrata), (3) Zona de respiro/Safe Zone para avatar e texto, (4) Headline curta.
   - Gera `prompts/capas/capa-XXX-<slug>.md` com o Mapa de Margens de Segurança e 3 Prompts Técnicos em inglês com espaço negativo calculado.
   - Faz commit e push automático para o GitHub.

5. **`.claude/commands/carrossel.md` (`/carrossel`):**
   - Lê `brand/brand-dna.md`, pergunta Tema, Objetivo e Número de Slides (5, 7 ou 10), gera o roteiro visual slide a slide garantindo continuidade estética em `prompts/carrosseis/carrossel-XXX-<slug>.md` e faz commit + push no GitHub.

6. **`.claude/commands/dna.md` (`/dna`):**
   - Lê e exibe o resumo atual de `brand/brand-dna.md`, pergunta qual diretriz o usuário quer ajustar e, após atualizar, faz commit + push no GitHub.

Assim que terminar de criar a estrutura, o repositório GitHub, o `CLAUDE.md` e os comandos em `.claude/commands/`, faça o primeiro commit/push e inicie automaticamente a **Etapa 1 do `/onboarding`** me pedindo os links da marca e das referências!
```

## 3. Estrutura do Repositório que o Claude Code Manterá no GitHub

A cada interação sua no terminal do Claude Code, o repositório remoto no GitHub será atualizado automaticamente com o histórico completo da marca:

```text
ai-brand-designer-studio/
├── CLAUDE.md                        # Regras globais, fórmula de prompts e gatilho de Git Auto-Push
├── .mcp.json                        # Configuração do Playwright, Firecrawl, GitHub e Replicate MCP
├── README.md                        # Painel atualizado automaticamente com links para o DNA e prompts
├── .claude/
│   └── commands/                    # Skills / Slash Commands nativos do Claude Code
│       ├── onboarding.md            # Comando /onboarding (Análise + Questionário + DNA)
│       ├── post.md                  # Comando /post (Mini-questionário + 3 Prompts + Asset)
│       ├── logo.md                  # Comando /logo (Mini-questionário + Prompts Vetoriais SVG)
│       ├── capa.md                  # Comando /capa (Safe Zones + Prompts de Banner/Thumb)
│       ├── cape.md                  # Alias /cape para geração de capas
│       ├── carrossel.md             # Comando /carrossel (Sequência visual slide a slide)
│       └── dna.md                   # Comando /dna (Visualizar/editar diretrizes da marca)
├── brand/
│   ├── diagnostico-referencias.md   # Diagnóstico extraído das páginas da marca e concorrentes
│   ├── questionario-decisoes.md     # Registro das escolhas A/B/C feitas pelo usuário
│   └── brand-dna.md                 # Fonte da verdade: Paleta #HEX, Tipografia e Master Style Prompt
├── prompts/
│   ├── posts/                       # Histórico versionado de todos os prompts de posts
│   ├── logos/                       # Histórico versionado de conceitos e prompts de logos
│   ├── capas/                       # Histórico versionado de capas e banners
│   └── carrosseis/                  # Roteiros visuais e prompts de carrosséis
└── assets/
    ├── referencias/                 # Screenshots capturados pelo Playwright MCP das páginas analisadas
    ├── posts/                       # Imagens geradas via MCP
    ├── logos/                       # Arquivos .SVG e .PNG de logotipos
    └── capas/                       # Capas e thumbnails geradas
```

## 4. Fluxo de Commits Automáticos no GitHub

O arquivo `CLAUDE.md` instrui o agente a nunca deixar alterações apenas locais. Sempre que você responder a uma etapa, ele executará o ciclo completo de Git:

| Momento da Jornada | Arquivo Criado/Atualizado | Commit Automático no GitHub |
| :--- | :--- | :--- |
| **Setup Inicial** | `CLAUDE.md`, `.mcp.json`, `.claude/commands/*.md` | `chore: initialize AI Designer agent structure and slash commands` |
| **Análise das Páginas (Etapa 1)** | `brand/diagnostico-referencias.md` + prints em `assets/referencias/` | `docs(brand): add visual analysis of brand and niche references` |
| **Definição da Direção de Arte (Etapas 2 e 3)** | `brand/questionario-decisoes.md` e `brand/brand-dna.md` | `feat(dna): lock brand visual identity and master style prompt` |
| **Uso do `/post`, `/logo` ou `/capa`** | `prompts/<tipo>/<arquivo>.md` + `README.md` | `feat(post): generate art direction and prompts for <tema>` |
