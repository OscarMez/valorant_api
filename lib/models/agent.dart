import 'dart:convert';

class Agent {
  String uuid;
  String displayName;
  String description;
  String developerName;
  List<String>? characterTags;
  String displayIcon;
  String displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String killfeedPortrait;
  String? background;
  List<String> backgroundGradientColors;
  String assetPath;
  bool isFullPortraitRightFacing;
  bool isPlayableCharacter;
  bool isAvailableForTest;
  bool isBaseContent;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
  });

  factory Agent.fromJson(String str) => Agent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Agent.fromMap(Map<String, dynamic> json) => Agent(
    uuid: json["uuid"],
    displayName: json["displayName"],
    description: json["description"],
    developerName: json["developerName"],
    characterTags: json["characterTags"] == null ? [] : List<String>.from(json["characterTags"]!.map((x) => x)),
    displayIcon: json["displayIcon"],
    displayIconSmall: json["displayIconSmall"],
    bustPortrait: json["bustPortrait"],
    fullPortrait: json["fullPortrait"],
    fullPortraitV2: json["fullPortraitV2"],
    killfeedPortrait: json["killfeedPortrait"],
    background: json["background"],
    backgroundGradientColors: List<String>.from(json["backgroundGradientColors"].map((x) => x)),
    assetPath: json["assetPath"],
    isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
    isPlayableCharacter: json["isPlayableCharacter"],
    isAvailableForTest: json["isAvailableForTest"],
    isBaseContent: json["isBaseContent"],
  );

  Map<String, dynamic> toMap() => {
    "uuid": uuid,
    "displayName": displayName,
    "description": description,
    "developerName": developerName,
    "characterTags": characterTags == null ? [] : List<dynamic>.from(characterTags!.map((x) => x)),
    "displayIcon": displayIcon,
    "displayIconSmall": displayIconSmall,
    "bustPortrait": bustPortrait,
    "fullPortrait": fullPortrait,
    "fullPortraitV2": fullPortraitV2,
    "killfeedPortrait": killfeedPortrait,
    "background": background,
    "backgroundGradientColors": List<dynamic>.from(backgroundGradientColors.map((x) => x)),
    "assetPath": assetPath,
    "isFullPortraitRightFacing": isFullPortraitRightFacing,
    "isPlayableCharacter": isPlayableCharacter,
    "isAvailableForTest": isAvailableForTest,
    "isBaseContent": isBaseContent,
  };
}
