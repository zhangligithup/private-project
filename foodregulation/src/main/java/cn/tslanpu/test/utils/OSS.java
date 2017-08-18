package cn.tslanpu.test.utils;

import com.aliyun.oss.OSSClient;

public class OSS {
	
	// endpoint以杭州为例，其它region请按实际情况填写
	private static String endpoint = "http://oss-cn-beijing.aliyuncs.com";
	// accessKey请登录https://ak-console.aliyun.com/#/查看
	private static String accessKeyId = "LTAI7UkvyE4cer1Y";
	
	private static String accessKeySecret = "RxwNzz9q7ErVOEmG8TXtisBHHozVdt";
	
	public static String bucketName = "lanpubucket1";
	// 创建OSSClient实例
	public static OSSClient getOssClient(){
		return new OSSClient(endpoint, accessKeyId, accessKeySecret);
	}
	
	
}
	