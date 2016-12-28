package utility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

public class Utility {
	public static String getCodeValue(String code){
		String value=null;
		Hashtable codes=new Hashtable<>();
		codes.put("A01", "회사원");
		codes.put("A02", "전산관련직");
		codes.put("A03", "연구원");
		codes.put("A04", "학생");
		codes.put("A05", "자영업");
		codes.put("A06", "공무원");
		codes.put("A07", "의료인");
		codes.put("A08", "법조인");
		codes.put("A09", "종교/언론/예술인");
		codes.put("A10", "etc.");
		
		value=(String) codes.get(code);
		return value;
	}
	/**
     * 오늘,어제,그제 날짜 가져오기
     * @return List- 날짜들 저장
     */
    public static List<String> getDay(){
        List<String> list = new ArrayList<String>();
        
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        for(int j = 0; j < 3; j++){ 
            list.add(sd.format(cal.getTime())); //3개 날짜 넣기.
            cal.add(Calendar.DATE, -1); 		
        }
        
        return list;
    }
    /**
     * 등록날짜와 오늘,어제,그제날짜와 비교
     * @param wdate - 등록날짜
     * @return - true:오늘,어제,그제중 등록날짜와 같음 
     *           false:오늘,어제,그제 날짜가 등록날짜와 다 다름
     */
    public static boolean compareDay(String wdate){
        boolean flag = false;
        List<String> list = getDay();
        if(wdate.equals(list.get(0)) 
           || wdate.equals(list.get(1))
           || wdate.equals(list.get(2))){
            flag = true;
        }
          
        return flag;
    }
	public static String checkNull(String str){
		if(str==null){
			str="";
		}
		return str;
	}
}
