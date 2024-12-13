import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_api/widgets/agent_slider.dart';
import '../providers/agents_provider.dart';
import '../widgets/agent_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final agentProvider = Provider.of<AgentsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agentes de Valorant'),
      ),
      body: agentProvider.agents.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                AgentSwiper(agents: agentProvider.agents), // Swiper añadido aquí
                const SizedBox(height: 20),
                const AgentSlider()
              ],
            ),
    );
  }
}
