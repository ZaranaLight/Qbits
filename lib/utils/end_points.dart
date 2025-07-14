class EndPoints {
  /// Live URL
  static const domain2 = "http://www.aotaisolarcloud.com/";
  static const domain = "http://www.aotaisolarcloud.com/solarweb/";

  /// Test URL
  // static const domain = "http://13.200.222.124/";
  static const baseUrl = "${domain}api/";

  /// ------------------------------------ Auth -------------------------------
  static const loginAPI = "${baseUrl}login";
  static const sendMailCodeAPIForForgotPassword = "${domain}auth/sendMailCode";
  static const queryUserByEmailAPI = "${domain}auth/queryUserByEmail";
  static const registerAPI = "${domain}user/register";
  static const individualRegisterAPI = "${domain2}ATSolarInfo/userRegister.action";

  static const sendMailCodeWithCheckAPI = "${domain}auth/sendMailCodeWithCheck";

  static const appSearchOrganizationAPI =
      "${domain}appcanxSearchOrganization.action";

  static const getPowerAttachInformationAPI =
      "${domain}user/getPlantInfoWithDate";

  static const getDeviceLibraryAPI = "${domain}library/getSummary";

  static const getPlantListAPI = "${baseUrl}plant/getByPageSize";
  static const addPlantAPI = "${domain2}ATSolarInfo/appcanxAddPlantToUser.action";
}
