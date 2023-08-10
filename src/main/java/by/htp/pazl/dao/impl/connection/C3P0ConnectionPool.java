package by.htp.pazl.dao.impl.connection;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class C3P0ConnectionPool {

    private final int maxStatements = 130;
    private final int maxStatementsPerConnection = 10;
    private final int minPoolSize = 5;
    private final int acquireIncrement = 2;
    private final int maxPoolSize = 25;

    private static C3P0ConnectionPool instance = null;
    private DataSource dataSource;

    private C3P0ConnectionPool() {
        try {

            ResourceBundle bundle = ResourceBundle.getBundle("/database/db");
            String driverName = bundle.getString(DBParameter.DB_DRIVER);
            String url = bundle.getString(DBParameter.DB_URL);
            String user = bundle.getString(DBParameter.DB_USER);
            String password = bundle.getString(DBParameter.DB_PASSWORD);

            ComboPooledDataSource cpds = new ComboPooledDataSource();
            cpds.setDriverClass(driverName);
            cpds.setJdbcUrl(url);
            cpds.setUser(user);
            cpds.setPassword(password);

            cpds.setMaxStatements(maxStatements);
            cpds.setMaxStatementsPerConnection(maxStatementsPerConnection);
            cpds.setMinPoolSize(minPoolSize);
            cpds.setAcquireIncrement(acquireIncrement);
            cpds.setMaxPoolSize(maxPoolSize);

            this.dataSource = cpds;
        } catch (PropertyVetoException ex) {
            System.err.println("Error init connectionPool " + ex);
        }
    }

    public static C3P0ConnectionPool getInstance() {
        if (instance == null) {
            instance = new C3P0ConnectionPool();
        }
        return instance;
    }

    public Connection takeConnection() throws SQLException {
        return dataSource.getConnection();
    }

    public void closeConnection(Connection con, Statement st, ResultSet rs) {
        try {
            rs.close();
        } catch (SQLException e) {
            // The method is called in finally block, so do not throw an exception
            //logger.log(Level.ERROR, "ResultSet isn't closed.");
        }

        try {
            st.close();
        } catch (SQLException e) {
            // The method is called in finally block, so do not throw an exception
            //logger.log(Level.ERROR, "Statement isn't closed.");
        }

        try {
            con.close();
        } catch (SQLException e) {
            // The method is called in finally block, so do not throw an exception
            //logger.log(Level.ERROR, "Connection isn't return to the pool.");
        }
    }

    public void closeConnection(Connection con, Statement st) {
        try {
            st.close();
        } catch (SQLException e) {
            // The method is called in finally block, so do not throw an exception
            //logger.log(Level.ERROR, "Statement isn't closed.");
        }

        try {
            con.close();
        } catch (SQLException e) {
            // The method is called in finally block, so do not throw an exception
            //logger.log(Level.ERROR, "Connection isn't return to the pool.");
        }
    }

}
