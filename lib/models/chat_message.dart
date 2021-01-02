import 'dart:convert';

MessagesResponse messagesResponseFromJson(String str) => MessagesResponse.fromJson(json.decode(str));

String apiResponseToJson(MessagesResponse data) => json.encode(data.toJson());

class MessagesResponse {
    MessagesResponse({
        this.messages,
        this.total,
    });

    List<ChatMessage> messages;
    int total;

    factory MessagesResponse.fromJson(Map<String, dynamic> json) => MessagesResponse(
        messages: List<ChatMessage>.from(json["messages"].map((x) => ChatMessage.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "total": total,
    };
}

class ChatMessage {
    ChatMessage({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.destinatario,
        this.emisor,
        this.contenido,
    });

    String id;
    DateTime createdAt;
    DateTime updatedAt;
    String destinatario;
    String emisor;
    String contenido;

    factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        destinatario: json["destinatario"],
        emisor: json["emisor"],
        contenido: json["contenido"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "destinatario": destinatario,
        "emisor": emisor,
        "contenido": contenido,
    };
}



