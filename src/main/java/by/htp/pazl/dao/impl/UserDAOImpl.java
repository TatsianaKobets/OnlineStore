package by.htp.pazl.dao.impl;

import by.htp.pazl.bean.User;
import by.htp.pazl.dao.UserDAO;
import by.htp.pazl.dao.exception.DAOException;
import by.htp.pazl.dao.exception.DAOUserAlreadyExistsException;
import by.htp.pazl.dao.impl.connection.C3P0ConnectionPool;

import java.sql.*;

public class UserDAOImpl implements UserDAO {

    private static final String TBL_COLUMN_NAME = "name";
    private static final String TBL_COLUMN_SURNAME = "surname";
    private static final String TBL_COLUMN_EMAIL = "email";
    private static final String TBL_COLUMN_ID = "id";
    private static final String TBL_COLUMN_LOGIN = "login";
    private static final String TBL_COLUMN_PASSWORD = "password";
    private static final String TBL_COLUMN_PHONE = "phone";
    private static final String TBL_COLUMN_ADDRESS = "address";
    private static final String TBL_COLUMN_STATE = "STATE_ID";
    private static final String TBL_COLUMN_ROLE = "ROLE_ID";

    private static final C3P0ConnectionPool connectionPool = C3P0ConnectionPool.getInstance();

    private static final String INSERT_USER_SQL = "insert into users(login,password,name,surname,email) values(?,?,?,?,?)";
    private static final String SIGN_IN_SQL = "select * from users where login = ? and password = ?";

    public UserDAOImpl() { }

    @Override
    public void registration(String login, String password, String name, String surname, String email) throws DAOException {

        PreparedStatement ps = null;
        Connection con = null;

        try {

            con = connectionPool.takeConnection();
            ps = con.prepareStatement(INSERT_USER_SQL);

            ps.setString(1, login);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, surname);
            ps.setString(5, email);

            ps.executeUpdate();

        } catch (SQLIntegrityConstraintViolationException e) {
            throw new DAOUserAlreadyExistsException("Login or email already exists", e);
        } catch (SQLException e) {
            throw new DAOException("Error while adding new User", e);

        } finally {
            connectionPool.closeConnection(con, ps);
        }
    }

    @Override

    public User signIn(String login, String password) throws DAOException {
        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;

        try {
            con = connectionPool.takeConnection();
            ps = con.prepareStatement(SIGN_IN_SQL);

            ps.setString(1, login);
            ps.setString(2, password);

            rs = ps.executeQuery();

           if (rs == null){
                return null;
            }
           User user = null;
           if (rs.next()) {

              user = new User(rs.getInt(TBL_COLUMN_ID),
                        rs.getString(TBL_COLUMN_LOGIN),
                        rs.getString(TBL_COLUMN_PASSWORD),
                        rs.getString(TBL_COLUMN_NAME),
                        rs.getString(TBL_COLUMN_SURNAME),
                        rs.getString(TBL_COLUMN_EMAIL),
                        rs.getString(TBL_COLUMN_PHONE),
                        rs.getString(TBL_COLUMN_ADDRESS),
                        rs.getString(TBL_COLUMN_STATE),
                        rs.getString(TBL_COLUMN_ROLE)
                );
           }return user;

        } catch (SQLException e) {
            throw new DAOException("Error while authorize User", e);

        } finally {
            connectionPool.closeConnection(con, ps, rs);
     }
    }
}
