class EndPoints {
  /// Live URL
  static const domain = "http://www.aotaisolarcloud.com/solarweb/";

  /// Test URL
  // static const domain = "http://13.200.222.124/";
  static const baseUrl = "${domain}api/";

  /// ------------------------------------ Auth -------------------------------
  static const loginAPI = "${baseUrl}login";
  static const sendMailCodeAPIForForgotPassword = "${domain}auth/sendMailCode";
  static const queryUserByEmailAPI = "${domain}auth/queryUserByEmail";
  static const registerAPI = "${domain}user/register";
  static const sendMailCodeWithCheckAPI = "${domain}auth/sendMailCodeWithCheck";

  static const appSearchOrganizationAPI =
      "${domain}appcanxSearchOrganization.action";

  static const getPowerAttachInformationAPI =
      "${domain}user/getPlantInfoWithDate";

  static const getDeviceLibraryAPI = "${domain}library/getSummary";

  static const getPlantListAPI =
      "${baseUrl}plant/getByPageSize?page=0&date=2025-07&pageSize=20";
}
