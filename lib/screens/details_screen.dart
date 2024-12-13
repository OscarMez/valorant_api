import 'package:flutter/material.dart';
import '../models/agent.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;

    return Scaffold(
      appBar: AppBar(
        title: Text(agent.displayName),
      ),
      body: Center(
        child: Column(
          children: [
            FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(agent.killfeedPortrait),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              agent.displayName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(agent.description),  // Aquí puedes mostrar la descripción del agente o cualquier otra propiedad
          ],
        ),
      ),
    );
  }
}
