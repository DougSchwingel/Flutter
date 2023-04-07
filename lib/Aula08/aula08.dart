import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

class Aula08 extends StatefulWidget {
  const Aula08({super.key});

  @override
  State<Aula08> createState() => _Aula08State();
}

class _Aula08State extends State<Aula08> {
  bool _senhaEscondida = true;

  late final TextEditingController _userController;
  late final TextEditingController _passwordController;
  List<bool> _selectedList = [true, false, false];

  void _alteraVisibilidade() {
    setState(() {
      _senhaEscondida = !_senhaEscondida;
    });
  }

  void _alteraLogin(int idx) {
    setState(() {
      _selectedList =
          _selectedList.mapIndexed((pos, val) => pos == idx).toList();
    });
  }

  void _testaCampos() {
    debugPrint('Usuário: ${_userController.text}');
    debugPrint('Senha: ${_passwordController.text}');
  }

  @override
  void initState() {
    _userController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/IFSP.png',
                width: MediaQuery.of(context).size.width * 0.55,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Logar com:'),
                  const SizedBox(width: 8),
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(10.0),
                    isSelected: _selectedList,
                    onPressed: _alteraLogin,
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text('E-Mail'),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text('CPF'),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text('Telefone'),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _userController,
                decoration: const InputDecoration(
                    label: Text('E-mail'),
                    hintText: 'user@mail.com',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail)),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _senhaEscondida,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  label: const Text('Senha'),
                  hintText: 'Senha',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: _alteraVisibilidade,
                      icon: _senhaEscondida
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.75, 50)),
                onPressed: _testaCampos,
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
