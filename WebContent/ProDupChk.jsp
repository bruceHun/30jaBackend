<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
//request.setCharacterEncoding("utf-8");
String s = new String(request.getParameter("pname").getBytes("ISO-8859-1"),"utf-8");
    ArrayList<Product> plist = null;
    //out.print(s);
    
    try{  		
    		ProductDAO dao = new ProductDAOimpl();
    		System.out.print(dao.findByName(s));
    		plist = dao.findByName(s);
    		
    		//out.print(plist.toString());
    	   	if (plist == null)
    	    {
    	    	out.print("0");	// 0 代表沒有重複可以新增
    	    }
    	    else
    	    {
    	    	out.print("1");	// 1 代表有重複不可以新增
    	    }
    		
    	
    	
    		
    
    }catch(Exception e){
		out.print("1");
	}
    

    
    
    
    %>