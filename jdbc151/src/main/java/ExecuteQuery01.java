import java.sql.*;

public class ExecuteQuery01 {
    public static void main(String[] args) throws SQLException {

        Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","9816923*Me");
        Statement statement = connection.createStatement();

        //1. Ornek: region id'si 1 olan 'country_name' degerlerini cagirin
        System.out.println("\n============= 1. ORNEK =================\n");
        String sql1 = "SELECT country_name FROM countries WHERE region_id = 1";
        boolean r1 = statement.execute(sql1);
        System.out.println("r1 = " + r1); //true  -> DQL ile data cagiriyoruz

        //execute() method'u sadece boolean doner

        //Datayi cagirip okumak icin executeQuery() method'unu kullanmaliyiz.
        //Satirlari gormek icin executeQuery() method'unu kullanmaliyiz.
        //execute() method'u sadece true veya false doner.

        // execute methodu sadece istedigim veriyi vermez hep true verir.
        // specific veriyi cagiramam. Bu yüzden uygun degil.
        // Saglikli, dogru data almak icin ExecuteQuery kullanmaliyiz.

        //ResultSet resultset = statement.executeQuery(sql1);
        //System.out.println(resultset.next());
        //System.out.println(resultset.next());
        //System.out.println(resultset.getString(1));

        //her seferinde satir atlamak icin next diyoruz, indeks her zaman 1
        //next() imleci satir varsa diger satira goturur

        ResultSet resultset = statement.executeQuery(sql1);
        while (resultset.next()){
            System.out.println(resultset.getString(1));
            //System.out.println(resultset.getString("country_name"));
        }

        //2.Örnek: "region_id"nin 2'den büyük olduğu "country_id" ve "country_name" değerlerini çağırın.
        System.out.println("\n============= 2. ORNEK =================\n");
        String sql2 = "SELECT country_id, country_name FROM countries WHERE region_id>2";  // bu bize ResultSet doner.
                                                                                 //ResultSet bir pointer ile doner
        ResultSet resultSet2 = statement.executeQuery(sql2);
        while(resultSet2.next()){   //ResultSet son satıra gelip false verdikten sonra kapanır. Kapalı ResultSet üzerinde işlem yapılırsa exception atar.
            System.out.println(resultSet2.getString(1)+"-- "+resultSet2.getString(2));
        }

        //3.Örnek: "number_of_employees" değeri en düşük olan satırın tüm değerlerini çağırın.
        System.out.println("\n============= 3. ORNEK =================\n");
        String sql3 = "SELECT * FROM companies WHERE number_of_employees=(SELECT MIN(number_of_employees) FROM companies)";
        ResultSet resultSet3 = statement.executeQuery(sql3);
        /*
        resultSet3.next(); // 1 satir okutacaksak sadece tek bir next() kullanabiliriz
        System.out.println("resultSet3.getInt(1) = " + resultSet3.getInt(1));
        */

        while (resultSet3.next()){
            System.out.println(resultSet3.getObject(1)+"--"+resultSet3.getObject(2)+"--"+resultSet3.getObject(3));
            // Parantez iclerine sutun isimleri de yazilabilir
        }

        // getObject() yerine string degerler icin getString(), int degerler icin getInt() kullanilir.

        connection.close();
        statement.close();



    }
}





