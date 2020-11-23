#### 验证签名有效性
```
➜ codesign -v Firefox.app

➜ codesign -v Surge.app
Surge.app: code object is not signed at all
In architecture: x86_64
```
#### 查看签名信息
```
➜ codesign -d -vv Surge
Executable=/Applications/Surge.app/Contents/MacOS/Surge
Identifier=com.nssurge.surge-mac
Format=app bundle with Mach-O thin (x86_64)
CodeDirectory v=20200 size=26805 flags=0x0(none) hashes=830+5 location=embedded
Signature size=4693
Authority=Developer ID Application: Yachen Liu (4F4J3526UU)
Authority=Developer ID Certification Authority
Authority=Apple Root CA
Signed Time=Nov 16, 2018 at 6:23:31 PM
Info.plist entries=35
TeamIdentifier=4F4J3526UU
Sealed Resources version=2 rules=13 files=78
Internal requirements count=1 size=216
```

#### 移除签名信息
```
➜ codesign --remove-signature Surge

➜ codesign -d -vv Surge
Surge: code object is not signed at all
```

#### 签名库文件夹
```
➜ codesign -f -s "ID" --entitlements entitlements.plist example.app/Frameworks/*.framework

"ID"：security find-identity -v -p codesigning
```
#### 签名动态库文件
```
codesign -f -s "ID" example.app/*.dylib

"ID"：security find-identity -v -p codesigning
```
#### 软件封包签名
```
codesign -f -s "ID" --entitlements entitlements.plist example.app

"ID"：security find-identity -v -p codesigning
```
#### 导出签名信息
```
➜ codesign -d --extract-certificates /Applications/Firefox.app

➜ ls
codesign0 codesign1 codesign2

➜ openssl x509 -inform der -in codesign0 -text
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 488521955867797808 (0x6c794216c7aa930)
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN=Developer ID Certification Authority, OU=Apple Certification Authority, O=Apple Inc., C=US
        Validity
            Not Before: May  8 19:08:58 2017 GMT
            Not After : May  9 19:08:58 2022 GMT
        Subject: UID=43AQ936H96, CN=Developer ID Application: Mozilla Corporation (43AQ936H96), OU=43AQ936H96, O=Mozilla Corporation, C=US
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:c5:4d:d0:f4:97:a1:39:81:6f:d2:10:54:e0:2a:
                    17:c3:7c:cf:98:e1:76:78:84:04:02:aa:78:4b:a3:
                    16:94:97:76:37:b2:6a:f2:ca:e6:82:22:3f:44:bd:
                    8b:a2:54:ee:75:ab:b9:b9:66:4e:25:72:7b:84:f7:
                    ec:e5:d7:6e:f1:85:09:d8:84:cc:bd:c7:8e:af:15:
                    dc:14:09:64:9c:e9:94:b8:7f:07:ea:22:09:0d:c8:
                    e1:dd:72:9d:f4:c0:2c:fa:6a:32:42:50:32:8b:87:
                    85:16:05:97:26:75:6d:fe:b9:17:72:ff:c0:0f:3a:
                    70:b2:c6:27:f4:01:0c:0a:05:74:18:c5:0c:e8:d6:
                    5d:6c:16:f0:e9:7d:79:00:fe:b9:0c:67:86:5a:fb:
                    aa:27:9b:8d:00:5f:f5:ed:90:34:c7:24:db:4e:19:
                    77:67:b5:a8:2f:82:a8:ad:4c:b1:ff:e1:a4:bf:46:
                    44:59:d2:0c:5a:74:9d:0d:02:62:eb:ff:76:50:42:
                    87:07:12:d7:89:c0:74:0c:6e:dc:74:97:4f:2c:c0:
                    71:e0:0e:53:50:b3:bf:dd:65:1d:4e:69:a5:a7:94:
                    5e:06:c8:fc:43:c8:ca:52:16:90:23:17:03:68:e2:
                    70:e2:de:a4:26:b1:a8:aa:d6:07:fd:8f:d8:b2:69:
                    58:a5
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            Authority Information Access:
                OCSP - URI:http://ocsp.apple.com/ocsp-devid01

            X509v3 Subject Key Identifier:
                12:99:5F:DF:38:62:15:CF:F7:B8:C4:44:56:9C:07:41:08:96:F3:61
            X509v3 Basic Constraints: critical
                CA:FALSE
            X509v3 Authority Key Identifier:
                keyid:57:17:ED:A2:CF:DC:7C:98:A1:10:E0:FC:BE:87:2D:2C:F2:E3:17:54

            X509v3 Certificate Policies:
                Policy: 1.2.840.113635.100.5.1
                  CPS: http://www.apple.com/appleca
                  User Notice:
                    Explicit Text: Reliance on this certificate by any party assumes acceptance of the then applicable standard terms and conditions of use, certificate policy and certification practice statements.

            X509v3 Key Usage: critical
                Digital Signature
            X509v3 Extended Key Usage: critical
                Code Signing
            1.2.840.113635.100.6.1.13: critical
                ..
    Signature Algorithm: sha256WithRSAEncryption
         71:4b:a3:45:67:b9:fb:1b:23:6d:96:59:d3:dc:9e:57:7d:2d:
         15:5c:17:15:c9:7b:cc:35:3b:50:bf:ae:32:3e:b9:49:97:0c:
         5d:ef:61:a1:b1:af:46:11:f1:08:5b:a1:ec:c3:67:85:50:b8:
         df:51:f8:b2:42:d2:b6:a4:4d:db:6f:7f:cb:11:48:e9:c6:eb:
         7c:6a:01:43:e4:9c:13:0f:7c:4b:5e:00:4b:ac:10:50:19:e7:
         ee:98:27:72:34:a1:5f:84:4e:05:df:90:58:77:f6:52:78:af:
         55:cb:2a:cc:8b:54:9a:5c:95:cc:7a:15:1f:9e:73:7f:35:bc:
         10:93:6d:58:27:72:5b:57:55:69:35:41:9f:18:f5:aa:bb:f0:
         87:29:43:03:e1:8f:44:50:7d:26:3c:a6:6d:92:f4:5d:34:ce:
         47:f4:d5:d5:1c:2e:c4:4d:89:7e:34:c2:a5:10:f8:6c:c8:0e:
         96:ec:4f:fb:54:57:c2:69:31:b2:e3:a9:4d:c8:77:e0:f6:ad:
         af:d9:de:89:9e:54:dd:a3:c3:9a:ce:e2:50:9f:71:5d:59:b2:
         98:8d:a8:f2:a3:12:8a:2e:26:15:7b:6a:05:64:24:89:50:4b:
         01:6b:b9:0a:76:22:3b:8d:ee:71:d2:0a:26:e4:79:a7:a8:d4:
         6a:6c:98:35
-----BEGIN CERTIFICATE-----
MIIFgDCCBGigAwIBAgIIBseUIWx6qTAwDQYJKoZIhvcNAQELBQAweTEtMCsGA1UE
AwwkRGV2ZWxvcGVyIElEIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MSYwJAYDVQQL
DB1BcHBsZSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTETMBEGA1UECgwKQXBwbGUg
SW5jLjELMAkGA1UEBhMCVVMwHhcNMTcwNTA4MTkwODU4WhcNMjIwNTA5MTkwODU4
WjCBoTEaMBgGCgmSJomT8ixkAQEMCjQzQVE5MzZIOTYxQzBBBgNVBAMMOkRldmVs
b3BlciBJRCBBcHBsaWNhdGlvbjogTW96aWxsYSBDb3Jwb3JhdGlvbiAoNDNBUTkz
Nkg5NikxEzARBgNVBAsMCjQzQVE5MzZIOTYxHDAaBgNVBAoME01vemlsbGEgQ29y
cG9yYXRpb24xCzAJBgNVBAYTAlVTMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAxU3Q9JehOYFv0hBU4CoXw3zPmOF2eIQEAqp4S6MWlJd2N7Jq8srmgiI/
RL2LolTudau5uWZOJXJ7hPfs5ddu8YUJ2ITMvceOrxXcFAlknOmUuH8H6iIJDcjh
3XKd9MAs+moyQlAyi4eFFgWXJnVt/rkXcv/ADzpwssYn9AEMCgV0GMUM6NZdbBbw
6X15AP65DGeGWvuqJ5uNAF/17ZA0xyTbThl3Z7WoL4KorUyx/+Gkv0ZEWdIMWnSd
DQJi6/92UEKHBxLXicB0DG7cdJdPLMBx4A5TULO/3WUdTmmlp5ReBsj8Q8jKUhaQ
IxcDaOJw4t6kJrGoqtYH/Y/YsmlYpQIDAQABo4IB4TCCAd0wPgYIKwYBBQUHAQEE
MjAwMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcC5hcHBsZS5jb20vb2NzcC1kZXZp
ZDAxMB0GA1UdDgQWBBQSmV/fOGIVz/e4xERWnAdBCJbzYTAMBgNVHRMBAf8EAjAA
MB8GA1UdIwQYMBaAFFcX7aLP3HyYoRDg/L6HLSzy4xdUMIIBDgYDVR0gBIIBBTCC
AQEwgf4GCSqGSIb3Y2QFATCB8DAoBggrBgEFBQcCARYcaHR0cDovL3d3dy5hcHBs
ZS5jb20vYXBwbGVjYTCBwwYIKwYBBQUHAgIwgbYMgbNSZWxpYW5jZSBvbiB0aGlz
IGNlcnRpZmljYXRlIGJ5IGFueSBwYXJ0eSBhc3N1bWVzIGFjY2VwdGFuY2Ugb2Yg
dGhlIHRoZW4gYXBwbGljYWJsZSBzdGFuZGFyZCB0ZXJtcyBhbmQgY29uZGl0aW9u
cyBvZiB1c2UsIGNlcnRpZmljYXRlIHBvbGljeSBhbmQgY2VydGlmaWNhdGlvbiBw
cmFjdGljZSBzdGF0ZW1lbnRzLjAOBgNVHQ8BAf8EBAMCB4AwFgYDVR0lAQH/BAww
CgYIKwYBBQUHAwMwEwYKKoZIhvdjZAYBDQEB/wQCBQAwDQYJKoZIhvcNAQELBQAD
ggEBAHFLo0VnufsbI22WWdPcnld9LRVcFxXJe8w1O1C/rjI+uUmXDF3vYaGxr0YR
8QhboezDZ4VQuN9R+LJC0rakTdtvf8sRSOnG63xqAUPknBMPfEteAEusEFAZ5+6Y
J3I0oV+ETgXfkFh39lJ4r1XLKsyLVJpclcx6FR+ec381vBCTbVgncltXVWk1QZ8Y
9aq78IcpQwPhj0RQfSY8pm2S9F00zkf01dUcLsRNiX40wqUQ+GzIDpbsT/tUV8Jp
MbLjqU3Id+D2ra/Z3omeVN2jw5rO4lCfcV1ZspiNqPKjEoouJhV7agVkJIlQSwFr
uQp2IjuN7nHSCibkeaeo1GpsmDU=
-----END CERTIFICATE-----
```