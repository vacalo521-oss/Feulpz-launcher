# Feulpz Launcher Android v0.2

Este pacote contém o protótipo Flutter e um fluxo de compilação automática para gerar um APK de teste usando GitHub Actions.

## Conteúdo
- `lib/main.dart`: interface inicial do protótipo.
- `pubspec.yaml`: configuração Flutter.
- `.github/workflows/build-apk.yml`: receita de compilação automática do APK.

## Como gerar o APK usando apenas o celular
1. Crie ou entre em uma conta GitHub.
2. Crie um repositório novo, por exemplo `feulpz-launcher`.
3. Envie todos os arquivos e pastas deste ZIP para a raiz do repositório, mantendo a pasta `.github/workflows`.
4. Abra a aba **Actions** do repositório.
5. Se o GitHub pedir, habilite Actions para o repositório.
6. Abra o fluxo **Build Feulpz Launcher APK** e toque em **Run workflow** (ou aguarde a compilação automática após enviar para a branch `main`).
7. Quando terminar com sucesso, abra a execução e baixe o artefato `feulpz-launcher-debug-apk`.
8. Extraia o ZIP baixado pelo GitHub para encontrar `app-debug.apk`.

## Limitações desta versão
Este é apenas um protótipo visual compilável. O botão iniciar ainda não inicia Minecraft. Não inclui runtime Java, renderizador, download/instalação de jogo ou autenticação. A compatibilidade real com Minecraft Java 26.2 e qualquer meta de FPS depende de futuras integrações e testes no aparelho. Use autenticação oficial e arquivos de jogo obtidos legitimamente.
