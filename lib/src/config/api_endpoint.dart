// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoint {
  static String SHOUT_API_KEY = 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5';
  static String KYC_API_KEY = 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5';
  static String CTS_API_KEY = 'ZWR1Y2l0aW9uQ1RTMTIzNDU2Nzg5';
  static String NRBG_API_KEY = 'ZWR1Y2l0aW9uTlJCRzEyMzQ1Njc4OQ==';

  static String WFC_APP_CODE = 'WFC';
  static String SHOUT_APP_CODE = 'SHOUT';
  static String SURVEY_APP_CODE = 'SURVEY';

  static String getTransportOrderUrl() {
    return '${dotenv.env['BASE_URL_WFC']}/v1/transport-order';
  }

  static String getShoutIncidentByUsernameUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/get_shout_incident_by_username';
  }

  static String getFileCount() {
    return '${dotenv.env['BASE_URL_WFC']}/v1/file-count/get';
  }

  static String getMyAgencyTeamUrl() {
    return '${dotenv.env['BASE_URL_KYC']}/get_my_agency_team';
  }

  static String getMyAgencyTeamAllUrl() {
    return '${dotenv.env['BASE_URL_KYC']}/get_my_agency_team_all';
  }

  static String getUserAttachmentByFileCategoryUrl() {
    return '${dotenv.env['BASE_URL_KYC']}/get_user_attachment_by_file_category';
  }

  // static String getUserAttachmentByFileCategoryUrl2() {
  //   return 'thecitizen.support:9001/get_user_attachment_by_file_category';
  // }

  static String srcUserUrl() {
    return '${dotenv.env['BASE_URL_KYC']}/search_user';
  }

  static String getAgencyUrl() {
    return '${dotenv.env['BASE_URL_KYC']}/search_agency';
  }

  static String getLeaveTypeUrl() {
    return '${dotenv.env['BASE_URL_WFC']}/get_leave_type';
  }

  static String getContactPerson() {
    return '${dotenv.env['BASE_URL_KYC']}/search_agency_officers';
  }

  static String getLeaveBalance() {
    return '${dotenv.env['BASE_URL_KYC']}/get_leave_balance';
  }

  static String getShoutIncidentFileByIdAndSequenceUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/get_shout_incident_file_by_id_and_sequence';
  }

  static String getLocationTracesUrl() {
    return '${dotenv.env['BASE_URL_LOG']}/v2/get_latlng_by_username_and_date_and_time_duration';
  }

  static String submitLeaveApplicationUrl() {
    return '${dotenv.env['BASE_URL_WFC']}/add_tm_leave_application';
  }

  static String getShoutCategoryRequestUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/v1/shout_categories_request/get';
  }

  static String addShoutCategoryUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/v1/shout_categories_request/add';
  }

  static String getShoutSubCategoryRequestUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/v1/shout_subcategories_request/get';
  }

  static String addShoutSubCategoryUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/v1/shout_subcategories_request/add';
  }

  static String getShoutCategorySubCategoryRequestUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/get_suggested_shout_categories_or_types_by_status_and_username';
  }

  static String rateShoutIncidentUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/rate_shout_incident';
  }

  static String getUpdateFulfillmentStatusUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/update_fulfillment_status';
  }

  static String getShoutIncidentByAgencyAndUnitAndLocationUrl() {
    return '${dotenv.env['BASE_URL_SHOUT']}/get_shout_incidents_by_agency_and_unit_and_location';
  }

  static String getUnitsByUsernameUrl() {
    return '${dotenv.env['BASE_URL_KYC']}/get_units_by_username';
  }

  static String getLocationByUsernameUrl() {
    return '${dotenv.env['BASE_URL_KYC']}/get_locations_by_agency_id';
  }
}
