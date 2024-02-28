import 'package:flutter/material.dart';
import 'package:quizz_app/quizz/data/models/quizz_model.dart';

class CreateQuizzScreen extends StatefulWidget {
  const CreateQuizzScreen({Key? key}) : super(key: key);

  @override
  State<CreateQuizzScreen> createState() => _CreateQuizzScreenState();
}

class _CreateQuizzScreenState extends State<CreateQuizzScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _questionController = TextEditingController();
  final _correctAnswerController = TextEditingController();
  final _incorrect1Controller = TextEditingController();
  final _incorrect2Controller = TextEditingController();
  final _incorrect3Controller = TextEditingController();
  final List<Question> _questions = [];
  final GlobalKey<FormState> _questionkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _errorHasQuestions = false;

  Future<void> _createQuizz() async {
    if ((_formKey.currentState?.validate() ?? false) && _questions.isNotEmpty) {
      print('Imprimiendo');

      _nameController.clear();
      _descriptionController.clear();
      _questionController.clear();
      _correctAnswerController.clear();
      _incorrect1Controller.clear();
      _incorrect2Controller.clear();
      _incorrect3Controller.clear();
      _questions.clear();
      _errorHasQuestions = false;
      setState(() {});
      return;
    }
    if (_questions.isEmpty) {
      setState(() {
        _errorHasQuestions = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear quizz',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 222, 250, 255),
                    filled: true,
                    labelText: 'Nombre del quizz',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El nombre del quizz no puede estar vacío';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 222, 250, 255),
                    filled: true,
                    labelText: 'Descripción',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'La descripción no puede estar vacía';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 77, 117, 225),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Form(
                    key: _questionkey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _questionController,
                                decoration: const InputDecoration(
                                  fillColor: Color.fromARGB(255, 222, 250, 255),
                                  filled: true,
                                  labelText: 'Pregunta',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'La pregunta es requerida';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (_questionkey.currentState?.validate() ??
                                    false) {
                                  _questions.add(
                                    Question(
                                      pregunta: _questionController.text,
                                      respuestas: [
                                        Answer(
                                          opcion: _correctAnswerController.text,
                                          correcta: true,
                                        ),
                                        Answer(
                                          opcion: _incorrect1Controller.text,
                                          correcta: false,
                                        ),
                                        Answer(
                                          opcion: _incorrect2Controller.text,
                                          correcta: false,
                                        ),
                                        Answer(
                                          opcion: _incorrect3Controller.text,
                                          correcta: false,
                                        ),
                                      ],
                                    ),
                                  );
                                  setState(() {});
                                  _questionController.clear();
                                  _correctAnswerController.clear();
                                  _incorrect1Controller.clear();
                                  _incorrect2Controller.clear();
                                  _incorrect3Controller.clear();
                                  _errorHasQuestions = false;
                                }
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _correctAnswerController,
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 222, 250, 255),
                            filled: true,
                            labelText: 'Respuesta correcta',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'La pregunta es requerida';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _incorrect1Controller,
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 222, 250, 255),
                            filled: true,
                            labelText: 'Respuesta incorrecta 1',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'La respuesta es requerida';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _incorrect2Controller,
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 222, 250, 255),
                            filled: true,
                            labelText: 'Respuesta incorrecta 2',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'La respuesta es requerida';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _incorrect3Controller,
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 222, 250, 255),
                            filled: true,
                            labelText: 'Respuesta incorrecta 3',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'La respuesta es requerida';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_errorHasQuestions)
                  const Text(
                    'Debes agregar al menos una pregunta',
                    style: TextStyle(color: Colors.red),
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _questions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _questions[index].pregunta,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(
                              () {
                                _questions.removeAt(index);
                                if (_questions.isEmpty) {
                                  _errorHasQuestions = true;
                                }
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 111, 190, 255),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      _createQuizz();
                    },
                    child: const Text(
                      'Crear Quizz',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
