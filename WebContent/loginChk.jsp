<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.Business.*,shopping.DAO.*,shopping.Class.*, java.util.*"%>
    
<%
String acc = (String)request.getParameter("account");
//String acc = new String(request.getParameter("account").getBytes("ISO-8859-1"),"utf-8");
String pwd = SavePWD.encode(request.getParameter("password"));
    Administrator adm = null;
    int flag = 0;
    if (acc != null && pwd != null)
    {
    	try
    	{    		
    		AdministratorDAO dao = new AdministratorDAOimpl();
    		adm = dao.searchbyAccount(acc);
    		
    	    if (adm != null)
    	    {
    	    	if(adm.getPassword().equals(pwd)){
    	    		flag = 1;
    	    	}
    	    }
    	    else
    	    {
    	    	flag = 0;	// 0 代表密碼不符
    	    }
    		
    	}
    	catch(Exception e)
    	{
    		flag = 0;
    	}
    		
    }
    else
    {
    	flag = 0;
    }

    
    if (flag == 1){
    	String level = adm.getLevel();
    	if(level.equals("admin")){
    	session.setAttribute("LogOK","admin");
    	}else if(level.equals("user")){session.setAttribute("LogOK", "yes");	}//屬性名，屬性值
    	session.setAttribute("acc",acc);
    	
    	//String id = session.getId();
		//ArrayList<Product> plist = new ArrayList<Product>();
		//session.setAttribute(id, plist);
    	//String t = session.getAttribute("LogOK").toString();
    	//System.out.print(t);
    	//System.out.print(session.getId());
    	response.sendRedirect("index.jsp");
    }else{
    	response.sendRedirect("login.jsp");
    }
    
    
    
    
    %>