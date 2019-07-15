package com.qqh.practice04.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUpload {
	public static Map<String, Object> upload(HttpServletRequest request) throws IOException, FileUploadException{
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload =new ServletFileUpload(factory);
		List<FileItem> items=upload.parseRequest(request);
		 Map<String, Object> map = new HashMap<>();
	       List<String> filenames = new ArrayList<>();
		for(FileItem item:items){
			if(item.isFormField()){//如果为真  则当前item是非文件域元素
                String value = item.getString();
                value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                map.put(item.getFieldName(), value);
			}else{
				InputStream is=item.getInputStream();
				byte[] b=new byte[1024];
				String fn=getFName();
				int flag=1;
				OutputStream fos=null;
				int length=0;
				while((length=is.read(b))!=-1){
					if(flag==1){
					 fos=new FileOutputStream(getFPath()+"/"+fn);
					 flag=2;
					}
					fos.write(b, 0, length);
				}
				if(flag==2){
					fos.flush();
					fos.close();
				}
				
				is.close();
				filenames.add(fn);
			}
		}
		 map.put("list", filenames);
	        return map;
	}
	private static String getFName(){
		String filename=UUID.randomUUID().toString()+".jpg";
		return filename;
	}
	public static File getFPath(){
		File f=new File("H:/eclipse/Practice03/WebContent/web/image");
		if(!f.exists()){
			f.mkdirs();
		}
		return f;
	}
	 public static  void delFile(String filename) {
	      if (filename==null||filename.isEmpty())
	          return;
	      File file = new File( getFPath()+ "/" + filename);
	      file.delete();
	  }
}
