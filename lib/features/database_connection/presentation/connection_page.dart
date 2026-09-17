import 'package:flutter/material.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final _formKey = GlobalKey<FormState>();

  final _serverController = TextEditingController();
  final _databaseController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String _serverType = 'MSSQL';

  @override
  void dispose() {
    _serverController.dispose();
    _databaseController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _start() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Реальное подключение к БД добавим следующим этапом.
  }

  void _cancel() {
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4D0C8),
      body: Center(
        child: SizedBox(
          width: 548,
          height: 345,
          child: Material(
            color: const Color(0xFFD4D0C8),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ConnectionGroup(
                    serverType: _serverType,
                    onServerTypeChanged: (value) {
                      if (value == null) {
                        return;
                      }

                      setState(() {
                        _serverType = value;
                      });
                    },
                    serverController: _serverController,
                    databaseController: _databaseController,
                  ),
                  const SizedBox(height: 4),
                  _LoginGroup(
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                  ),
                  const Spacer(),
                  _BottomButtons(onStart: _start, onCancel: _cancel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ConnectionGroup extends StatelessWidget {
  const _ConnectionGroup({
    required this.serverType,
    required this.onServerTypeChanged,
    required this.serverController,
    required this.databaseController,
  });

  final String serverType;
  final ValueChanged<String?> onServerTypeChanged;
  final TextEditingController serverController;
  final TextEditingController databaseController;

  @override
  Widget build(BuildContext context) {
    return _WindowsGroupBox(
      title: 'Соединение',
      height: 109,
      child: Column(
        children: [
          _LabeledRow(
            label: 'Тип сервера',
            child: SizedBox(
              height: 21,
              child: DropdownButtonFormField<String>(
                initialValue: serverType,
                isDense: true,
                decoration: _fieldDecoration(),
                items: const [
                  DropdownMenuItem(value: 'MSSQL', child: Text('MSSQL')),
                  DropdownMenuItem(value: 'ORACLE', child: Text('ORACLE')),
                ],
                onChanged: onServerTypeChanged,
              ),
            ),
          ),
          const SizedBox(height: 7),
          _LabeledRow(
            label: 'Имя сервера',
            child: SizedBox(
              height: 21,
              child: TextFormField(
                controller: serverController,
                decoration: _fieldDecoration(),
                validator: _required,
              ),
            ),
          ),
          const SizedBox(height: 7),
          _LabeledRow(
            label: 'Имя базы данных',
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 21,
                    child: TextFormField(
                      controller: databaseController,
                      decoration: _fieldDecoration(),
                      validator: _required,
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                SizedBox(
                  width: 21,
                  height: 21,
                  child: OutlinedButton(
                    onPressed: () {
                      // Выбор базы/пути добавим отдельно.
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(21, 21),
                    ),
                    child: const Text('...', style: TextStyle(fontSize: 11)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginGroup extends StatelessWidget {
  const _LoginGroup({
    required this.usernameController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return _WindowsGroupBox(
      title: 'Логин',
      height: 78,
      child: Column(
        children: [
          _LabeledRow(
            label: 'Имя пользователя',
            child: SizedBox(
              height: 21,
              child: TextFormField(
                controller: usernameController,
                decoration: _fieldDecoration(),
                validator: _required,
              ),
            ),
          ),
          const SizedBox(height: 7),
          _LabeledRow(
            label: 'Пароль',
            child: SizedBox(
              height: 21,
              child: TextFormField(
                key: const Key('password-field'),
                controller: passwordController,
                obscureText: true,
                decoration: _fieldDecoration(),
                validator: _required,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({required this.onStart, required this.onCancel});

  final VoidCallback onStart;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: Column(
        children: [
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: 78,
                  height: 25,
                  child: ElevatedButton(
                    onPressed: onStart,
                    style: _buttonStyle(),
                    child: const Text('Start'),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 78,
                  height: 25,
                  child: ElevatedButton(
                    onPressed: onCancel,
                    style: _buttonStyle(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 21),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WindowsGroupBox extends StatelessWidget {
  const _WindowsGroupBox({
    required this.title,
    required this.height,
    required this.child,
  });

  final String title;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 17),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF808080)),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: -1,
              child: Container(
                color: const Color(0xFFD4D0C8),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'MS Sans Serif',
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(left: 10, right: 10, top: 18, bottom: 8, child: child),
          ],
        ),
      ),
    );
  }
}

class _LabeledRow extends StatelessWidget {
  const _LabeledRow({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 107,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'MS Sans Serif',
                fontSize: 11,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

InputDecoration _fieldDecoration() {
  return const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xFF808080)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xFF808080)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xFF404040)),
    ),
  );
}

ButtonStyle _buttonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    minimumSize: const Size(78, 25),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    textStyle: const TextStyle(fontFamily: 'Arial', fontSize: 11),
  );
}

String? _required(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Обязательное поле';
  }

  return null;
}
