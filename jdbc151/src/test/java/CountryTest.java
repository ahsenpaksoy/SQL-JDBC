import org.junit.Test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class CountryTest {

    /*
 Given
   User connects to the database
   (Kullanıcı veritabanına bağlanır)

 When
   User sends the query to get the region ids from "countries" table
   (Kullanıcı, 'countries' table'dan 'region id' almak üzere query gönderir )

 Then
   Assert that the number of region ids greater than 1 is 17.
   (1'den büyük region id'lerin sayısının 17 olduğunu doğrula )

 And
   User closes the connection
*/


    //test methodlari public ve void olur ve parametresi olmaz.
    //execute(), executeQuery(), executeUpdate() gibi methodlar statement olmadan calismaz. O yuzden statement olusturduk.
    @Test
    public void countryTest() throws SQLException {

        //User connects to the database
        JDBCUtils.connectToDataBase();
        JDBCUtils.createStatement();  // statement olusturmazsak hata aliriz.bu method calistirilmazsa statement null kalir.

        //User sends the query to get the region ids from "countries" table
        String sql = "SELECT COUNT(region_id) FROM countries WHERE region_id > 1";
        ResultSet resultset = JDBCUtils.executeQuery(sql);

        //Assert that the number of region ids greater than 1 is 17.

        /*
        resultset.next();
        int result = resultset.getInt(1);
        //System.out.println("result = " + result);
        assertEquals(17,result);
        */

        int number = 0;
        while(resultset.next()){
           number = resultset.getInt(1);
        }
        assertEquals(17,number);

        //User closes the connection
        JDBCUtils.closeConnection();

    }

    //Yukaridaki testin farkli yolu. Sutundaki sayilari loop ile list'in icine koydu
    @Test
    public void countryTest2() throws SQLException {
        //User connects to the database
        JDBCUtils.connectToDataBase();
        JDBCUtils.createStatement();  // statement olusturmazsak hata aliriz.bu method calistirilmazsa statement null kalir.

        //User sends the query to get the region id's from "countries" table
        String sql = "SELECT region_id FROM countries WHERE region_id > 1";
        ResultSet resultset = JDBCUtils.executeQuery(sql);
        List<Integer> region_idList = new ArrayList<>();

        while (resultset.next()){  //resultSet'ten aldigim sayilari region_idList'in icine ekliyorum.
            region_idList.add(resultset.getInt(1));
        }
        System.out.println("region_idList = " + region_idList); // region_idList = [2, 3, 2, 2, 3, 4, 4, 3, 3, 4, 3, 2, 4, 3, 2, 4, 4]

        //Assert that the number of region ids greater than 1 is 17.
        assertEquals(17,region_idList.size());  // region_idList'inin sayisinin 17 olmasi gerekir

        // User closes the connection
        JDBCUtils.closeConnection();


    }



}
