import 'package:nylo_framework/nylo_framework.dart';

/* Register Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class RegisterForm extends NyFormData {
  RegisterForm({String? name}) : super(name ?? "register");

  @override
  fields() => [
        Field.text("username",
            validate: FormValidator.notEmpty(), style: "compact"),
        Field.email("email", validate: FormValidator.email(), style: "compact"),
        Field.password("password",
            validate: FormValidator.password(strength: 1), style: "compact"),
      ];
}
