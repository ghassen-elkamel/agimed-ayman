const String appName = "AGRIMED";
//URL ENV
const String protocol = String.fromEnvironment('PROTOCOL');
const String host = String.fromEnvironment('HOST');
final int? port = int.tryParse(const String.fromEnvironment('PORT').toString());
const String apiPrefix = "/api";

//PHOTOS ENV
final String hostUploadPhoto =
    "$protocol://$host${port == null ? "" : ":$port"}$apiPrefix";

const String uploads = "uploads";

final String hostUploadPhotoProfile =
    "$hostUploadPhoto/v1/users/uploads/profiles";
final String hostPhoto = "$hostUploadPhoto/public/image/";

final String hostUploadGalleryPhoto = "$hostUploadPhoto/v1/gallery/photo";
final String hostUploadGalleryVideo = "$hostUploadPhoto/v1/gallery/video";
final String hostUploadMealPicturePhoto =
    "$hostUploadPhoto/v1/meal-picture/photo";
final String hostUploadEventPicturePhoto =
    "$hostUploadPhoto/v1/event-picture/photo";
final String hostUploadPhotoNews = "$hostUploadPhoto/v1/news/photo";
final String hostUploadPhotoTodayActivity =
    "$hostUploadPhoto/v1/today-activity/photo";

const Duration timeoutDuration = Duration(seconds: 30);

//Local Storage
const String storageGlobalKey = appName;
const String storageAccessUserKey = "accessUser";
const String storageLocaleKey = "locale";
const String storageClassKey = "class";

const double appBarHeight = 150;
const String stripePublishableKey =
    "pk_test_51NNBjbItp882xOIgPx2g4BrTQymvsP9r4NYY6U0315ucGZzXOKPpQSteWnzjRioLwBRRk3kq4Ax5dr8bVnQsBk7300k5EtV5U0";
const String termsOfUseUrl =
    "https://policy.mypartner-isc.com/digikids-terms-service";

const videoExtensions = [
  ".mp4",
  ".mov",
  ".avi",
  ".flv",
  ".wmv",
  ".3gp",
  ".mkv",
  ".webm",
  ".mpg",
  ".mpeg",
  ".m4v",
  ".m4p",
  ".m4b",
  ".m4r",
  ".m4a",
  ".m4v",
  ".mp4v",
  ".mpg",
  ".mp2",
  ".mp2v",
  ".mpv2",
  ".mpv"
];
//Currency
const String currencyAbbreviation = "TND";
const int currencyDecimals = 3;
