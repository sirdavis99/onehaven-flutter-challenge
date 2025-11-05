import 'package:reactive_forms/reactive_forms.dart';

class FormValidation {
  /// Validate the form
  static bool isValid(FormGroup form) {
    form.forEachChild((c) => c.setErrors({}));

    form.markAllAsTouched();

    return form.valid;
  }

  /// Set errors for invalid form controls
  static void setServerErrors(FormGroup form, Map<String, dynamic> errors) {
    form.controls.forEach((key, value) {
      if (!errors.containsKey(key)) {
        // print('No error for control $key');
        return;
      } else if (value is FormArray && errors[key] is List) {
        var subErrors = errors[key] as List;
        // print('found error for control $key');
        value.controls.asMap().forEach((index, control) {
          if (subErrors.length > index) {
            // print('setting error for control $key');
            control.setErrors({subErrors[index]: true});
          }
        });
      } else {
        // print('setting error for control $key');
        value.setErrors({errors[key]: true});
      }
    });
  }
}
