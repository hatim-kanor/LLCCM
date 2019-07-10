
package dbconnection;
import java.sql.*;
/**
 *
 * @author lenovo
 */
public class DbConnection {
    static Connection con = null;
    
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalaconference","root","admin");
                    
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        
        return con;
    }
}
