import 'dart:convert';

import 'package:valorant_api/models/agent.dart';

class AgentResponse {
    int status;
    List<Agent> agents;

    AgentResponse({
        required this.status,
        required this.agents,
    });

    factory AgentResponse.fromJson(String str) => AgentResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AgentResponse.fromMap(Map<String, dynamic> json) => AgentResponse(
        status: json["status"],
        agents: List<Agent>.from(json["data"].map((x) => Agent.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(agents.map((x) => x.toMap())),
    };
}
