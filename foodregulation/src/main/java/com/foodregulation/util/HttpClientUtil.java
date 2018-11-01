package com.foodregulation.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.core.io.Resource;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.TrustSelfSignedStrategy;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;

import javax.net.ssl.SSLContext;
import java.io.File;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * HTTP工具类
 * 
 * @author ZhangLi
 *
 */
public class HttpClientUtil {

	private static HttpClient httpClient = null;

	// get请求
	public static String doGet(String url, Map<String, String> map, String charset)
			throws ClientProtocolException, IOException {
		if (httpClient == null) {
			httpClient = HttpClients.createDefault();
		}
		// 1.发送短信测试
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		Iterator iterator = map.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, String> elem = (Entry<String, String>) iterator.next();
			params.add(new BasicNameValuePair(elem.getKey(), elem.getValue()));
		}
		url = url + URLEncodedUtils.format(params, charset);
		HttpGet httpget = new HttpGet(url);
		HttpResponse response = httpClient.execute(httpget);
		HttpEntity httpEntity = response.getEntity();
		String strResult = EntityUtils.toString(httpEntity, charset);
		httpget.abort();
		return strResult;
	}

	// post请求
	public static String doPost(String url, Map<String, String> map, String charset, String token) {
		if (httpClient == null) {
			httpClient = HttpClients.createDefault();
		}
		HttpPost httpPost = null;
		String result = "";
		try {
			httpPost = new HttpPost(url);
			// 设置参数
			List<NameValuePair> list = new ArrayList<NameValuePair>();
			if (map != null) {
				Iterator iterator = map.entrySet().iterator();
				while (iterator.hasNext()) {
					Entry<String, String> elem = (Entry<String, String>) iterator.next();
					list.add(new BasicNameValuePair(elem.getKey(), elem.getValue()));
				}
			}
			if (list.size() > 0) {
				UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list, charset);
				httpPost.setEntity(entity);
			}
			if (StringUtils.isNotBlank(token)) {
				httpPost.setHeader("token", token);
			}
			HttpResponse response = httpClient.execute(httpPost);
			if (response != null) {
				HttpEntity resEntity = response.getEntity();
				if (resEntity != null) {
					result = EntityUtils.toString(resEntity, charset);
				}
			}
		} catch (Exception ex) {
			httpPost.abort();
			ex.printStackTrace();
		}
		return result;
	}

	//  使用POST方法发送XML数据  
	public static String sendXMLDataByPost(String url, String xmlData) throws Exception {
		if (httpClient == null) {
			httpClient = HttpClients.createDefault();
		}
		HttpPost httpPost = new HttpPost(url);
		StringEntity stringEntity = new StringEntity(xmlData, "UTF-8");
		httpPost.setEntity(stringEntity);
		httpPost.setHeader("Content-Type", "text/xml;charset=UTF-8");
		HttpResponse response = httpClient.execute(httpPost);
		HttpEntity entity = response.getEntity();
		String result = EntityUtils.toString(entity, "UTF-8");
		httpPost.abort();
		return result;
	}

	/**
	 * 发送带证书的xml post求情  保证证书放在和此类同一目录
	 * 
	 * @return
	 * @throws IOException
	 * @throws CertificateException
	 * @throws NoSuchAlgorithmException
	 * @throws KeyStoreException
	 * @throws UnrecoverableKeyException
	 * @throws KeyManagementException
	 */
	public static String sendCertDataPost(String url, Resource certResource, String cerPassword, String xmlData)
			throws NoSuchAlgorithmException, CertificateException, KeyStoreException, KeyManagementException, UnrecoverableKeyException, IOException {
		KeyStore keyStore = KeyStore.getInstance("PKCS12");
		InputStream inputStream = null;
		try {
			inputStream = certResource.getInputStream();
			keyStore.load(inputStream, cerPassword.toCharArray());
		} catch (IOException e) {
			throw e;
		}finally {
			if(inputStream != null){
				inputStream.close();
			}
		}
		SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore,cerPassword.toCharArray()).build();
		SSLConnectionSocketFactory sslConnectionSocketFactory = new SSLConnectionSocketFactory(sslcontext,
				new String[] { "TLSv1" }, null, SSLConnectionSocketFactory.getDefaultHostnameVerifier());
		CloseableHttpClient httpclientTemp = HttpClients.custom().setSSLSocketFactory(sslConnectionSocketFactory).build();

		try {

			HttpPost httpPost = new HttpPost(url);
			StringEntity stringEntity = new StringEntity(xmlData, "UTF-8");
			httpPost.setEntity(stringEntity);
			httpPost.setHeader("Content-Type", "text/xml;charset=UTF-8");
			HttpResponse response = httpclientTemp.execute(httpPost);
			HttpEntity entity = response.getEntity();
			String result = EntityUtils.toString(entity, "UTF-8");
			httpPost.abort();
			return result;
		} finally {
			httpclientTemp.close();
		}
	}

	public static void main(String[] args) {
		String xmlx = "哈哈哈";
		String xml = "<xml>" + "<appid><![CDATA[wx2421b1c4370ec43b]]></appid>" + "<attach><![CDATA[支付测试]]></attach>"
				+ "<bank_type><![CDATA[CFT]]></bank_type>" + "<fee_type><![CDATA[CNY]]></fee_type>"
				+ "<is_subscribe><![CDATA[Y]]></is_subscribe>" + "<mch_id><![CDATA[10000100]]></mch_id>"
				+ "<nonce_str><![CDATA[5d2b6c2a8db53831f7eda20af46e531c]]></nonce_str>"
				+ "<openid><![CDATA[oUpF8uMEb4qRXf22hE3X68TekukE]]></openid>"
				+ "<out_trade_no><![CDATA[1409811653]]></out_trade_no>"
				+ "<result_code><![CDATA[SUCCESS]]></result_code>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
				+ "<sign><![CDATA[B552ED6B279343CB493C5DD0D78AB241]]></sign>"
				+ "<sub_mch_id><![CDATA[10000100]]></sub_mch_id>" + "<time_end><![CDATA[20140903131540]]></time_end>"
				+ "<total_fee>1</total_fee><coupon_fee><![CDATA[10]]></coupon_fee>"
				+ "<coupon_count><![CDATA[1]]></coupon_count>" + "<coupon_type><![CDATA[CASH]]></coupon_type>"
				+ "<coupon_id><![CDATA[10000]]></coupon_id>" + "<coupon_fee><![CDATA[100]]></coupon_fee>"
				+ "<trade_type><![CDATA[JSAPI]]></trade_type>"
				+ "<transaction_id><![CDATA[1004400740201409030005092168]]></transaction_id>" + "</xml>";
		try {
			sendXMLDataByPost("http://localhost:8080/juyi-web-client/pay/weixinpayNotity.do", xml);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
