import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/additional_params.dart';
import 'package:kinde_flutter_sdk/src/model/kinde_prompt.dart';

void main() {
  group('InternalAdditionalParameters.fromUserAdditionalParams prompt', () {
    test('leaves prompt unset when the caller sets none', () {
      final params = InternalAdditionalParameters.fromUserAdditionalParams(
        const AdditionalParameters(orgCode: 'org_1'),
      );

      expect(params.promptValues, isNull);
      expect(params.toWebParams().containsKey('prompt'), isFalse);
    });

    test('sends the caller prompt', () {
      final params = InternalAdditionalParameters.fromUserAdditionalParams(
        const AdditionalParameters(prompt: KindePrompt.none),
      );

      expect(params.toWebParams()['prompt'], 'none');
    });

    test('omits prompt for useSession', () {
      final params = InternalAdditionalParameters.fromUserAdditionalParams(
        const AdditionalParameters(
            orgCode: 'org_1', prompt: KindePrompt.useSession),
      );

      expect(params.promptValues, isNull);
      expect(params.toWebParams(), {'org_code': 'org_1'});
    });

    test('keeps the caller prompt through the user parameters round trip', () {
      final params = InternalAdditionalParameters.fromUserAdditionalParams(
        const AdditionalParameters(prompt: KindePrompt.useSession),
      );

      expect(params.toUserAdditionalParams().prompt, KindePrompt.useSession);
    });
  });

  group('AdditionalParameters JSON', () {
    test('round trips the prompt', () {
      const params = AdditionalParameters(prompt: KindePrompt.useSession);

      expect(AdditionalParameters.fromJson(params.toJson()).prompt,
          KindePrompt.useSession);
    });

    test('omits an unset prompt', () {
      expect(const AdditionalParameters().toJson().containsKey('prompt'),
          isFalse);
    });
  });
}
