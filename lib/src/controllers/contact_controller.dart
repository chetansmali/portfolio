import 'package:hrushikesh_portfolio/src/controllers/core/interface.dart';
import 'package:hrushikesh_portfolio/src/data/repositories/contact_repository.dart';

class ContactController extends Controller<ContactController> {
  ContactController(this.contactRepository);

  final ContactRepository contactRepository;

  bool loading = false;
  String error = "";
  String successMessage = "";

  String get getMessage => error.isEmpty ? successMessage : error;
  bool get hasMessage => getMessage.isNotEmpty;

  @override
  void setState({
    bool? loading,
  }) {
    this.loading = loading ?? this.loading;

    updateStream(this);
  }

  void sendMessage(String email, String message) async {
    setState(loading: true);
    error = await contactRepository.sendMessage(email: email, message: message);
    if (error.isEmpty) {
      successMessage = "Your message has been sent. Thanks for reaching out..!";
    }
    setState(loading: false);
  }
}
