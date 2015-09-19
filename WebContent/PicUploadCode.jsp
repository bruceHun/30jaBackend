<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page import="java.nio.file.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    out.println("isMultipart="+isMultipart);
    
   	String pid = null;
   	String select = null;	
   	
	
	String saveDirectory = null;	
	
	// Create a factory for disk-based file items
    FileItemFactory factory = new DiskFileItemFactory();
 
    // Create a new file upload handler
    ServletFileUpload upload = new ServletFileUpload(factory);

    //Create a progress listener
    ProgressListener progressListener = new ProgressListener(){
       private long megaBytes = -1;
       public void update(long pBytesRead, long pContentLength, int pItems) {
           long mBytes = pBytesRead / 1000000;
           if (megaBytes == mBytes) {
               return;
           }
           megaBytes = mBytes;
           System.out.println("We are currently reading item " + pItems);
           if (pContentLength == -1) {
               System.out.println("So far, " + pBytesRead + " bytes have been read.");
           } else {
               System.out.println("So far, " + pBytesRead + " of " + pContentLength
                                  + " bytes have been read.");
           }
       }
    };
    upload.setProgressListener(progressListener);
    
 // Parse the request
    List<FileItem> items = upload.parseRequest(request);
 
 // Process the uploaded items
    Iterator iter = items.iterator(); 
    while (iter.hasNext()) {
        FileItem item = (FileItem) iter.next();

        if (item.isFormField()) {
            // Process a regular form field
            //processFormField(item);
            System.out.println("a FormField");
            
            pid = item.getFieldName();		//設定檔名
            select = item.getString();		//設定資料夾
            System.out.println(pid + ", " + select);
            
            saveDirectory = "https://2-dot-javalab-1033.appspot.com/images/"+select+"/";	//設定絕對路徑
        } else {
            // Process a file upload
            //processUploadedFile(item);
                       
            System.out.println("a file Field");
            
            String fieldName = item.getFieldName();
            //String fileName = item.getName();
            String fileName = pid+".jpg";
            String contentType = item.getContentType();
            boolean isInMemory = item.isInMemory();
            long sizeInBytes = item.getSize();
            System.out.println("fieldName="+fieldName);
            System.out.println("fileName="+fileName);
            System.out.println("contentType="+contentType);
            System.out.println("isInMemory="+isInMemory);
            System.out.println("sizeInBytes="+sizeInBytes);
            
            if (fileName != null && !"".equals(fileName)) {
                fileName= FilenameUtils.getName(fileName);
                System.out.println("fileName saved="+fileName+"\n");
                File uploadedFile = new File(saveDirectory, fileName);
                item.write(uploadedFile);
            }
            
        }
    }   
%>