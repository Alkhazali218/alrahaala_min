import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class InitNotification {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static void requestPermission() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "alrahaala-f36e1",
      "private_key_id": "19e9be7d4c64ca67f2c1edd0712850d2072e4b7c",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC/L+HWQCQcFpMG\nQKS1H0WQakEpriPDvDsRbl9IRpVjH4jCy9/QP/JQslhFfBdFCDiFa7XUwQq1AB0f\ngNE/HH8suV6pC01lig8RNhK4Vp3pNSdqkdEJ7+lGfyc9AthTk9QYZx6iDdoHDBeA\nrK4iFGTOLRVIWt2MyHpspwb25phHEOvTOFVAAuXL7oTTRBBaC/E50m3FssVZYqJf\n0CywnCtz3fQTIJbVQT7WexQVHVrNTkoaBg9haKFeJZm8syTqpHExFftz6uXOeqqc\na1RYw+o0Ia/LD7tNqnv/h4MIePxMm3Y9G5TG108hIu1xWE0j7mqqKl2aLxrKgdCM\ngKw41xzRAgMBAAECggEABijxOUOKKk3DpU+dQvDvz0kuIe04faatnkhYqXHtP6Mp\nJ1IVay65RGZ3o779mrG67PkRQ+pnmXj4Rz7htwtocVDkavTIVMuBxGWiLSZsynIW\nC9fohN4CDY18npmOLeSxIGtnpDPnLMOT6QdfSa2vqQkwsqrrUR03PROVXMyFluIH\nRH4ic1BsoYy1bELhys5RJgKE5YOEeOhLNXxpv8FX/rci4Ysu80kNJPVtj64FTEKi\neXcRdaLVcouG3TtpyEv/VeAWnuaZU+sWhAjrRBU/Ts39HnKE9ovS/6CgZdwUX4td\nvrR+hgzIqPnPLg0RV/T4YhPvXYZ2tZUmy0Jb3kVSQQKBgQD5SsWLOeJrhEVb+CCm\n+H0DeCHt3+5yQL2GcJRtL3mpDQCqL1hmylJ6P0BqKQAwIwhjcXPy6kOPtDHmGiR1\nxxXKCjQzaGY0Tt+6bH4zWTS788FdqT/1wF5XxFtqxMlPqjqmL8+XvCiQDy2BnhQt\nNh9T4qMi/CRj0vDrFCeqyqQqQQKBgQDEVNvRW4ApyBP5EceD0X4VEOe9+X5Xk3TR\n4qAFSU8YJydK0pyM8cxpzEjO5tpYTLOEN4bp2MnfkdgSE+VMfphfrsxSqnqr0DkZ\npo6n/PVrbKzccPKV0H0X3PxuKaNbDpGLmOkPusmyObSZ2/r2l3Uim/7tZOBhzrQE\nX6o6BmOukQKBgFw6U3c8xQ2t89Mgq0ParrV33mWY8SiH1xZD1EXIyKPIUbSkq3nr\n5DOh7vzXimBEtbfEo3b9QF2L9uIATfjc3KzQtZtHRniXraHUvaPVnvLiLWmvUiBj\nOQQTexa3ExtMCUKucYjbbc5OLzHDAAfx/AkW0fABhJ0Bz2vJGxvOuImBAoGAV4/1\nPelOPtQyPDp2vk63qdORV8QnWg2040rszY7FjOMhfhhyo9XPsjvfGRASv6Dty4Es\nVa1PU7vrHxzqfnRTpxEBpbjM30YNwWfsZfXGyzN74REq0DBdKkBwAP3nElxsA1Oe\nVlqbTDa6Woim5EXmgxoJ13zPKjATT4QPGrPwz1ECgYBU/kv+lFSZ+4a3yXk2bsTr\n9vo7QNGc0EARaQKCvv8N/Wd6pfKHK9pBtkATlsEDDJF7nW9kkkpck3EtKklFq22I\n4BpAl3MSZ7A85etsVk5PXJUrlpDT0N8fpPZVLqOc7w8VqXDY0k5yDgYqToCss0tZ\now4g8RC8Ee4vZRfVcRWziA==\n-----END PRIVATE KEY-----\n",
      "client_email": "alrahaala-f36e1@appspot.gserviceaccount.com",
      "client_id": "100190352873259751471",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/alrahaala-f36e1%40appspot.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    var credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );
    client.close();
    return credentials.accessToken.data;
  }
}
