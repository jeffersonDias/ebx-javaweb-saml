package com.on.ps.security.saml;

import org.opensaml.Configuration;
import org.opensaml.xml.security.BasicSecurityConfiguration;
import org.opensaml.xml.signature.SignatureConstants;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.security.saml.SAMLBootstrap;

public final class CustomSAMLBootstrap extends SAMLBootstrap {
	
	private String signatureAlgorithmURI;
	private String signatureReferenceDigestMethod;
	
	@Override
	public void postProcessBeanFactory(final ConfigurableListableBeanFactory beanFactory) throws BeansException {
		super.postProcessBeanFactory(beanFactory);
		final BasicSecurityConfiguration config = (BasicSecurityConfiguration) Configuration.getGlobalSecurityConfiguration();
		
		//config.registerSignatureAlgorithmURI("RSA", SignatureConstants.ALGO_ID_SIGNATURE_RSA_SHA256);
		//config.setSignatureReferenceDigestMethod(SignatureConstants.ALGO_ID_DIGEST_SHA256);
		
		config.registerSignatureAlgorithmURI("RSA", signatureAlgorithmURI);
		config.setSignatureReferenceDigestMethod(signatureReferenceDigestMethod);
		
	}

	public String getSignatureAlgorithmURI() {
		return signatureAlgorithmURI;
	}
	
	public String getSignatureReferenceDigestMethod() {
		return signatureReferenceDigestMethod;
	}
	
	public void setSignatureAlgorithmURI(String signatureAlgorithmURI) {
		this.signatureAlgorithmURI = signatureAlgorithmURI;
	}
	
	public void setSignatureReferenceDigestMethod(String signatureReferenceDigestMethod) {
		this.signatureReferenceDigestMethod = signatureReferenceDigestMethod;
	}
	
	public final static void main(final String[] args) {
		final String[] digests = new String [] {
				SignatureConstants.ALGO_ID_DIGEST_NOT_RECOMMENDED_MD5,
				SignatureConstants.ALGO_ID_DIGEST_RIPEMD160,
				SignatureConstants.ALGO_ID_DIGEST_SHA1,
				SignatureConstants.ALGO_ID_DIGEST_SHA256,
				SignatureConstants.ALGO_ID_DIGEST_SHA384,
				SignatureConstants.ALGO_ID_DIGEST_SHA512
		};
		final String[] signatures = new String [] {
				SignatureConstants.ALGO_ID_SIGNATURE_DSA,
				SignatureConstants.ALGO_ID_SIGNATURE_DSA_SHA1,
				SignatureConstants.ALGO_ID_SIGNATURE_ECDSA_SHA1,
				SignatureConstants.ALGO_ID_SIGNATURE_ECDSA_SHA256,
				SignatureConstants.ALGO_ID_SIGNATURE_ECDSA_SHA384,
				SignatureConstants.ALGO_ID_SIGNATURE_ECDSA_SHA512,
				SignatureConstants.ALGO_ID_SIGNATURE_NOT_RECOMMENDED_RSA_MD5,
				SignatureConstants.ALGO_ID_SIGNATURE_RSA,
				SignatureConstants.ALGO_ID_SIGNATURE_RSA_RIPEMD160,
				SignatureConstants.ALGO_ID_SIGNATURE_RSA_SHA1,
				SignatureConstants.ALGO_ID_SIGNATURE_RSA_SHA256,
				SignatureConstants.ALGO_ID_SIGNATURE_RSA_SHA384,
				SignatureConstants.ALGO_ID_SIGNATURE_RSA_SHA512
		};
		
		System.out.println("=== Supported Digests ===");
		for (final String digest : digests) {
			System.out.println(digest);
		}
		
		System.out.println("=== Supported Signatures ===");
		for (final String signature : signatures) {
			System.out.println(signature);
		}
		
	}
	
}
