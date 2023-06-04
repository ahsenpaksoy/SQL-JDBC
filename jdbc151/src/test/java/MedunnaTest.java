import org.junit.Test;

import java.sql.ResultSet;
import java.sql.SQLException;

import static org.junit.Assert.assertEquals;

public class MedunnaTest {
     /*
 Given
   User connects to the database
   (Host name: medunna.com, Database name: medunna_db_v2, Username: select_user, Password: Medunna_pass_@6))

 When
   User sends the query to get the created room
   (Kullanıcı oluşturulan odayı getirmek için sorgu gönderir)

 Then
   Assert that room is created properly
   (Odanın düzgün kaydedildiğini doğrular)

 And
   User closes the connection

*/

    @Test
    public void medunnaTest() throws SQLException {
        //User connects to the database
        JDBCUtils.connectToMedunnaDataBase();
        JDBCUtils.createStatement();

        //User sends the query to get the created room
        String sql = "SELECT * FROM room WHERE room_number = 9995033";
        ResultSet resultSet = JDBCUtils.executeQuery(sql);

        //Assert that room is created properly
        resultSet.next();  //Burada tek satir cagirdigimiz icin tek bir next() methodu yeterlidir.
                           // Coklu satirlarda loop kullanmak gereklidir.
        assertEquals("123.00", resultSet.getString("price"));
        assertEquals("DataBase Test İçin Oluşturuldu", resultSet.getString("description"));
        assertEquals("mark_twain", resultSet.getString("created_by"));


        //User closes the connection
        JDBCUtils.closeConnection();

    }



}
