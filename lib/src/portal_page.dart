/// Portal page navigation options for Kinde's management portal
enum PortalPage {
  /// Organization details page
  organizationDetails('organization_details'),

  /// Organization members page
  organizationMembers('organization_members'),

  /// Organization plan details page
  organizationPlanDetails('organization_plan_details'),

  /// Organization payment details page
  organizationPaymentDetails('organization_payment_details'),

  /// Organization plan selection page
  organizationPlanSelection('organization_plan_selection'),

  /// Payment details page
  paymentDetails('payment_details'),

  /// Plan selection page
  planSelection('plan_selection'),

  /// Plan details page
  planDetails('plan_details'),

  /// Profile page (default)
  profile('profile');

  const PortalPage(this.value);

  /// The string value to be used in URL parameters
  final String value;
}
