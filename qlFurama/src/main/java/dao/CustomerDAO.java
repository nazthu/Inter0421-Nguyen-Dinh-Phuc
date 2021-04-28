package dao;

import databaseConnectionUtils.DatabaseConnectionUtils;
import model.Customer;

import java.sql.*;

public class CustomerDAO {
    public void insertCustomer(Customer customer){
        StringBuilder insert = new StringBuilder("insert into customer (`customer_type_id`, `customer_name`, `customer_birthday`, `customer_gender`,");
        insert.append("`customer_id_card`,`customer_phone`, `customer_email`,`customer_address`)");
        insert.append(" value (?,?, ?, ?, ?, ?, ? , ?);");
        System.out.println(insert.toString());
        Connection connection = DatabaseConnectionUtils.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(insert.toString());
            preparedStatement.setInt(1, customer.getType());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthday());
            preparedStatement.setBoolean(4, customer.isGender());
            preparedStatement.setInt(5, customer.getCard_id());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.executeUpdate();


        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            try{
                if(connection != null){
                    connection.close();
                }
                if(preparedStatement != null){
                    preparedStatement.close();
                }
            }catch (SQLException e1){
                e1.printStackTrace();
            }
        }

    }
}
