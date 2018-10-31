# ebx-javaweb-saml

## requirement

download and setup https://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html

unzip and read the readme.txt

## build

mvn clean install

## distribution

cp target/saml-0.0.3-SNAPSHOT.war ../tomcat-saml/saml.war && cp target/saml-0.0.3-SNAPSHOT.war ../tomcat-saml-ebx/saml.war

## References

valid values for 'signatureAlgorithmURI'

```
=== Supported Signatures ===
http://www.w3.org/2000/09/xmldsig#dsa-sha1
http://www.w3.org/2000/09/xmldsig#dsa-sha1
http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha1
http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256
http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384
http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512
http://www.w3.org/2001/04/xmldsig-more#rsa-md5
http://www.w3.org/2000/09/xmldsig#rsa-sha1
http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160
http://www.w3.org/2000/09/xmldsig#rsa-sha1
http://www.w3.org/2001/04/xmldsig-more#rsa-sha256
http://www.w3.org/2001/04/xmldsig-more#rsa-sha384
http://www.w3.org/2001/04/xmldsig-more#rsa-sha512
```

valid values for 'signatureReferenceDigestMethod'

```
=== Supported Digests ===
http://www.w3.org/2001/04/xmldsig-more#md5
http://www.w3.org/2001/04/xmlenc#ripemd160
http://www.w3.org/2000/09/xmldsig#sha1
http://www.w3.org/2001/04/xmlenc#sha256
http://www.w3.org/2001/04/xmldsig-more#sha384
http://www.w3.org/2001/04/xmlenc#sha512
```
