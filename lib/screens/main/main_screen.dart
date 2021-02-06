import 'package:flutter/material.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/screens/email/email_screen.dart';
import 'components/list_of_emails.dart';
import '../../responsive.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provê acesso a largura e altura da tela
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      // Sempre que a largura da tela é menor do que 1340, sem responsividade temos um overflow

      body: Responsive(
        mobile: ListOfEmails(),
        tablet: Row(
          children: [
            Expanded(flex: 6, child: ListOfEmails()),
            Expanded(flex: 9, child: EmailScreen())
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: ListOfEmails(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: EmailScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
