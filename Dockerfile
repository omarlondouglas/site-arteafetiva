FROM node:20-slim AS builder

WORKDIR /app

# Como é um site estático (HTML/CSS), só precisamos de um servidor web leve.
# O pacote "serve" ou o "nginx" dariam conta. Usaremos Nginx na etapa final para melhor performance.
# Mas caso haja necessidade de compilar algum framework estático num futuro próximo, mantemos uma estrutura limpa.
COPY . .

# Imagem final baseada no Nginx Alpine (minimalista e super rápida para arquivos estáticos)
FROM nginx:alpine

# Removemos a página padrão do Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiamos o nosso HTML e a pasta de assets
# O Easypanel, ao rodar a imagem do Nginx, mapeará a porta 80.
COPY --from=builder /app /usr/share/nginx/html

# Exposição da porta padrão
EXPOSE 80

# Inicia o servidor Nginx
CMD ["nginx", "-g", "daemon off;"]