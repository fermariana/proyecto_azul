import 'package:flutter/material.dart';

import 'package:dialog_flowtter/dialog_flowtter.dart';

void main() {
  runApp(DeimosDialogflowApp());
}

class DeimosDialogflowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deimos Dialogflow Integration',

      // Se encarga de que no salga el banner de "Debug" en la app
      debugShowCheckedModeBanner: false,
      home: DeimosAppHome(),
    );
  }
}

class DeimosAppHome extends StatefulWidget {
  @override
  _DeimosAppHomeState createState() => _DeimosAppHomeState();
}

class _DeimosAppHomeState extends State<DeimosAppHome> {
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  void sendMessage(String text) async {
    DialogAuthCredentials credentials =
        await DialogAuthCredentials.fromFile('assets/dialog_flow_auth.json');
    DialogFlowtter instance = DialogFlowtter(
      credentials: credentials,
    );

    final DialogFlowtter _dialogFlowtter = DialogFlowtter(
      credentials: credentials,
      sessionId: "azul-kei9",
    );

    if (text.isEmpty) return;
    setState(() {
      Message userMessage = Message(text: DialogText(text: [text]));
      addMessage(userMessage, true);
    });

    QueryInput query = QueryInput(text: TextInput(text: text));

    DetectIntentResponse res = await _dialogFlowtter.detectIntent(
      queryInput: query,
    );

    if (res.message == null) return;

    setState(() {
      Message? messageResponse = res.message;

      addMessage(messageResponse!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 137, 166, 245),
                    Color.fromARGB(255, 137, 139, 245),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/chatbot.png"),
                  scale: 5.0,
                )),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "¡Saluda a Azul!",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Spicy Pumpkin',
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          /// Esta parte se asegura que la caja de texto se posicione hasta abajo de la pantalla
          Expanded(
            child: _MessagesList(messages: messages),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            color: Color.fromARGB(255, 137, 166, 245),
            child: Row(
              children: [
                /// El Widget [Expanded] se asegura que el campo de texto ocupe
                /// toda la pantalla menos el ancho del [IconButton]
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _controller,
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ), // Fin de la fila
          ), // Fin del contenedor
        ],
      ), // Fin de la columna
    );
  }
}

class _MessagesList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const _MessagesList({
    Key? key,
    this.messages = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: messages.length,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      separatorBuilder: (_, i) => const SizedBox(height: 10),
      itemBuilder: (context, i) {
        var obj = messages[messages.length - 1 - i];
        return _MessageContainer(
          message: obj['message'],
          isUserMessage: obj['isUserMessage'],
        );
      },

      /// Indicamos que pinte la lista al revés
      reverse: true,
    );
  }
}

class _MessageContainer extends StatelessWidget {
  final Message message;
  final bool isUserMessage;

  const _MessageContainer({
    Key? key,

    /// Indicamos que siempre se debe mandar un mensaje
    required this.message,
    this.isUserMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      /// Cambia el lugar del mensaje
      mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          /// Limita nuestro contenedor a un ancho máximo de 250
          constraints: BoxConstraints(maxWidth: 250),
          child: Container(
            decoration: BoxDecoration(
              /// Cambia el color del contenedor del mensaje
              color: isUserMessage
                  ? Color.fromARGB(255, 137, 139, 245)
                  : Color.fromARGB(255, 137, 166, 245),

              /// Le agrega border redondeados
              borderRadius: BorderRadius.circular(20),
            ),

            /// Espaciado
            padding: const EdgeInsets.all(10),
            child: Text(
              /// Obtenemos el texto del mensaje y lo pintamos.
              /// Si es nulo, enviamos un string vacío.
              message.text?.text![0] ?? '',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
