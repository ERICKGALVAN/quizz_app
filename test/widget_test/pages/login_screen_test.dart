import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizz_app/auth/presentation/screens/login_screen.dart';

//se crea una app falsa para poder realizar las pruebas, solo muestra el login screen
const fakeApp = MaterialApp(
  home: LoginScreen(),
);
void main() {
  // se crea un grupo de pruebas
  group(
    'find widgets on screen',
    () {
      // se crea una prueba
      testWidgets(
        'find buttons',
        (widgetTester) async {
          // se realiza la prueba levantanado la app falsa
          await widgetTester.pumpWidget(fakeApp);
          // se busca el boton de login
          final loginButton = find.byType(ElevatedButton);
          // se busca el boton de registro
          expect(loginButton, findsOneWidget);
        },
      );
      // se crea una prueba
      testWidgets(
        'find text',
        (widgetTester) async {
          // se realiza la prueba levantanado la app falsa
          await widgetTester.pumpWidget(fakeApp);
          // se busca el texto de bienvenida
          final registerText = find.text('Bienvenido');
          // se busca el texto de bienvenida
          expect(registerText, findsOneWidget);
        },
      );
    },
  );

  group(
    'interact with elements',
    () {
      testWidgets(
        'tap on button',
        (widgetTester) async {
          // se realiza la prueba levantanado la app falsa
          await widgetTester.pumpWidget(fakeApp);
          // se busca el boton de login
          final loginButton = find.byType(ElevatedButton);
          // se simula el tap en el boton de login
          await widgetTester.tap(loginButton);
          // se espera a que la app se actualice
          await widgetTester.pump();
          // se busca el boton de login
          expect(loginButton, findsOneWidget);
        },
      );

      testWidgets(
        'fill textfield',
        (widgetTester) async {
          //declaramos un username cualquiera
          const String username = 'erick';
          // se realiza la prueba levantanado la app falsa
          await widgetTester.pumpWidget(fakeApp);
          // se busca el textfield de email por key, que se la pusimos en la screen
          final emailTextField = find.byKey(const Key('username'));
          // se simula el tap en el textfield
          await widgetTester.enterText(emailTextField, username);
          // se espera a que la app se actualice
          await widgetTester.pump();
          // se busca el texto que se ingreso en el textfield
          final findedUsername = find.text(username);
          // se espera que el texto ingresado sea el mismo que se ingreso
          expect(findedUsername, findsOneWidget);
        },
      );
    },
  );
}
