import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class GetServiceKey {
  Future<String> getServiceKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messasing',
    ];
    final servicdeAccountJson = {
      "type": "service_account",
      "project_id": "prov-3cee0",
      "private_key_id": "ea9a06bde50e99273f6b220277958cf869353045",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCstV8xb9Q5ysha\ncgLO+AWvScrbADNo2VudOwR8zoI+eQ7/h4cN3vPHlKjAZYDDBREI/K4fniWcSvwA\npS+8gwjseGAcgsfmO6Pc7bRcaFmrd3cViO44vFVfHWX2Pw4XIsqhuKYBVljCUWaW\nfXTyGJ4qfkmXE26DTAKGTBG0U9ounuhXVzBYXMh8mzGaIDMMUeIIO/w7h37yMn+o\n1lJ1+7ufeBuIwxPS/8LDJtPdhUxcRGzgDlKgJ+C+U/sASbs4E58EbD3xNIn7n2Ss\nLgs1QvV5SJ20AEUHdITzDvoQWY1TrYB/wokhnEuyrrniYyVg/RYLyWm7DPDDwWrO\nNMaIPrOLAgMBAAECggEAAObhQWDBvBvU5u54Z+ZHNGX5QA6/04P0mHDndLXaILmK\nzalp5r9ViN4eZ3mRcvNC0qp/vffpEF5puCqHH4TPWJTGzY4UqZ0y4mXsTDDGYsqb\nTINCT4M6aatHZqSjCTMfshHiZAm0ZMxNGToVGqPFMYSwsTn209nFr3Ls29HTWrHi\nd0WjJvybuUK6HPefXVmYQY0swP8ZgzJ8u6FkOKo+8oKWvvYYgvhYlfNBu8PDokm1\nwyNW6SiS64kGOSvwKJLLr71K3OLsgv2//H7OqqmTJVCxhEayTBqtZCvHQ3OKI8I6\nVfIa9S/upQlju60B6elF0A/64tJlXeGo6x3TxCzxyQKBgQDUIBpCdzVxil0aBM/u\nJZo+0mpu2bsfTuVaBe3k/ljbSwvRfR5qlCEDU1uIo0v1LiRFh7Chtm3j9SR74UZz\niIbnooJ2EbfexBRICQC8FImPI4YBrOcw1AI748g5JFqpzB/iRRV3UIhycYNTkQbW\ntQz/hh1HdjCSy+5efwM+wgKJXQKBgQDQbiuFqo2/xNnOY70A6IgO4Aw+8MhAsF0F\n5pkhwjSD0E9/8+HRlxJoGRUgHPdUnAB39W80XfErBlXxIs4JrTmMOq+d2W6eZCwS\nJ3IQhGCVt0wkpyH4uvl7O9vc1H5cQfD6c+MdgkVm8Z9JcNtgkfZk0KF4RLUZHTTJ\njnLemgeaBwKBgExIfykH1aBPMcv5jw0FWMLeyIe0pSZNKQ2GtFZ1YV77TfS4GggZ\n3QVlJLWug9JYFZMriMme4UXpEoW6Lau+nUUPm/r5xDXILcL5+dmpSQ7Ap6BSnZFh\nrKv87jQebrxBO/YTAfU2cNs3FxMmRF9SHKqHgGACkNU5oS86XeBjxKXBAoGAU8ek\n+OKYfbf7sMlIhJ/zaL9ITNhuNgpuKdwKO5abk0xdWFpIr/2gqXVDl5ftFvZp/c4K\n+Cq2sQun6fiKhzs5AZPpWXK30zUCvf1bDSaYyDVYhvcjYZ6Of6mM89P6Qs1Ctvl0\nFj1x9jIzS8rwc33YY6e07+n2PXUO7eGzbKTPX2sCgYEAnOk7Kl/H8aJm4z8BZOsA\nmrtiLXFJCwTAxchpn7puCClsJVRsA44+izsSd6u63/mfEoNw598nWXbl89mIppdQ\nuuqCenZJM56HIq4jSqZwywf1O4qi8O12QxpEeOfkSQp+6SZMyMZiIQpuaI0OSVqo\nPSI0i3kUIHykCo9OiyytLuQ=\n-----END PRIVATE KEY-----\n",
      "client_email": "prov-3cee0@appspot.gserviceaccount.com",
      "client_id": "111893264289579236892",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/prov-3cee0%40appspot.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    http.Client client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(servicdeAccountJson), scopes);
    AccessCredentials credentials =
        await obtainAccessCredentialsViaServiceAccount(
            ServiceAccountCredentials.fromJson(servicdeAccountJson),
            scopes,
            client);
    client.close();
    final accessServerKey = credentials.accessToken.data;
    print("access server key $accessServerKey");
    return credentials.accessToken.data;
  }
}
