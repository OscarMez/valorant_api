import 'package:flutter/material.dart';
import '../models/agent.dart';

class AgentPoster extends StatelessWidget {
  final Agent agent;

  const AgentPoster({required this.agent}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: agent),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(agent.killfeedPortrait),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            agent.displayName,
            style: const TextStyle(fontSize: 13),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
