# Arte Afetiva - Site

## Como fazer deploy no Easypanel

1. Crie um novo App no Easypanel.
2. Em **Source**, coloque o link do repositório GitHub (`https://github.com/omarlondouglas/site-arteafetiva`) e o Branch (`main`).
3. Em **Build**, o Easypanel vai detectar automaticamente o `Dockerfile` (Docker based build).
4. Em **Domains**, adicione o domínio desejado (ex: `arteafetiva.com.br`) e ative o certificado Let's Encrypt (HTTPS).
5. O Nginx já expõe a porta `80` internamente que o Traefik do Easypanel cuida de mapear para o mundo.

## Estrutura
O site é composto apenas de conteúdo estático renderizado diretamente no navegador, sem backend pesado:
- `index.html`: Site de produção usando referências públicas de imagens via Cloudflare R2 CDN.
- `preview.html`: Página com imagens em Base64 para visualização sem conexão.
- `assets/`: Arquivos complementares como favicon originários.
