import 'date_helper.dart';

const kRequiredField = 'Campo obrigatório';
const kPhoneValidator = 'Telefone inválido';
const kDateValidator = 'Data inválida';

class ValidatorHelper {
  static String fieldValidator(String text) {
    if (text.isEmpty)
      return kRequiredField;
    else
      return null;
  }

  static String phoneValidator(String text) {
    if (text.length == 0) {
      return 'Por favor insira um número de telefone';
    } else if (text.length < 10) {
      return 'Por favor insira um número de telefone valído';
    }
    return null;
  }

  static String dateValidator(String text) {
    var date = DateHelper.parse(text);
    var today = DateTime.now();

    if (date.isAfter(today))
      return kDateValidator;
    else
      return null;
  }
}
