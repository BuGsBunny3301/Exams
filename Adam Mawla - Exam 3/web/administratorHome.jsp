<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Home</title>
    </head>
    <body>
        
        <h1>Enter Speeding Ticket</h1>
        
        <%
            Connection connection;
            Statement statement;
            PreparedStatement preparedStatement;
            ResultSet set;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/examdb", "root", "");
                if(!connection.isClosed())
                    out.println("Successfully connected to MySQL!<br>");
                statement = connection.createStatement();
                
                if(request.getParameter("a").equals("k")){
                
                    String query = "INSERT INTO ticket (plate_number, amount, status) "
                            + "VALUES ("
                            + request.getParameter("plateNumber") + ", " 
                            + request.getParameter("amount") + ", "
                            + request.getParameter("status") + ")";

                    statement.executeUpdate(query);
                
                }
                
                
            }catch(Exception ex){
                out.print("Wrong stuff happened " + ex);
            }
            
            %>
        
            <form action="administratorHome.jsp?a=k" method="post">
                Plate Number <input type="text" name="plateNumber"><br />
                Amount <input type="text" name="amount"><br />
                Status <input type="text" name="status"><br />
                <input type="submit" value="submit">
            </form>
            
    </body>
</html>
