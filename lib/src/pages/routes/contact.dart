import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/controllers/contact_controller.dart';
import 'package:hrushikesh_portfolio/src/controllers/core/provider.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late ContactController contactController;

  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();

  bool canSend = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    contactController = Provider.of<ContactController>(context);

    contactController.listen((state) {
      if (state.successMessage.isNotEmpty) {
        email.clear();
        message.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: contactController.state,
      builder: (context, snapshot) {
        final loading = contactController.loading;
        return SingleChildScrollView(
          child: Card(
            child: Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: email,
                    maxLines: 1,
                    enabled: !loading,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: "Email",
                      hintText: "I will try to reply to this email",
                    ),
                    onChanged: (_) => validate(),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: message,
                    maxLines: 10,
                    enabled: !loading,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: "Message",
                      hintText: "",
                      alignLabelWithHint: true,
                    ),
                    onChanged: (_) => validate(),
                  ),
                  SizedBox(height: 24),
                  contactController.loading
                      ? Center(
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            contactController.hasMessage
                                ? Text(
                                    contactController.getMessage,
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: contactController.error.isNotEmpty ? Colors.redAccent : Colors.greenAccent,
                                        ),
                                  )
                                : SizedBox(),
                            SizedBox(height: contactController.hasMessage ? 24 : 0),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: !canSend
                                    ? null
                                    : () {
                                        contactController.sendMessage(email.text, message.text);
                                      },
                                child: Text(
                                  "Send",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  validate() {
    setState(() {
      canSend = email.text.isNotEmpty && message.text.isNotEmpty;
    });
  }
}
