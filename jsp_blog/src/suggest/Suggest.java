package suggest;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import utility.DBOpen ;
import utility.DBClose;
 
public class Suggest extends javax.servlet.http.HttpServlet {  //이렇게하면 서블릿으로 바뀜.
    // 서블릿 버전
    static final long serialVersionUID = 1L;
   
    public Suggest() {
        super();
    }    
 
    // Form - get 방식 처리
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //출력시 사용할 문자셋 지정
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        //출력시 사용할 객체 생성
        PrintWriter out = response.getWriter();
        
        // 문자셋 테스트
        // Utility.charsetTest(request.getParameter("keyword"));
        
        String keyword = request.getParameter("keyword");
        System.out.println("servlet keyword: " + keyword);
        
        int count = 0;
        
        if (keyword == null){
            keyword ="";
        }
        
        Connection con = DBOpen.open();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuffer sql = null;
        
        try {
            sql = new StringBuffer();
            
            sql.append(" SELECT COUNT(*)");
            sql.append(" FROM bbs");
            sql.append(" WHERE content LIKE '" + keyword +"%'");
            sql.append(" ORDER BY content ASC");            
 
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery(); // 쿼리 실행
            
            if (rs.next()){
             count = rs.getInt(1);  // 수량 산출
            }
            
            sql.delete(0, sql.toString().length()); // buffer clear
            
            sql.append(" SELECT content");
            sql.append(" FROM bbs");
            sql.append(" WHERE content LIKE '" + keyword +"%'");
            sql.append(" ORDER BY content ASC");
            
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery(); // 쿼리 실행
            
            
            // Client로 지정
            // 문자열 조합: 갯수|
            out.print(count + "|");
            
            while(rs.next()) {
                count = count - 1; //기존 카운트를 줄여줌
                String key = rs.getString("content");
                out.print(key);
                if (count > 0){ // 값의 중간만 콤마 출력
                    out.print(",");
                }
            }
            
        }catch(Exception ex) {
            System.out.println("Exception" + ex);
        }finally{
             DBClose.close(rs,pstmt, con);
        }        
        
 
    }   
 
    // Form - post 방식 처리
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     // GET 방식으로 전달
        doGet(request, response); 
    }           
}