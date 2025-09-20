# CICD Cloudflare Tunnel - Aplicação Node.js com Docker e Deploy via GitHub Actions

Esta é uma aplicação Node.js simples que utiliza o framework Express para criar um servidor web. A aplicação está configurada para ser executada em um contêiner Docker e possui um pipeline de CI/CD configurado com GitHub Actions para deploy remoto.

## Pré-requisitos

- Docker instalado na máquina local ou no servidor de destino.
- Conta no GitHub com acesso ao repositório desta aplicação.
- Configuração do Cloudflare Tunnel para acesso remoto ao servidor.
- Chave SSH configurada para acesso ao servidor remoto.

## Passos para rodar a aplicação localmente

1. Clone o repositório:
   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd Teste1
   ```

2. Instale as dependências:
   ```bash
   npm install
   ```

3. Execute a aplicação:
   ```bash
   npm start
   ```

4. Acesse a aplicação no navegador em [http://localhost:3000](http://localhost:3000).

## Passos para rodar a aplicação com Docker

1. Construa a imagem Docker:
   ```bash
   docker build . -t test-server
   ```

2. Execute o contêiner:
   ```bash
   docker run --name test-server -d -p 3000:3000 test-server
   ```

3. Acesse a aplicação no navegador em [http://localhost:3000](http://localhost:3000).

## Configuração do CI/CD com GitHub Actions

O pipeline de CI/CD está configurado no arquivo `.github/workflows/firstDeploy.yaml`. Ele realiza o deploy remoto da aplicação utilizando Docker e Cloudflare Tunnel.

### Configuração das variáveis de ambiente (Secrets)

Para que o pipeline funcione corretamente, você precisa configurar as seguintes variáveis de ambiente (Secrets) no repositório do GitHub:

1. **`SSH_PRIVATE_KEY`**: Chave privada SSH para acessar o servidor remoto.
   - Gere uma chave SSH com o comando:
     ```bash
     ssh-keygen -t ed25519 -C "seu-email@example.com"
     ```
   - Adicione a chave pública ao arquivo `~/.ssh/authorized_keys` no servidor remoto.

2. **`SSH_KNOWN_HOSTS`**: Entrada do servidor remoto no formato `known_hosts`.
   - Obtenha a entrada com o comando:
     ```bash
     ssh-keyscan -H <IP_DO_SERVIDOR> >> known_hosts
     ```

3. **`SSH_HOST`**: Endereço do servidor remoto (exemplo: `user@192.168.1.100`).

4. **`SSH_USER`**: Nome do usuário SSH para acessar o servidor remoto.

5. **`CF_ACCESS_CLIENT_ID`**: ID do cliente do Cloudflare Tunnel.

6. **`CF_ACCESS_CLIENT_SECRET`**: Segredo do cliente do Cloudflare Tunnel.

### Como adicionar Secrets no GitHub

1. Acesse o repositório no GitHub.
2. Vá para **Settings** > **Secrets and variables** > **Actions**.
3. Clique em **New repository secret**.
4. Adicione cada uma das variáveis acima com seus respectivos valores.

## Observações

- Certifique-se de que o servidor remoto tenha o Docker instalado e configurado.
- O pipeline utiliza o Cloudflare Tunnel para estabelecer uma conexão segura com o servidor remoto.

## Licença

Este projeto está licenciado sob a licença ISC.
