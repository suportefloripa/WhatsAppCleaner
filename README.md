# WhatsAppCleaner

Um utilitário simples para limpar arquivos temporários do WhatsApp Desktop, liberando espaço em disco.

## 📋 Descrição

WhatsAppCleaner é uma ferramenta em lote (batch) desenvolvida para Windows que limpa os arquivos temporários acumulados pelo aplicativo WhatsApp Desktop. Com o tempo, o WhatsApp armazena uma grande quantidade de arquivos de mídia no diretório de cache, ocupando espaço valioso no disco. Este script automatiza o processo de limpeza desses arquivos para recuperar espaço em disco.

## ✨ Funcionalidades

- Identifica automaticamente o diretório de armazenamento temporário do WhatsApp
- Calcula e exibe o espaço ocupado pelos arquivos temporários (em MB e GB)
- Solicita confirmação antes de remover arquivos
- Fecha o WhatsApp automaticamente antes da limpeza (se estiver em execução)
- Reabre o WhatsApp após a conclusão da limpeza (se estava em execução)
- Exibe o espaço recuperado após a limpeza

## 🚀 Como usar

1. Baixe o arquivo [WhatsAppCleaner.bat](https://raw.githubusercontent.com/suportefloripa/WhatsAppCleaner/main/WhatsAppCleaner.bat)
2. Execute o arquivo com clique duplo ou clique com o botão direito e selecione "Executar como administrador"
3. O script exibirá o espaço ocupado pelos arquivos temporários
4. Digite `s` e pressione Enter para confirmar a limpeza, ou `n` para cancelar
5. Se o WhatsApp estiver em execução, ele será fechado automaticamente antes da limpeza e reaberto após a conclusão

## ⚙️ Como funciona

O script executa as seguintes etapas:

1. Define o caminho do diretório de armazenamento temporário do WhatsApp Desktop
   ```
   %USERPROFILE%\AppData\Local\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalState\shared\transfers
   ```

2. Verifica se o diretório existe no sistema

3. Verifica se o WhatsApp está em execução

4. Calcula o espaço ocupado pelos arquivos temporários usando PowerShell

5. Exibe o espaço ocupado e solicita confirmação para prosseguir

6. Se confirmado:
   - Fecha o WhatsApp (se estiver em execução)
   - Remove todos os arquivos e subdiretórios do diretório temporário
   - Exibe o espaço liberado
   - Reabre o WhatsApp (se estava em execução anteriormente)

## 📊 Detalhes técnicos

- O script utiliza comandos do Windows e PowerShell para calcular o tamanho dos arquivos
- Utiliza a codificação UTF-8 (código de página 65001) para suporte a caracteres especiais
- Verifica processos em execução para determinar se o WhatsApp está aberto
- Usa o protocolo URI `whatsapp://` para reabrir o aplicativo

## ⚠️ Observações

- Este script funciona apenas com a versão oficial do WhatsApp Desktop para Windows (versão da Microsoft Store)
- É recomendável executar o script periodicamente para manter o espaço em disco otimizado
- Após a limpeza, o WhatsApp pode levar mais tempo para carregar na primeira execução

## 🔄 Compatibilidade

- Windows 10 e 11
- WhatsApp Desktop (versão da Microsoft Store)

## 📜 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para detalhes.

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.
