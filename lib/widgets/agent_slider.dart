import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_api/widgets/agent_poster.dart';
import '../providers/agents_provider.dart';

class AgentSlider extends StatelessWidget {
  const AgentSlider() : super(key: null);

  @override
  Widget build(BuildContext context) {
    final agentProvider = Provider.of<AgentsProvider>(context);
    print(agentProvider.agents); // Para asegurarnos que se están cargando los agentes

    // Si la lista de agentes está vacía, mostrar un indicador de carga
    if (agentProvider.agents.isEmpty) {
      return const SizedBox(
        width: double.infinity,
        height: 260,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    // Ahora que la lista de agentes tiene contenido, construir la interfaz de deslizamiento
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Agentes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          // Asegurarse de que ListView se puede deslizar
          SizedBox(
            height: 220, // Aseguramos un tamaño específico para el ListView
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                // Puedes usar este callback para detectar el deslizamiento
                if (details.primaryDelta! > 0) {
                  print('Deslizar hacia la derecha');
                } else if (details.primaryDelta! < 0) {
                  print('Deslizar hacia la izquierda');
                }
              },
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Hacer que sea horizontal
                itemCount: agentProvider.agents.length,
                itemBuilder: (_, int index) {
                  final agent = agentProvider.agents[index];
                  return AgentPoster(agent: agent); // Usamos el widget AgentPoster para cada agente
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
