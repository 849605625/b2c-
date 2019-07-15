package com.qqh.practice04.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/myGoodsController")
public class OrderGoodsController {

//	@ResponseBody
//	@RequestMapping(value="/insert",method=RequestMethod.POST)
	
	
//	private static void ListSort(List<BillHistoryEntity> list) {
//        Collections.sort(list, new Comparator<BillHistoryEntity>() {
//            public int compare(BillHistoryEntity o1, BillHistoryEntity o2) {
//                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                try {
//                    Date dt1 = format.parse(o1.getSubmitTime());
//                    Date dt2 = format.parse(o2.getSubmitTime());
//                    if (dt1.getTime() > dt2.getTime()) {
//                        return 1;
//                    } else if (dt1.getTime() < dt2.getTime()) {
//                        return -1;
//                    } else {
//                        return 0;
//                    }
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//                return 0;
//            }
//        });
//    }
//	@ResponseBody
//	@RequestMapping(value="/get",method=RequestMethod.POST)
//	private String get(){
//		
//	}
}
