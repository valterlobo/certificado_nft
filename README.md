# Emissão de Certificado por NFT

Este projeto visa transformar a maneira como os certificados são emitidos e geridos, utilizando a tecnologia NFT para proporcionar autenticidade, segurança e acessibilidade. Com uma estrutura bem definida e processos claros, este projeto se posiciona como uma solução moderna e eficiente para a emissão de certificados.

### Visão Geral
O projeto de Emissão de Certificado por NFT tem como objetivo criar um sistema inovador para a emissão, gestão e verificação de certificados utilizando tecnologia blockchain e NFTs (Non-Fungible Tokens). Este sistema garantirá a autenticidade, transparência e segurança dos certificados emitidos, evitando fraudes e facilitando a verificação.

### Objetivos e Propósitos
- **Autenticidade e Transparência**: Assegurar que cada certificado emitido seja único e facilmente verificável.
- **Segurança**: Utilizar a imutabilidade do blockchain para evitar falsificações.
- **Acessibilidade**: Permitir que os certificados sejam acessados e verificados digitalmente a qualquer momento.

### Justificativa  & Benefícios 
A utilização de NFTs para emissão de certificados oferece uma solução moderna para problemas comuns de falsificação e dificuldades de verificação de documentos. Este projeto trará maior confiança e praticidade para emissores e portadores de certificados.

- **Transparência**: Qualquer pessoa pode verificar a autenticidade e os detalhes do certificado.
- **Durabilidade**: O certificado permanece seguro e acessível indefinidamente.
- **Redução de Fraude**: Dificulta a falsificação de certificados.
- **Reputação**: Melhora a credibilidade e a reputação tanto da instituição emissora quanto do titular do certificado.

### Funcionalidades e Atributos

#### Funcionalidades

   - **CertificateMinted**: Evento disparado quando um novo certificado é emitido.
   - **mintCertificate**: A função mintCertificate é responsável pela criação de novos NFTs de certificados de cursos, exclusiva para o emissor autorizado (o proprietário do contrato).

#### Atributos

   - **Token ID**: Cada NFT possui um identificador único que o distingue de todos os outros tokens.
   - **Nome do Curso**: Título do curso completado.
   - **Instituição Emissora**: Nome da instituição que emitiu o certificado.
   - **Descrição do Curso**: Detalhes sobre o conteúdo e objetivos do curso.
   - **URL de Verificação**: Link para a página de verificação do curso.
   - **Data de Conclusão**: Data em que o curso foi concluído.
   - **Notas/Créditos**: Informação sobre o desempenho do estudante.
   - **Nome do Aluno**: Nome do titular do certificado.


### Informações do Contrato

- **Número do Contrato**: [0x41639F6cC552546a840f7C39FDad798158426314](https://testnet.bscscan.com/token/0x41639F6cC552546a840f7C39FDad798158426314)
- **BscScan**: Verifique o contrato no BscScan para visualizar transações e detalhes técnicos.
  [BscScan do Certificado DIO](https://testnet.bscscan.com/token/0x41639F6cC552546a840f7C39FDad798158426314)
- **OpenSea (BNB Testnet)**: Explore a coleção de Pokémons no marketplace OpenSea para tokens na rede de teste BNB.
  [OpenSea - Certificado DIO](https://testnets.opensea.io/collection/pokemondio)


### Implantação 

Para implantar, você precisará de um ambiente de desenvolvimento Ethereum, como o Foundry

#### 1. Configurar o .env (template .env.example)

#### 2. Compile o contrato

```shell
forge build
```

#### 3. Executar os testes do contrato

  ```shell
  forge test
 ```


#### 4. Executar o script de "Deploy" do contrato

```shell
forge script script/PokemonDIO.s.sol:Deploy   --fork-url $RPC_URL  --broadcast 
```


#### 5. Executar o script de "Mint" do Pokemon

```shell
forge script script/PokemonDIO.s.sol:Mint   --fork-url $RPC_URL  --broadcast 
```



## O que é ERC-721 (NFT) ?
O ERC-721 é um padrão para tokens não-fungíveis (NFTs) na blockchain Ethereum. Diferente dos tokens fungíveis (como os tokens ERC-20), que são intercambiáveis entre si, cada token ERC-721 é único e pode representar ativos específicos, como obras de arte digitais, colecionáveis, imóveis virtuais, entre outros.

### Características Principais do ERC-721

1. **Não-Fungibilidade**: Cada token ERC-721 é único, com um identificador distinto. Isso significa que dois tokens ERC-721 não podem ser trocados diretamente um pelo outro de forma equivalente, pois cada um tem atributos e valores únicos.

2. **Propriedade e Transferência**: Como outros tokens, os tokens ERC-721 podem ser possuídos e transferidos entre contas. Eles têm funções para consultar o proprietário e transferir tokens entre endereços.

3. **Metadados**: Tokens ERC-721 podem ter metadados associados a eles, como nome, descrição e link para uma imagem ou outro tipo de mídia. Isso é útil para representar itens digitais com características únicas.

4. **Aprovação e Transferência Segura**: O ERC-721 inclui funções para aprovação de terceiros para transferir tokens em nome do proprietário, bem como funções de transferência segura para garantir que os tokens não sejam enviados para endereços que não podem gerenciá-los.

### Funções Principais do ERC-721

- `balanceOf(address owner)`: Retorna o número de tokens possuídos por um endereço.
- `ownerOf(uint256 tokenId)`: Retorna o endereço do proprietário de um token específico.
- `safeTransferFrom(address from, address to, uint256 tokenId)`: Transfere a propriedade de um token de forma segura.
- `transferFrom(address from, address to, uint256 tokenId)`: Transfere a propriedade de um token.
- `approve(address to, uint256 tokenId)`: Aprova um endereço para transferir um token específico em nome do proprietário.
- `getApproved(uint256 tokenId)`: Retorna o endereço aprovado para um token específico.
- `setApprovalForAll(address operator, bool approved)`: Aprova ou remove a aprovação para um operador gerenciar todos os tokens do proprietário.
- `isApprovedForAll(address owner, address operator)`: Verifica se um operador está aprovado para gerenciar todos os tokens de um proprietário.

### Exemplo de Uso do ERC-721

Os tokens ERC-721 são amplamente utilizados para representar itens colecionáveis digitais, como no jogo **CryptoKitties**, onde cada "gato" é um token ERC-721 com características únicas. Eles também são usados em marketplaces de arte digital, como o **OpenSea**, onde artistas podem vender obras de arte digitais únicas como NFTs.

### Benefícios do ERC-721

- **Autenticidade e Escassez**: Como cada token é único, os NFTs podem provar a autenticidade e a propriedade de itens digitais, bem como a sua escassez.
- **Interoperabilidade**: Por seguir um padrão comum, os tokens ERC-721 podem ser suportados por diferentes plataformas e aplicativos na Ethereum, permitindo um ecossistema rico e interoperável.