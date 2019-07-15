package com.qqh.practice04.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qqh.practice04.product.model.GoodsPicModel;
import com.qqh.practice04.product.service.IGoodsPicService;
import com.qqh.practice04.util.FileUpload;


@Controller
@RequestMapping("/goodsPicController")
public class GoodsPicController {
	@Autowired
	private IGoodsPicService goodsPicService;
	@ResponseBody
	@RequestMapping(value="/upImage",method=RequestMethod.POST)
	private String upImage(HttpServletRequest request) throws IOException{
		
		Map<String, Object> map = null;
	      try {
	          map = FileUpload.upload(request);
	      } catch (FileUploadException e) {
	          e.printStackTrace();
	      }
	      String code = map.get("code").toString();
	      List<String> list = (List<String>) map.get("list");
	      for(int i=0;i<list.size();i++){
	    	  String image = list.get(i); 
	    	  GoodsPicModel model = new GoodsPicModel();
	    	  model.setCode(code);
	    	  model.setUrl(image);
	    	  model.setType("2");
	    	  goodsPicService.insert(model);
	      }
	      Map<String, String> res = new HashMap<>();
	      res.put("code", "0");
	     // res.put("data", image);
	     return  new JSONObject(res).toString();
	}
	@ResponseBody
	@RequestMapping(value="/getImage",method=RequestMethod.POST)
	private String getImage(GoodsPicModel model){
		List<GoodsPicModel> list=goodsPicService.getList(model);
		return new JSONArray(list).toString();
	}
	@RequestMapping("/setMain")
    @ResponseBody
    public String setMain(GoodsPicModel productPicModel) {
        Integer id = productPicModel.getId();
        GoodsPicModel t = new GoodsPicModel();
        t.setCode(productPicModel.getCode());
        List<GoodsPicModel> list = goodsPicService.getList(t);
        for (GoodsPicModel ppm : list) {
            if (id.equals(ppm.getId())) {
                ppm.setType("1");
            } else if (ppm.getType().equals("1")) {
                ppm.setType("2");
            } else {
                continue;
            }
            goodsPicService.update(ppm);
        }
        return "1";
    }
	  @RequestMapping("/del")
	    @ResponseBody
	    public String del(GoodsPicModel Model) {
		    FileUpload.delFile(Model.getUrl());
	        return goodsPicService.deleteModel(Model) + "";
	    }
	  
	  
}
