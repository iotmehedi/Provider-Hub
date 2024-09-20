import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

class GetServiceKey {
  Future<String> getServiceKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "prov-3cee0",
      "private_key_id": "3da42254fc081aa9b665431ae4e01d3c889f0085",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDTqb/Am49U1N7O\nKwFMruSqJC+s4yDCVyPaSz1OiBIgEOXl+n2CWWFGFgaI3eJO7b2Ym6WEslSUPcAv\nVrL8BUb3CKB7qYvqSR5afoeTOfqQ8wehOjh2GF21lRNNRKYkiFXNh5VB/bFZWMvZ\nl/c2qB81kQFF/fJuampEJr4hpBlrH4Iwn0/NND07j5LQ8SGSsB9B0Vslu9Nvb0dZ\n3L+hd2+c+uUKdQyYUVO4Rdsiyr1DAm5gndFt2mZiPhVcKHkxMKH8K9Xr2R2oycRq\n6gaCIo84dIjOm7GpFHDOyXp6ROgaf5SS0+uILVadlJJ6p2ReCEsbxaIG+plc3kV1\naI72+G9ZAgMBAAECggEAZnxQRN3tkjk6IqBvEiaywHEiBne5MnBIA1gf+KjpAc68\nylS1tco6T9m1U0sAW5BAl6Zxh+VjD54wspsrsdyKRm3OauImxYue31lZot9VZB7Q\nqG/My92zbgsfG/Ar9A9xYEGQczH3z9evaI3s3PGdnu21rKKv4mezSYlq0VYoGpX3\nHmKBeCdVOVZFcRKUch3E7g2nkrUiuh+ZeFW60xsQxFfiLzeiv69AwCawnSpgMljX\nq13b1T1Z3LHrAMXjFGoVHMZP1MzJJlUVEpqGj0ON5Qw3JCxVZtGKgaQ60xA0wAzU\nNIboIb82zlqKlQ9haAfGtUP91Xwc29PePp8FJaUjowKBgQDryBa9kAxG6E5Bdal0\n9Bd9gZ+sI4Xt6NHKmBLdrJ8kJxuIE4KZGBTVrgYNEh/+D6fr8XRCmLhR630sS+1o\nYKM/AsqYenOEnnkawxtb/7V6AS02HaKnhn/uR4SqIslJWLVzTrQ9vaCBbKXrUmdz\nZiPchPzrMwJXH/qZjEWbgC2DiwKBgQDl0DUGqbBfGYZL0tTIHq1bUcU0K7+C8IzU\n02HPt587E4JRLmuUe2htmniod80bciiC7LYtApFEwl0FlZQL85uoXxQeVHliNHg4\n4A+NF9/egHICpaZ+MjDqK1er96Im2DRNrrvqZ5iebs+LoVvEIl60RnNutp7v9Flh\nACWSHvjlKwKBgDJU5jXVGCnS0VG78k6bBKCwGQvAEYj12ELtL6nOfbJT/taPg6N2\ntoveuD/2DIpJgUkmo/DLdR1XrcLU+nr7lh2PVPwzt5Ep2yRRXffHoE/JDIOu09f7\nKDgPYEyJXHqhyyowNN2xKyA1tz2Cu76woRsj8HGs0+URWIeKoBlPxWd9AoGBAIRv\nOs+PJDN5mxnA8pwsiYxRkApjl6aWhyHyerBgSeOad4Pe82IKyAA5f4TeHRXO8Kea\nT9WaYCq2szKPo1RL24zo1cgwuA6u3AUyoeOWOY2YiZsa6NpahDO+LHTObORjvahy\npJoNfzb19qapox9hCyBqZQUNOoRfVM6AbiZJsPcnAoGAXm2L6L4c1jFqbXJGaM1/\nGdTZ7omBvpu8uwtGbUbGqxngg/o8Qxh+ndsTvIy46qVJyp6qGQve96sNnuhphIir\n0fVU+etIfLZ80LkO9ZtFVv+Uqgpl2cs/OPfIP2AyMQHVr1cusM0KrSr9nOr4LBHH\nVv1Pz38IkfEHP9GqylX0srI=\n-----END PRIVATE KEY-----\n",
      "client_email": "providerhub@prov-3cee0.iam.gserviceaccount.com",
      "client_id": "118057618971409608282",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/providerhub%40prov-3cee0.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    var credentials =
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson);

    var client = await auth.clientViaServiceAccount(credentials, scopes);
    var accessToken = client.credentials.accessToken;

    print("Access Token: ${accessToken.data}");

    client.close();
    return accessToken.data;
  }

  serverKey() async {
    final String serverkey = await getServiceKeyToken();
    print("This is serverkey: $serverkey");
  }
}
