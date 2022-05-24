import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:prueba/mobile.dart';

class Cuestionario extends StatefulWidget {
  @override
  _CuestionarioState createState() => _CuestionarioState();
}

class _CuestionarioState extends State<Cuestionario> {
  final List<Pregunta> _preguntas = [
    Pregunta(
      enunciado: '1.Tristeza 😢:',
      opciones: [
        'No me siento triste',
        'Me siento triste.',
        'Me siento triste siempre y no puedo evitarlo.',
        'Me siento tan triste que no puedo soportarlo.'
      ],
    ),
    Pregunta(
      enunciado: '2.Pesimismo 😒:',
      opciones: [
        'No me siento desanimado respecto al futuro.',
        'Me siento desanimado respecto al futuro. ',
        'Siento que no tengo que esperar nada',
        'Siento que el futuro es desesperanzador '
      ],
    ),
    Pregunta(
      enunciado: '3.Fracaso 😓:',
      opciones: [
        'No me siento fracasado. ',
        'He fracasado más que la mayoría de las personas',
        'Sólo veo fracaso tras fracaso',
        'Me siento una persona totalmente fracasada. '
      ],
    ),
    Pregunta(
      enunciado: '4.Perdida de placer 😶:',
      opciones: [
        'Las cosas me satisfacen tanto como antes. ',
        'No disfruto de las cosas tanto como antes.',
        'No obtengo una satisfacción auténtica de las cosas. ',
        'Estoy insatisfecho o aburrido de todo. '
      ],
    ),
    Pregunta(
      enunciado: '5.Sentimientos de culpa 😟:',
      opciones: [
        'No me siento particularmente culpable. ',
        'Me siento culpable respecto de varias cosas.',
        'Me siento bastante culpable la mayor parte del dia.',
        'Me siento culpable todo el tiempo.  '
      ],
    ),
    Pregunta(
      enunciado: '6.Sentimientos de castigo 😞:',
      opciones: [
        'No siento que este siendo castigado. ',
        'Siento que tal vez pueda ser castigado.',
        'Espero ser castigado. ',
        ' Siento que estoy siendo castigado. '
      ],
    ),
    Pregunta(
      enunciado: '7.Disconformidad con uno mismo 😕:',
      opciones: [
        'Siento acerca de mi lo mismo que siempre.',
        'He perdido la confianza en mí mismo.',
        'Estoy decepcionado conmigo mismo.',
        'No me gusto a mí mismo.'
      ],
    ),
    Pregunta(
      enunciado: '8.Autocrítica 🤯:',
      opciones: [
        'No me critico ni me culpo más de lo habitual.',
        'Estoy más crítico conmigo mismo.',
        'Me critico a mí mismo por todos mis errores.',
        'Me culpo a mí mismo por todo lo malo que sucede.'
      ],
    ),
    Pregunta(
      enunciado: '9.Pensamientos o Deseos Suicidas 💀:',
      opciones: [
        'No tengo ningún pensamiento de matarme.',
        'He tenido pensamientos suicidas, pero no lo haría.',
        'Querría matarme',
        'Me mataría si tuviera la oportunidad de hacerlo.'
      ],
    ),
    Pregunta(
      enunciado: '10.Llanto 😭:',
      opciones: [
        'No lloro más de lo que solía hacerlo.',
        'Lloro más de lo que solía hacerlo.',
        'Lloro por cualquier pequeñez.',
        'Siento ganas de llorar pero no puedo.'
      ],
    ),
    Pregunta(
      enunciado: '11.Agitación 🥵:',
      opciones: [
        'No estoy más inquieto o tenso que lo habitua.',
        'Me siento más inquieto o tenso que lo habitual.',
        'Estoy tan inquieto que me es difícil quedarme quieto.',
        'No puedo quedarme quieto en ningun momento.'
      ],
    ),
    Pregunta(
      enunciado: '12.Pérdida de Interés 🙃:',
      opciones: [
        'No he perdido el interés en actividades o personas.',
        'Estoy menos interesado en otras personas o cosas.',
        'He perdido casi todo el interés.',
        'Me es difícil interesarme por algo. '
      ],
    ),
    Pregunta(
      enunciado: '13.Indecisión 🤔:',
      opciones: [
        'Tomo mis propias decisiones de forma correcta.',
        'Me es más difícil de lo normal tomar decisiones.',
        'Me es mucho más dificil tomar decisiones.',
        'Tengo problemas para tomar cualquier decisión.'
      ],
    ),
    Pregunta(
      enunciado: '14.Desvalorización 🤕:',
      opciones: [
        'No siento que yo no sea valioso. ',
        'No me considero a mi mismo tan valioso y útil.',
        'Me siento menos valioso que los demas.',
        'Siento que no valgo nada. . '
      ],
    ),
    Pregunta(
      enunciado: '15.Pérdida de Energía 😪:',
      opciones: [
        'Tengo tanta energía como siempre.',
        'Tengo menos energía que la que solía tener. ',
        'No tengo suficiente energía para hacer demasiado.',
        'No tengo energía suficiente para hacer nada.'
      ],
    ),
    Pregunta(
      enunciado: '16.Cambios en los Hábitos de Sueño 😴:',
      opciones: [
        'No he experimentado ningún cambio.',
        'Duermo un poco más que lo habitual.',
        'Duermo un poco menos que lo habitual.',
        'Duermo mucho más que lo habitual. '
      ],
    ),
    Pregunta(
      enunciado: '17.Irritabilidad 😡:',
      opciones: [
        'No estoy tan irritable que lo habitual.',
        'Estoy más irritable que lo habitual.',
        'Estoy mucho más irritable que lo habitual.',
        'Estoy irritable todo el tiempo.'
      ],
    ),
    Pregunta(
      enunciado: '18.Cambios en el Apetito 🤢:',
      opciones: [
        'No he experimentado ningún cambio en mi apetito. ',
        'Mi apetito es un poco menor que lo habitual.',
        'Mi apetito es un poco mayor que lo habitual. ',
        ' Quiero comer todo el día. '
      ],
    ),
    Pregunta(
      enunciado: '19.Dificultad de Concentración 🥴:',
      opciones: [
        'Puedo concentrarme tan bien como siempre.',
        'No puedo concentrarme tan bien.',
        'Me es difícil mantener la mente en algo.',
        ' Encuentro que no puedo concentrarme en nada. '
      ],
    ),
    Pregunta(
      enunciado: '20.Cansancio o Fatiga 😵:',
      opciones: [
        'No estoy más cansado o fatigado que lo habitual.',
        'Me fatigo o me canso más fácilmente que lo normal.',
        'Estoy demasiado fatigado para hacer las cosas.',
        'Estoy demasiado fatigado para hacer todo.'
      ],
    )
  ];

  _opcionSeleccionada(int indexPregunta, int indexOpcion) {
    final Pregunta pregunta = _preguntas[indexPregunta];
    final String opcion = pregunta.opciones[indexOpcion];
    final bool estaSeleccionada = pregunta.respuestas.contains(opcion);
    final respuestas = List<String>.from(pregunta.respuestas);
    if (estaSeleccionada) {
      respuestas.remove(opcion);
    } else {
      respuestas.add(opcion);
    }

    _preguntas[indexPregunta] = pregunta.actualizarPregunta(respuestas);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(185),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 137, 166, 245),
                    Color.fromARGB(255, 137, 139, 245),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/hobbies3.png"),
                  fit: BoxFit.cover,
                )),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Prueba de Beck",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Spicy Pumpkin",
                  fontSize: 45,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Text(
                'En este cuestionario aparecen varios grupos de afirmaciones. Por favor, lea con atención cada una. A continuación, señale cuál de las afirmaciones de cada grupo describe mejor cómo se ha sentido durante esta última semana, incluido el día de hoy.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  _preguntas.length,
                  (indexPregunta) {
                    final pregunta = _preguntas[indexPregunta];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            pregunta.enunciado,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Wrap(
                            children: List.generate(
                              pregunta.opciones.length,
                              (indexOpciones) {
                                final opcion = pregunta.opciones[indexOpciones];
                                final estaSeleccionada =
                                    pregunta.respuestas.contains(opcion);

                                return Row(
                                  children: [
                                    Checkbox(
                                      value: estaSeleccionada,
                                      onChanged: (value) {
                                        _opcionSeleccionada(
                                            indexPregunta, indexOpciones);
                                      },
                                    ),
                                    Text(
                                      pregunta.opciones[indexOpciones],
                                      style: TextStyle(
                                        fontSize: 15.4,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 137, 166, 245),
                                Color.fromARGB(255, 137, 139, 245),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            RaisedButton(
              color: Color.fromARGB(255, 137, 166, 245),
              child: Text(
                'Guardar respuestas',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {},
            ),
            RaisedButton(
              color: Color.fromARGB(255, 137, 166, 245),
              child: Text(
                'Descargar PDF',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: _createPDF,
            ),
          ],
        ),
      ),
    );
  }
}

class Pregunta {
  final String enunciado;
  final List<String> opciones;
  final List<String> respuestas;

  Pregunta({
    required this.enunciado,
    required this.opciones,
    this.respuestas = const [],
  });

  Pregunta actualizarPregunta(List<String> respuestas) {
    return Pregunta(
      enunciado: enunciado,
      opciones: opciones,
      respuestas: respuestas,
    );
  }
}

Future<void> _createPDF() async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();
  page.graphics.drawString('Respuestas de la prueba de Beck',
      PdfStandardFont(PdfFontFamily.helvetica, 30));

  page.graphics.drawString('Respuestas de la prueba de Beck',
      PdfStandardFont(PdfFontFamily.helvetica, 30));

  List<int> bytes = document.save();
  document.dispose();

  saveAndLaunchFile(bytes, 'Prueba de Beck');
}
