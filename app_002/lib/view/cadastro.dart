import 'package:flutter/material.dart';

// Página principal de cadastro
class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

// Estado da página de cadastro
class _CadastroPageState extends State<CadastroPage> {
  // Controladores para os campos de entrada
  final _nomeController =
      TextEditingController(); // Controla o texto do campo "Nome"
  final _emailController =
      TextEditingController(); // Controla o texto do campo "Email"
  final _telefoneController =
      TextEditingController(); // Controla o texto do campo "Telefone"
  final _enderecoController =
      TextEditingController(); // Controla o texto do campo "Endereço"

  String? _generoSelecionado; // Armazena o gênero selecionado pelo usuário
  final List<Map<String, String?>> _cadastros =
      []; // Lista para armazenar os cadastros

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'), // Título da página
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaço ao redor do conteúdo
        child: Column(
          children: [
            // Campo de entrada para o nome
            TextFormField(
              controller: _nomeController, // Controlador do campo
              decoration:
                  const InputDecoration(labelText: 'Nome'), // Texto do rótulo
            ),
            // Campo de entrada para o email
            TextFormField(
              controller: _emailController, // Controlador do campo
              decoration:
                  const InputDecoration(labelText: 'Email'), // Texto do rótulo
              keyboardType:
                  TextInputType.emailAddress, // Tipo de teclado para email
            ),
            // Campo de entrada para o telefone
            TextFormField(
              controller: _telefoneController, // Controlador do campo
              decoration: const InputDecoration(
                  labelText: 'Telefone'), // Texto do rótulo
              keyboardType:
                  TextInputType.phone, // Tipo de teclado para telefone
            ),
            // Campo de entrada para o endereço
            TextFormField(
              controller: _enderecoController, // Controlador do campo
              decoration: const InputDecoration(
                  labelText: 'Endereço'), // Texto do rótulo
            ),
            const SizedBox(height: 20), // Espaço vertical
            const Text('Gênero:'), // Texto para seleção de gênero
            Row(
              children: [
                // Opção de rádio para "Masculino"
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Masculino'), // Texto da opção
                    value: 'masculino', // Valor associado à opção
                    groupValue: _generoSelecionado, // Valor do grupo de opções
                    onChanged: (value) {
                      setState(() {
                        _generoSelecionado =
                            value; // Atualiza o valor selecionado
                      });
                    },
                  ),
                ),
                // Opção de rádio para "Feminino"
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Feminino'), // Texto da opção
                    value: 'feminino', // Valor associado à opção
                    groupValue: _generoSelecionado, // Valor do grupo de opções
                    onChanged: (value) {
                      setState(() {
                        _generoSelecionado =
                            value; // Atualiza o valor selecionado
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Espaço vertical
            // Botão para salvar os dados
            ElevatedButton(
              onPressed: () {
                // Verifica se todos os campos estão preenchidos
                if (_nomeController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty &&
                    _telefoneController.text.isNotEmpty &&
                    _enderecoController.text.isNotEmpty &&
                    _generoSelecionado != null) {
                  setState(() {
                    // Adiciona os dados à lista de cadastros
                    _cadastros.add({
                      'nome': _nomeController.text,
                      'email': _emailController.text,
                      'telefone': _telefoneController.text,
                      'endereco': _enderecoController.text,
                      'genero': _generoSelecionado,
                    });
                    // Limpa os campos de entrada
                    _nomeController.clear();
                    _emailController.clear();
                    _telefoneController.clear();
                    _enderecoController.clear();
                    _generoSelecionado = null;
                  });
                } else {
                  // Mostra uma mensagem de erro se algum campo estiver vazio
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, preencha todos os campos.'),
                    ),
                  );
                }
              },
              child: const Text('Salvar'), // Texto do botão
            ),
            // Botão para ver a lista de cadastros
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastrosPage(cadastros: _cadastros),
                  ),
                );
              },
              child: const Text('Ver Cadastros'), // Texto do botão
            ),
          ],
        ),
      ),
    );
  }
}

// Página para exibir a lista de cadastros
class CadastrosPage extends StatelessWidget {
  final List<Map<String, String?>>
      cadastros; // Lista de cadastros a ser exibida

  const CadastrosPage({super.key, required this.cadastros});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cadastros'), // Título da página
      ),
      body: ListView.builder(
        itemCount: cadastros.length, // Número de itens na lista
        itemBuilder: (context, index) {
          final cadastro = cadastros[index]; // Dados do cadastro atual
          return Card(
            margin: const EdgeInsets.all(8.0), // Margem ao redor do cartão
            child: ListTile(
              leading: Icon(
                // Ícone baseado no gênero
                cadastro['genero'] == 'masculino' ? Icons.male : Icons.female,
              ),
              title: Text(cadastro['nome'] ?? ''), // Nome do cadastro
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Email: ${cadastro['email'] ?? ''}'), // Email do cadastro
                  Text(
                      'Telefone: ${cadastro['telefone'] ?? ''}'), // Telefone do cadastro
                  Text(
                      'Endereço: ${cadastro['endereco'] ?? ''}'), // Endereço do cadastro
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
