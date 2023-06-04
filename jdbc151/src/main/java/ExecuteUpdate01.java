import java.sql.*;

public class ExecuteUpdate01 {
    public static void main(String[] args) throws SQLException {
        Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","9816923*Me");
        Statement statement = connection.createStatement();

        //1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan number_of_employees
        // değerlerini 16000 olarak UPDATE edin.
        String sql ="UPDATE companies SET number_of_employees = 16000 WHERE number_of_employees < (SELECT AVG(number_of_employees) FROM companies)";
        int guncellenenSatirSayisi = statement.executeUpdate(sql);  //executeUpdate() methodu güncellenen satır sayısını int değer olarak döner
        System.out.println("guncellenenSatirSayisi = " + guncellenenSatirSayisi);

        //Güncelleme sonrası datayı okumak için DQL(Select) kullanıyoruz:
        String sql2 = "SELECT * FROM companies";
        ResultSet resultSet = statement.executeQuery(sql2);

        while (resultSet.next()) {
            System.out.println(resultSet.getObject("company_id") + "--" +resultSet.getObject("company") + "--" + resultSet.getObject("number_of_employees"));
        }

        connection.close();
        statement.close();
    }
}
