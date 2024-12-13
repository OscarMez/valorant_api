import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../models/agent.dart';

class AgentSwiper extends StatelessWidget {
  final List<Agent> agents;

  const AgentSwiper({required this.agents, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (agents.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: 200,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: agents.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.75,
        itemHeight: size.height * 0.55,
        itemBuilder: (BuildContext context, int index) {
          final agent = agents[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'details',
              arguments: agent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(agent.fullPortraitV2 ?? agent.displayIcon),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
