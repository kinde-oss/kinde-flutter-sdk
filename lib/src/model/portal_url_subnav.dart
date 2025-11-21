/// The area of the portal you want the user to land on
enum PortalUrlSubnav {
  profile('profile'),
  organizationDetails('organization_details'),
  organizationPaymentDetails('organization_payment_details'),
  organizationPlanSelection('organization_plan_selection'),
  paymentDetails('payment_details'),
  planDetails('plan_details'),
  planSelection('plan_selection');

  const PortalUrlSubnav(this.value);

  /// The value to be used in URL parameters
  final String value;
}
