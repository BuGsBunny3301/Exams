<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login Form</h1>
        
        <%
            Connection connection;
            Statement statement;
            PreparedStatement preparedStatement;
            ResultSet set;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/examDB", "root", "");
                if(!connection.isClosed())
                    out.println("Successfully connected to MySQL!<br>");
                statement = connection.createStatement();
                
                
                if(request.getParameter("a").equals("b")){
                    set = statement.executeQuery("SELECT * FROM administrator");
                    
                    if (!set.next())
                        out.println("No Administrators!");
                    
                    else{
                        do{
                            if(set.getString("username").equals(request.getParameter("username"))
                               && set.getString("password").equals(request.getParameter("password"))){
                                
                                response.sendRedirect("administratorHome.jsp?a=b");
                            }
                        }while(set.next());
                    }
                }
            }catch(Exception ex){
                out.print("Stuff went wrong " + ex);
            }
            
            %>
        
        <form action="administratorLogin.jsp?a=b" method="post">
            Username <input type="text" name="username"><br />
            Password <input type="password" name="password"><br />
            <input type="submit" value="submit">
        </form>
    </body>
</html>
