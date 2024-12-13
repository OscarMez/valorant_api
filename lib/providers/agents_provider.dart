import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:valorant_api/models/agent.dart';
import 'package:valorant_api/models/agent_response.dart';


class AgentsProvider extends ChangeNotifier {
  final String _baseUrl = 'valorant-api.com'; 

  List<Agent> agents = []; 

  AgentsProvider() {
    fetchAgents(); // Llama a la función fetchAgents al construir el provider
  }

  Future<void> fetchAgents() async {
    try {
      // Construcción del URI para la petición
      final uri = Uri.https(_baseUrl, '/v1/agents', {
        'language' : 'es-ES'
      });
      print(uri);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // Decodifica la respuesta como String
        final decodedData = response.body; // Aquí obtenemos el cuerpo de la respuesta como String.

        // Convierte la respuesta a un objeto AgentResponse
        final agentResponse = AgentResponse.fromJson(decodedData);  // Deserializa correctamente aquí
        print(agentResponse); // Esto imprimirá la respuesta de la API.

        agents = agentResponse.agents;  // Asignar la lista de agentes
        for (Agent a in agents) {
          print(a); // Imprime cada agente
        }

        // Notifica a los oyentes que los datos han cambiado
        notifyListeners();
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }
}
