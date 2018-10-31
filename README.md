# ebx-javaweb-saml

## requirement

download and setup https://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html

unzip and read the readme.txt

## build

mvn clean install

## distribution

cp target/saml-0.0.2-SNAPSHOT.war ../tomcat-saml/saml.war
cp target/saml-0.0.2-SNAPSHOT.war ../tomcat-saml-ebx/saml.war
