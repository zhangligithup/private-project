package cn.tslanpu.test.add.agricultural.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tslanpu.test.utils.DB;
import cn.tslanpu.test.utils.MatrixToImageWriter;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

public class AgriculturalQrServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
		
		String idStr = request.getParameter("id");
		int idInt = Integer.parseInt(idStr);
		
		//二维码封装的链接
		String text = request.getRequestURL().toString();
	    text = text.substring(0, text.indexOf("AgriculturalQrServlet"));
	    text = text + "/AgriculturalServlet?method=forCode&enterpriseId=";
        int width = 300;  
        int height = 300;  
        //二维码的图片格式  
        String format = "png";  
        Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();  
        //内容所使用编码  
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");  
  
    	Map<Integer,String> ids = getIds(idInt);
    	String fileName = null;
    	String file = null;
    	for(Integer id : ids.keySet()){
    			BitMatrix bitMatrix = null;
    			//String id = String.valueOf(idI);
				try {
					bitMatrix = new MultiFormatWriter().encode(text+id,  
					    BarcodeFormat.QR_CODE, width, height, hints);
				} catch (WriterException e) {
					e.printStackTrace();
				}  
    		 
    		 //二维码生成路径
			 String path = request.getRealPath("/");
			 File outputFile = new File(path + File.separator + id + ".png");
			 
    		 file = id + ".png";
    		 fileName = ids.get(id)+ "_" + id;
    	     MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
    	}
    	
    	PrintWriter out = response.getWriter();
    	//返回json格式的字符串
    	String json = "{'file':'"+ file + "','fileName':'" + fileName + "'}";
    	out.write(json);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
	
	public static Map<Integer,String> getIds(int id){
    	Map<Integer,String> ids = new HashMap<Integer,String>();
    	Connection conn = DB.getConnection();
    	String sql = "select * from agricultural where id = " + id;
    	PreparedStatement pst = DB.createPST(conn, sql);
    	ResultSet rs = DB.getRs(pst);
    	
    	try {
			while(rs.next()){
					ids.put(rs.getInt("id"), rs.getString("qyname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		      DB.close(conn, pst, rs);
	    }
    	return ids;
    }

}
