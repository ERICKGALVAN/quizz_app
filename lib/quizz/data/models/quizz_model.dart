class QuizzModel {
  String id;
  String nombre;
  String descripcion;
  List<Question> preguntas;

  QuizzModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.preguntas,
  });

  factory QuizzModel.fromJson(Map<String, dynamic> json) {
    return QuizzModel(
      id: json['_id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      preguntas: (json['preguntas'] as List<dynamic>?)
              ?.map((preguntaJson) => Question.fromJson(preguntaJson))
              .toList() ??
          [],
    );
  }
}

class Question {
  String pregunta;
  List<Answer> respuestas;

  Question({
    required this.pregunta,
    required this.respuestas,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      pregunta: json['pregunta'],
      respuestas: (json['respuestas'] as List<dynamic>?)
              ?.map((respuestaJson) => Answer.fromJson(respuestaJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pregunta': pregunta,
      'respuestas': respuestas.map((respuesta) => respuesta.toJson()).toList(),
    };
  }
}

class Answer {
  String opcion;
  bool correcta;

  Answer({
    required this.opcion,
    required this.correcta,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      opcion: json['opcion'],
      correcta: json['correcta'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'opcion': opcion,
      'correcta': correcta,
    };
  }
}
