package cn.tslanpu.test.add.Criculate.servlet;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import cn.itcast.commons.CommonUtils;
import cn.tslanpu.test.add.Criculate.domain.Criculate_jdjc;
import cn.tslanpu.test.add.Criculate.service.CriculateService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.TokenProccessor;

public class CriculateFormServlet extends HttpServlet {

	private CriculateService criculateService = new CriculateService();

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
			/*
	  		 * 1. commons-fileupload的上传三步
	  		 */
	  		// 创建工具
	  		FileItemFactory factory = new DiskFileItemFactory();
	  		/*
	  		 * 2. 创建解析器对象
	  		 */
	  		ServletFileUpload sfu = new ServletFileUpload(factory);
	  	
	  		sfu.setFileSizeMax(5000 * 1024);//设置单个上传的文件上限为4M
	  		/*
			 * 3. 解析request得到List<FileItem>
			 */
			List<FileItem> fileItemList = null;
			try {
				fileItemList = sfu.parseRequest(request);
			} catch (FileUploadException e) {
				request.setAttribute("success", "请上传小于4M的照片");
				 request.getRequestDispatcher("pages/regulator/personnel.jsp").forward(request, response);
				 return;
			}
			/*
			 * 4. 把List<FileItem>封装到production_jdjc对象中
			 * 4.1 首先把“普通表单字段”放到一个Map中，再把Map转换成production_jdjc对象，再建立两者的关系
			 */
			Map<String,Object> map = new HashMap<String,Object>();
			for(FileItem fileItem : fileItemList) {
				if(fileItem.isFormField()) {//如果是普通表单字段
						map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
				}
			}
			Criculate_jdjc criculate_jdjc = CommonUtils.toBean(map, Criculate_jdjc.class);//把Map中大部分数据封装到Criculate_jdjc对象中
			/*
			 * 4.2 把上传的图片保存起来
			 *   > 获取文件名：截取之
			 *   > 给文件添加前缀：使用uuid前缀，为也避免文件同名现象
			 *   > 校验文件的扩展名：只能是jpg
			 *   > 校验图片的尺寸
			 *   > 指定图片的保存路径，这需要使用ServletContext#getRealPath()
			 *   > 保存之
			 *   > 把图片的路径设置给production_jdjc对象
			 */
	  		  
	  		String image_resource="";
	  		for(FileItem fileItem : fileItemList) {
				if(!fileItem.isFormField()) {//如果不是是普通表单字段
			// 获取文件名
			String filename= fileItem.getName();
			if(fileItem.getSize() == 0){
				
			}else{
				// 截取文件名，因为部分浏览器上传的绝对路径
				int index = filename.lastIndexOf("\\");
				if(index != -1) {
					filename = filename.substring(index + 1);
				}
				// 给文件名添加uuid前缀，避免文件同名现象
				filename = CommonUtils.uuid() + "_" + filename;
				// 校验文件名称的扩展名
				if(!filename.toLowerCase().endsWith(".jpg") && !filename.toLowerCase().endsWith(".png")
						&& !filename.toLowerCase().endsWith(".jpeg") && !filename.toLowerCase().endsWith(".gif")) {
					 //error("上传的图片扩展名必须是JPG", request, response);
					 request.setAttribute("success", "上传的图片不符合格式");
					 request.getRequestDispatcher("pages/regulator/personnel.jsp").forward(request, response);
					 return;
				}
				// 校验图片的尺寸
				// 保存上传的图片，把图片new成图片对象：Image、Icon、ImageIcon、BufferedImage、ImageIO
				/*
				 * 保存图片：
				 * 1. 获取真实路径
				 */
				String savepath = this.getServletContext().getRealPath("/resource_jdjc");
				/*
				 * 2. 创建目标文件
				 */
				File destFile = new File(savepath, filename);
				/*
				 * 3. 保存文件
				 */
				try {
					fileItem.write(destFile);//它会把临时文件重定向到指定的路径，再删除临时文件
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
				//将多个图片路径整合成一个字符串
				image_resource += fileItem.getFieldName()+"resource_jdjc/" + filename+"zhangyi";
			}
		} } 				
	  		System.out.println(image_resource);
	  		criculate_jdjc.setImage_resource(image_resource);
	  		criculateService.add_jdjc(criculate_jdjc);
	       	request.setAttribute("success", "提交成功");
	  		request.getRequestDispatcher("/CriculateServlet?method=dispNameData").forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
