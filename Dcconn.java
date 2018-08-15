/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Neetha
 */
public class Dcconn {
    public Connection getc()
    {
        Connection con=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root","root");
        }
        catch(Exception e)
        {
            
        }
        return con;
        
    }
    
}
