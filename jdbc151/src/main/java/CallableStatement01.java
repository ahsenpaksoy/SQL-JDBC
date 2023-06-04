import java.sql.*;

public class CallableStatement01 {
    public static void main(String[] args) throws SQLException {
        Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","9816923*Me");
        Statement statement = connection.createStatement();

        //1. Örnek: Selamlama yapan bir function'ı Callable Statement ile çağırınız
        //Callable Statement Adimlari:

        //1. Adim: Function'i olusturan kodu yaziniz.
        String sql = "CREATE OR REPLACE FUNCTION selamlama(x TEXT) RETURNS TEXT AS $$ \n" +
                "BEGIN RETURN 'Merhaba '|| x ||', nasılsın?'; END; $$ LANGUAGE plpgsql;";

        //2. Adim: Function kodunu calistiriniz.
        statement.execute(sql); //Function oluşturan query'yi çalıştırdık

        //  String sql2 = "SELECT selamlama('Ali')"; ==> Burası Callable Statement kullanmadan function çağırma işlemi
       //  ResultSet resultSet = statement.executeQuery(sql2);//Function'ı paramtere ile çağırdık. Bize bir table döndü
       //  resultSet.next();
        // System.out.println(resultSet.getObject(1));

        //3. Adim: Function'i cagir.
        CallableStatement callableStatement = connection.prepareCall("{? = call selamlama(?)}");  // cagirilacak data hazirlaniyor
                                                                 // ilk ? return type digeri parametre
        //4. Adim: Return icin registerOutParameter() method'unu, parametreler icin ise setString(), setInt() gibi methodlari kullaniniz
        callableStatement.registerOutParameter(1,Types.VARCHAR);
        callableStatement.setString(2,"Ali");

        //5.Adim: execute() method'u ile callableStatement'i calistiriniz.
        callableStatement.execute();

        //6. Adim: Sonucu okumak icin callableStatement'dan data turunu cagir.
        //callableStatement'ta dönen data resultset içinde dönmez. Direkt callableStatement içerisinden alınır.
        System.out.println(callableStatement.getObject(1));


        //2. Örnek: İki sayıyı toplayan bir function yazınız ve Callable Statement ile çağırınız.

        //1. Adim: Function'i olusturan kodu yaziniz.
        String sql2 = "CREATE OR REPLACE FUNCTION toplama(x INT, y INT) RETURNS NUMERIC\n" +
                "AS $$ BEGIN RETURN x + y; END; $$ LANGUAGE plpgsql;";

        //2. Adim: Function kodunu calistiriniz.
        statement.execute(sql2);

        //3. Adim: Function'i cagir.
        CallableStatement callableStatement2 = connection.prepareCall("{? = call toplama(?, ?)}");

        //4. Adim: Return icin registerOutParameter() method'unu, parametreler icin ise setString(), setInt() gibi methodlari kullaniniz
        callableStatement2.registerOutParameter(1,Types.NUMERIC);
        callableStatement2.setInt(2,5);
        callableStatement2.setInt(3,15);

        //5.Adim: execute() method'u ile callableStatement'i calistiriniz.
        callableStatement2.execute();

        //6. Adim: Sonucu okumak icin callableStatement'dan data turunu cagir.
        System.out.println(callableStatement2.getBigDecimal(1));
        //getBigDecimal yerine getObject de koyabiliriz

        connection.close();
        statement.close();

    }
}
