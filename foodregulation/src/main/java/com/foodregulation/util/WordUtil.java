package com.foodregulation.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.aliyun.oss.OSSClient;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;

import cn.tslanpu.test.utils.OSS;
import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateNotFoundException;

public class WordUtil {
	/**
	 * 根据模版和map生成word文档
	 * 
	 * @param dataMap
	 * @param templateName
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 * @throws MalformedTemplateNameException
	 * @throws TemplateNotFoundException
	 */
	public static File createDoc(Map<?, ?> dataMap, int type)
			throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IOException {
		String name = "temp.doc";
		switch (type) {
		case 0:
			name = "现场检查笔录.doc";
			break;
		case 1:
			name = "监督检查意见书.doc";
			break;
		case 2:
			name = "责令整改通知书.doc";
			break;
		}
		String templateName = "temp.ftl";
		switch (type) {
		case 0:
			templateName = "muban1.ftl";
			break;
		case 1:
			templateName = "muban2.ftl";
			break;
		case 2:
			templateName = "muban3.ftl";
			break;
		}
		File f = new File(name);
		Configuration configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");
		configuration.setClassForTemplateLoading(WordUtil.class, "/com/foodregulation/util");
		Template t = configuration.getTemplate(templateName);
		try {
			// 这个地方不能使用FileWriter因为需要指定编码类型否则生成的Word文档会因为有无法识别的编码而无法打开
			Writer w = new OutputStreamWriter(new FileOutputStream(f), "utf-8");
			t.process(dataMap, w);
			w.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(ex);
		}
		return f;
	}


	/**
	 * 生成pdf并保存到oss
	 * @param dataMap
	 * @param sourcePdfUrl
	 * @return
	 * @throws IOException
	 * @throws DocumentException
	 */
	public static String getPdfAndUpload(Map<String, Object> dataMap,String sourcePdfUrl) throws IOException, DocumentException {
		sourcePdfUrl = "/com/foodregulation/util/"+sourcePdfUrl;
		PdfReader reader = new PdfReader(sourcePdfUrl);
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		/* 将要生成的目标PDF文件名称 */
		PdfStamper ps = new PdfStamper(reader, bos);
		PdfContentByte under = ps.getUnderContent(1);

		/* 使用中文字体 */
		BaseFont bf = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		ArrayList<BaseFont> fontList = new ArrayList<BaseFont>();
		fontList.add(bf);

		/* 取出报表模板中的所有字段 */
		AcroFields fields = ps.getAcroFields();
		fields.setSubstitutionFonts(fontList);
		fillData(fields, dataMap);

		/* 必须要调用这个，否则文档不会生成的 */
		ps.setFormFlattening(true);
		ps.close();
		String url = new Date().getTime()+sourcePdfUrl.split("/")[sourcePdfUrl.split("/").length-1];
		ByteArrayInputStream in = new ByteArrayInputStream(bos.toByteArray());
		OSSClient ossClient = OSS.getOssClient();
		ossClient.putObject(OSS.bucketName, url,in);
		ossClient.shutdown();
		return url;
	}

	public static void fillData(AcroFields fields, Map<String, Object> data) throws IOException, DocumentException {
		for (String key : data.keySet()) {
			String value = data.get(key)==null?"":data.get(key).toString();
			fields.setField(key, value); // 为字段赋值,注意字段名称是区分大小写的
		}
	}
}
