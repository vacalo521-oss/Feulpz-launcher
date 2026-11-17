import 'package:flutter/material.dart';

void main() => runApp(const FeulpzApp());

const lime = Color(0xFFB7F34A);
const panel = Color(0xFF171B20);
const muted = Color(0xFF9AA4AE);

class FeulpzApp extends StatelessWidget {
  const FeulpzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feulpz Launcher',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D1014),
        colorScheme: ColorScheme.fromSeed(
          seedColor: lime,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const LauncherHome(),
    );
  }
}

class LauncherHome extends StatefulWidget {
  const LauncherHome({super.key});

  @override
  State<LauncherHome> createState() => _LauncherHomeState();
}

class _LauncherHomeState extends State<LauncherHome> {
  int tab = 0;
  String edition = 'Java';
  String version = '26.2';
  bool performanceMode = true;
  bool showFps = true;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _home(),
      _library(),
      _settings(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.bolt, color: lime),
            SizedBox(width: 8),
            Text('FEULPZ', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2)),
            SizedBox(width: 6),
            Text('LAUNCHER', style: TextStyle(color: muted, fontSize: 12, letterSpacing: 1)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Perfil',
            onPressed: () => _message('Perfis locais serão adicionados em uma próxima versão.'),
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: SafeArea(child: pages[tab]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Biblioteca'),
          NavigationDestination(icon: Icon(Icons.tune), label: 'Ajustes'),
        ],
      ),
    );
  }

  Widget _home() {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: [Color(0xFF293A1D), Color(0xFF171F17), Color(0xFF171B20)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: lime.withOpacity(.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('SEU MINECRAFT, DO SEU JEITO', style: TextStyle(color: lime, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              const SizedBox(height: 10),
              const Text('Pronto para jogar?', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
              const SizedBox(height: 6),
              const Text('Escolha a edição e prepare seu perfil.', style: TextStyle(color: muted)),
              const SizedBox(height: 20),
              Row(children: [
                Expanded(child: _editionButton('Java', Icons.coffee)),
                const SizedBox(width: 10),
                Expanded(child: _editionButton('Bedrock', Icons.diamond_outlined)),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 22),
        _sectionTitle('CONFIGURAÇÃO DO JOGO'),
        const SizedBox(height: 10),
        _panel(
          child: Column(children: [
            Row(children: [
              const Icon(Icons.layers_outlined, color: lime),
              const SizedBox(width: 12),
              const Expanded(child: Text('Versão')),
              DropdownButton<String>(
                value: version,
                underline: const SizedBox(),
                items: const ['26.2', '26.1', '26.0'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
                onChanged: (v) => setState(() => version = v!),
              ),
            ]),
            const Divider(color: Color(0xFF303840)),
            Row(children: [
              const Icon(Icons.memory, color: lime),
              const SizedBox(width: 12),
              const Expanded(child: Text('Modo desempenho')),
              Switch(value: performanceMode, activeColor: lime, onChanged: (v) => setState(() => performanceMode = v)),
            ]),
            Row(children: [
              const Icon(Icons.speed, color: lime),
              const SizedBox(width: 12),
              const Expanded(child: Text('Exibir FPS (quando suportado)')),
              Switch(value: showFps, activeColor: lime, onChanged: (v) => setState(() => showFps = v)),
            ]),
          ]),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 56,
          child: FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: lime, foregroundColor: Colors.black),
            onPressed: () => _message('Protótipo visual: o mecanismo Java/Android ainda precisa ser integrado e testado.'),
            icon: const Icon(Icons.play_arrow_rounded, size: 28),
            label: const Text('INICIAR JOGO', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1)),
          ),
        ),
        const SizedBox(height: 12),
        const Text('Aviso: 120 FPS é uma meta de desempenho, não uma garantia. O resultado depende do aparelho, renderizador, versão e configurações do jogo.', style: TextStyle(color: muted, fontSize: 11)),
      ],
    );
  }

  Widget _editionButton(String name, IconData icon) {
    final selected = edition == name;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => setState(() => edition = name),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: selected ? lime.withOpacity(.14) : const Color(0xFF11161B),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: selected ? lime : const Color(0xFF303840)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: selected ? lime : muted, size: 19),
          const SizedBox(width: 8),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: selected ? lime : Colors.white)),
        ]),
      ),
    );
  }

  Widget _library() => ListView(
    padding: const EdgeInsets.all(18),
    children: [
      const Text('BIBLIOTECA', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
      const SizedBox(height: 6),
      const Text('Seus conteúdos ficarão organizados aqui.', style: TextStyle(color: muted)),
      const SizedBox(height: 16),
      _panel(child: const ListTile(leading: Icon(Icons.extension, color: lime), title: Text('Mods'), subtitle: Text('Gerenciamento será implementado depois.'))),
      const SizedBox(height: 10),
      _panel(child: const ListTile(leading: Icon(Icons.texture, color: lime), title: Text('Texturas'), subtitle: Text('Pacotes de recursos serão adicionados depois.'))),
      const SizedBox(height: 10),
      _panel(child: const ListTile(leading: Icon(Icons.save_outlined, color: lime), title: Text('Perfis'), subtitle: Text('Configurações por instalação.'))),
    ],
  );

  Widget _settings() => ListView(
    padding: const EdgeInsets.all(18),
    children: [
      const Text('AJUSTES', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
      const SizedBox(height: 16),
      _panel(child: const ListTile(leading: Icon(Icons.info_outline, color: lime), title: Text('Feulpz Launcher'), subtitle: Text('Versão de protótipo 0.1.0'))),
      const SizedBox(height: 10),
      _panel(child: const ListTile(leading: Icon(Icons.verified_user_outlined, color: lime), title: Text('Contas'), subtitle: Text('A integração oficial de autenticação ainda não está implementada.'))),
      const SizedBox(height: 10),
      _panel(child: const ListTile(leading: Icon(Icons.phone_android, color: lime), title: Text('Dispositivo-alvo'), subtitle: Text('Motorola G34 5G'))),
    ],
  );

  Widget _sectionTitle(String text) => Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: muted, letterSpacing: 1.3));

  Widget _panel({required Widget child}) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    decoration: BoxDecoration(color: panel, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF293139))),
    child: child,
  );

  void _message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
