/// Prompt behaviour for the Kinde authorization request.
///
/// Controls whether Kinde reuses an existing session or shows its own screen.
/// Leaving the prompt unset keeps the SDK default: [login], or [create] when
/// an invitation code is supplied.
enum KindePrompt {
  /// Always show the sign-in screen, even when a Kinde session exists.
  login('login'),

  /// Show the sign-up screen.
  create('create'),

  /// Never show a screen.
  ///
  /// Returns to the app with a code when a Kinde session exists, or with a
  /// `login_required` error when it does not.
  none('none'),

  /// Send no prompt, so Kinde decides from its own session.
  ///
  /// Signs the user in without a screen when a Kinde session exists, and shows
  /// the sign-in screen when it does not. Use this for single sign-on across
  /// apps that share a Kinde business.
  useSession(null);

  /// Creates a prompt with the value sent as the `prompt` parameter.
  const KindePrompt(this.value);

  /// The `prompt` parameter value, or null when no prompt is sent.
  final String? value;
}
