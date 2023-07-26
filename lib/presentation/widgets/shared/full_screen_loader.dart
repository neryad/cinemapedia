import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadMessages() {
    final messages = <String>[
      'Cargando películas',
      'Comprando palomitas de maíz',
      'Cargando populares',
      'llamando a mi novia',
      'ya descansa ya',
      'Esto esta durando pila :)',
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Espere por favor'),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
          stream: getLoadMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando');

            return Text(snapshot.data!);
          },
        )
      ]),
    );
  }
}
