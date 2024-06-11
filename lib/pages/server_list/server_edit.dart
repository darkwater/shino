import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shino/models/server_details.dart';
import 'package:shino/providers/servers.dart';

class ServerEditPage extends ConsumerStatefulWidget {
  final ServerDetails initial;

  const ServerEditPage({required this.initial, super.key});

  static Route routeNew() => MaterialPageRoute<void>(
      builder: (_) => ServerEditPage(initial: ServerDetails.empty()));

  @override
  ConsumerState<ServerEditPage> createState() => _ServerEditPageState();
}

class _ServerEditPageState extends ConsumerState<ServerEditPage> {
  late ServerDetails _serverDetails;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _hostController = TextEditingController();
  final TextEditingController _portController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _autoUpdateName = true;

  @override
  void initState() {
    super.initState();
    _serverDetails = widget.initial;

    if (_serverDetails.isSaved) {
      _autoUpdateName = false;
    }

    _nameController.text = _serverDetails.name;
    _hostController.text = _serverDetails.host;
    _portController.text = _serverDetails.port.toString();
    _usernameController.text = _serverDetails.username;

    _nameController.addListener(() {
      setState(() {
        _serverDetails = _serverDetails.copyWith(name: _nameController.text);
      });
    });

    _hostController.addListener(() {
      setState(() {
        _serverDetails = _serverDetails.copyWith(host: _hostController.text);

        if (!_autoUpdateName) return;

        _nameController.text = _hostController.text.split(".").first;
      });
    });

    _portController.addListener(() {
      setState(() {
        _serverDetails = _serverDetails.copyWith(
          port: int.tryParse(_portController.text) ?? 0,
        );
      });
    });

    _usernameController.addListener(() {
      setState(() {
        _serverDetails =
            _serverDetails.copyWith(username: _usernameController.text);
      });
    });

    if (_usernameController.text.isEmpty && !widget.initial.isSaved) {
      try {
        // default user name to the last one used
        final server = ref.read(serverDetailsProvider).last;
        _usernameController.text = server.username;
      } catch (e) {
        // never mind
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initial.isSaved ? "Edit Server" : "New Server"),
      ),
      body: ListView(
        children: [
          _buildInputField(
            context,
            label: "Name",
            controller: _nameController,
            cancelAutoName: true,
          ),
          Row(
            children: [
              Expanded(
                child: _buildInputField(
                  context,
                  label: "Host",
                  controller: _hostController,
                  autofocus: true,
                ),
              ),
              SizedBox(
                width: 100,
                child: _buildInputField(
                  context,
                  label: "Port",
                  controller: _portController,
                  port: true,
                ),
              ),
            ],
          ),
          _buildInputField(
            context,
            label: "Username",
            controller: _usernameController,
            last: true,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _serverDetails != widget.initial && _serverDetails.isValid
            ? () async {
                final details = await _serverDetails.save();
                if (!context.mounted) return;
                Navigator.of(context).pop(details);
              }
            : null,
        icon: const Icon(Icons.save),
        label: const Text("Save"),
      ),
    );
  }

  Widget _buildInputField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    bool port = false,
    bool last = false,
    bool autofocus = false,
    bool cancelAutoName = false,
  }) {
    return ListTile(
      title: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          // suffixIcon: password
          //     ? IconButton(
          //         icon: Icon(
          //             _showPassword ? Icons.visibility : Icons.visibility_off),
          //         onPressed: () =>
          //             setState(() => _showPassword = !_showPassword),
          //       )
          //     : null,
        ),
        autofocus: autofocus,
        keyboardType: port ? TextInputType.number : TextInputType.emailAddress,
        textInputAction: last ? TextInputAction.done : TextInputAction.next,
        // focusNode: port ? FocusNode(skipTraversal: true) : null,
        onChanged: (value) {
          if (cancelAutoName) {
            _autoUpdateName = false;
          }
        },
        // obscureText: password && !_showPassword,
        validator: (value) {
          // if (password) return null;

          if (value == null || value.isEmpty) {
            if (port) {
              return "No port";
            } else {
              return "Please enter a value";
            }
          }

          if (port &&
              (int.tryParse(value) == null ||
                  int.parse(value) < 1 ||
                  int.parse(value) > 65535)) {
            return "Bad port";
          }

          return null;
        },
      ),
    );
  }
}
