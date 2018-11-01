package cn.tslanpu.test.add.agricultural.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aliyun.oss.OSSClient;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

import cn.itcast.commons.CommonUtils;
import cn.tslanpu.test.add.agricultural.domain.Agricultural;
import cn.tslanpu.test.add.agricultural.service.AgriculturalService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.BaseServlet;
import cn.tslanpu.test.utils.MatrixToImageWriter;
import cn.tslanpu.test.utils.OSS;

public class AgriculturalServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private AgriculturalService agriculturalService = new AgriculturalService();

	// 增加信息
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Agricultural agricultural = setBean(request, response);
			agriculturalService.add(agricultural);
			out.println(1);
		} catch (Exception e) {
			e.printStackTrace();
			out.println(0);
		}
	}

	// 查看详细信息
	public void infor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 根据id查询所属分局
		String str = request.getParameter("enterpriseId");
		int id = Integer.parseInt(str);
		createQRcode(id);
		Agricultural agricultural = agriculturalService.agriculturalFind(id);
		agricultural.setQRcode("http://lanpubucket1.oss-cn-beijing.aliyuncs.com/"+"agricultural" + id + ".png");
		request.setAttribute("agricultural", agricultural);
		request.getRequestDispatcher("/pages/tables/agricultural/agriculturalInformation.jsp").forward(request,
				response);
	}

	// 生成二维码
	private final void createQRcode(int agriculturalId) throws IOException {

		String fileName = "agricultural" + agriculturalId + ".png";
		// 判断文件是否存在
		OSSClient ossClient = OSS.getOssClient();
		boolean found = ossClient.doesObjectExist(OSS.bucketName, fileName);
		if (found) {
			return;
		}
		// 二维码封装的链接
		String url = "http://www.personalproductionshow.com:8090/foodregulation/xiaotandian/index.do?agriculturalId="
				+ agriculturalId+"#mp.weixin.qq.com";
		int width = 300;
		int height = 300;
		// 二维码的图片格式
		String format = "png";
		Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
		// 内容所使用编码
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");

		BitMatrix bitMatrix = null;
		try {
			bitMatrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height, hints);
		} catch (WriterException e) {
			e.printStackTrace();
		}

		// 二维码生成
		File outputFile = new File(fileName);
		MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
		ossClient.putObject(OSS.bucketName, fileName, outputFile);
		ossClient.shutdown();
	}

	// 更新信息
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			// 判断返回的状态
			request.setAttribute("status", 2);

			/*
			 * 获取当前Id根据id查询及修改
			 */
			String str = request.getParameter("idA");
			int id = Integer.parseInt(str);

			Agricultural agricultural = setBean(request, response);

			// 更新
			agriculturalService.agriculturalUpdate(id, agricultural);

			// //回显
			agricultural = agriculturalService.agriculturalFind(id);

			request.setAttribute("agricultural", agricultural);
			out.println(1);
		} catch (Exception e) {
			e.printStackTrace();
			out.println(0);
		}
	}

	// 打印
	public void print(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 根据id查询所属分局
		String str = request.getParameter("id");
		int id = Integer.parseInt(str);
		Agricultural agricultural = agriculturalService.agriculturalFind(id);
		String[] arrManage = agricultural.getItemsOfBusiness().split(",");
		String[] arrJyType = agricultural.getJyType().split(",");
		request.setAttribute("arrJyType", arrJyType);
		request.setAttribute("arrManage", arrManage);
		request.setAttribute("agricultural", agricultural);
		request.getRequestDispatcher("/pages/tables/agricultural/downloadAgriculturalInfo.jsp").forward(request,
				response);
	}

	// 删除信息
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 删除信息
		String str = request.getParameter("id");
		int id;
		if (str != null && !str.trim().isEmpty()) {
			try {
				id = Integer.parseInt(str);
				agriculturalService.delete(id);
			} catch (RuntimeException e) {
				response.getWriter().print(0);
			}
		}
		response.getWriter().print(1);
	}

	@SuppressWarnings("unchecked")
	private Agricultural setBean(HttpServletRequest request, HttpServletResponse response) {

		Map map = request.getParameterMap();
		Agricultural agricultural = CommonUtils.toBean(map, Agricultural.class);

		String jyType = "";
		String[] jyTypeArr = request.getParameterValues("jyType");
		if (jyTypeArr != null) {
			for (int i = 0; i < jyTypeArr.length; i++) {
				jyType += jyTypeArr[i];
				if (i != jyTypeArr.length - 1) {
					jyType += ",";
				}
			}
		}
		agricultural.setJyType(jyType);

		String itemsOfBusiness = "";
		String[] itemsOfBusinessArr = request.getParameterValues("itemsOfBusiness");
		if (itemsOfBusinessArr != null) {
			for (int i = 0; i < itemsOfBusinessArr.length; i++) {
				itemsOfBusiness += itemsOfBusinessArr[i];
				if (i != itemsOfBusinessArr.length - 1) {
					itemsOfBusiness += ",";
				}
			}
		}
		agricultural.setItemsOfBusiness(itemsOfBusiness);

		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");// 得到当前修改用户
		agricultural.setAmend(admin.getName());

		return agricultural;
	}

	public void forCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("enterpriseId");
		int id = Integer.parseInt(str);
		Agricultural agricultural = this.agriculturalService.agriculturalFind(id);

		request.setAttribute("agricultural", agricultural);
		request.getRequestDispatcher("/forCode/agriculturalforCode.jsp").forward(request, response);
	}
}
