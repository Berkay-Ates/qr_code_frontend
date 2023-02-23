class ApplicationConstants {
  static const langAssetPath = 'asset/lang';
  static const EmailRegex = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
  static const QR_SAVE_URL = 'https://qr-code-gen.onrender.com/api/v1/qr/saveQRCode';
  static const QR_DELETE_URL = 'https://qr-code-gen.onrender.com/api/v1/qr/';
  static const REGISTER_USER_URL = 'https://qr-code-gen.onrender.com/api/v1/auth/register';
  static const LOGIN_USER_URL = 'https://qr-code-gen.onrender.com/api/v1/auth/login';
  static const USER_ALL_QR_CODES = 'https://qr-code-gen.onrender.com/api/v1/qr/getAllQRCode';
  static const USER_ALL_SCANNED_QR_CODES = 'https://qr-code-gen.onrender.com/api/v1/qr/getAllScannedQRCode';
  static const USER_ALL_GENERATED_QR_CODES = 'https://qr-code-gen.onrender.com/api/v1/qr/getAllGeneratedQRCode';
  static const FIREBASE_BASE_URL = "https://firebasestorage.googleapis.com/v0/b/clash-cards-77641.appspot.com/o";
}
