import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Execute01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        //1. Adim: Driver'a kaydol ==> JDBC 4 sonrasi yapmaya gerek yoktur.Bunu artik yapmiyoruz
        Class.forName("org.postgresql.Driver");

        //2. Adim: Database'e baglan
        Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","9816923*Me");
                                                           // jdbc:postgresql:// -> bu kisim sabit. Sonra adres, post no ve password
        //3. Adim: Statement olustur
        Statement statement = connection.createStatement();

        //4. Adim: Query calistir
        /*
            1) Eger execute() method'u DDL (create,drop,alter,table) ile kullanilirsa her zaman 'false' doner.
            1) Eger execute() method'u DQL (select) ile kullanilirsa data donerse 'true', data donmezse 'false' verir.
         */

        //execute() methodu parametre olarak girilen String SQL komutunu bağlı olduğu database üzerinde uygular.

        //1. Ornek: workers adinda table olusturun
        //CREATE TABLE workers(worker_id VARCHAR(20), worker_name VARCHAR (20), worker_salary INT);
        boolean sql1 = statement.execute("CREATE TABLE workers(worker_id VARCHAR(20), worker_name VARCHAR (20), worker_salary INT)");
        System.out.println("sql1 = " + sql1);

        //execute method'u data cagiriyorsa true cagirmiyorsa false dondurur

        //2. Ornek: workers table'ina worker_adress sutunu ekleyiniz
        String sqlQuery1 = "ALTER TABLE workers ADD worker_address VARCHAR(100);";
        boolean sql2 = statement.execute(sqlQuery1);
        System.out.println("sql2 = " + sql2);  // ddl kullandigimiz icin false dondu

        //3. Ornek: workers table'i siliniz
        String sqlQuery2 = "DROP TABLE workers";
        boolean sql3 = statement.execute(sqlQuery2);
        System.out.println("sql3 = " + sql3);  // ddl kullandigimiz icin false dondu

        //5. Adim: Baglantiyi kapat
        connection.close();
        statement.close();


    }
}
