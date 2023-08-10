package by.htp.pazl.dao.impl;


import by.htp.pazl.bean.Category;
import by.htp.pazl.bean.Item;
import by.htp.pazl.bean.Review;
import by.htp.pazl.dao.ItemDAO;
import by.htp.pazl.dao.exception.DAOException;
import by.htp.pazl.dao.impl.connection.C3P0ConnectionPool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAOImpl implements ItemDAO {
    private static final String TBL_COLUMN_NAME_SHORT = "name_short";
    private static final String TBL_COLUMN_NAME_FULL = "name_full";
    private static final String TBL_COLUMN_DESCRIPTION = "description";
    private static final String TBL_COLUMN_MANUFACTURER = "manufacturer";
    private static final String TBL_COLUMN_PRICE = "price";
    private static final String TBL_COLUMN_COUNT = "count";
    private static final String TBL_COLUMN_ID = "ID";
    private static final String TBL_COLUMN_CATEGORY_NAME = "CATEGORY_NAME";
    private static final String TBL_COLUMN_CATEGORY_DESC = "CATEGORY_DESC";
    private static final String TBL_COLUMN_STATE = "STATE";
    private static final String TBL_COLUMN_RATING = "RATING";
    private static final String TBL_COLUMN_EVENT_DATE = "event_date";
    private static final String TBL_COLUMN_USER_NAME = "name";
    private static final String TBL_COLUMN_RATE = "rate";
    private static final String TBL_COLUMN_COMMENT = "text";

    private static final C3P0ConnectionPool connectionPool = C3P0ConnectionPool.getInstance();

    private static final String GET_ITEMS_BY_CATEGORY = "SELECT i.ID, i.NAME_SHORT, i.NAME_FULL, i.DESCRIPTION, " +
            "i.manufacturer, i.PRICE, st.COUNT, dis.NAME as STATE, cat.CATEGORY_NAME, " +
            "(select IFNULL(AVG(r.rate),0) from pazl.item_reviews r where r.ITEM_ID = i.ID) as RATING " +
            "FROM pazl.items i join pazl.storage st on st.ITEM_ID = i.ID join pazl.dict_items_state dis on i.STATE_ID = dis.ID " +
            "join pazl.category cat on i.ID_CATEGORY = cat.ID where i.ID_CATEGORY = ? and st.COUNT > 0";


    private static final String GET_ALL_CATEGORIES_SQL = "select * from pazl.category";

    private static final String GET_ITEM_BY_ID = "SELECT i.ID, i.NAME_SHORT, i.NAME_FULL, i.DESCRIPTION, i.manufacturer, i.PRICE, " +
            "st.COUNT, dis.NAME as STATE, cat.CATEGORY_NAME, (select IFNULL(AVG(r.rate),0) from pazl.item_reviews r " +
            "where r.ITEM_ID = i.ID) as RATING FROM pazl.items i join pazl.storage st on st.ITEM_ID = i.ID " +
            "join pazl.dict_items_state dis on i.STATE_ID = dis.ID join pazl.category cat on i.ID_CATEGORY = cat.ID " +
            "where i.ID = ?";

    private static final String ADD_REVIEW_TO_ITEM_SQL = "insert into pazl.item_reviews(user_id,item_id,rate,text) values(?,?,?,?)";

    private static final String GET_ITEM_REVIEWS_SQL = "SELECT r.event_date, u.NAME, r.RATE, r.TEXT " +
            "FROM pazl.item_reviews r join pazl.users u on r.USER_ID = u.id where r.ITEM_ID = ? " +
            "order by r.event_date desc limit 3";


    public ItemDAOImpl()  { }


    @Override
    public List<Item> findItemsByCategory(int categoryId) throws DAOException {
        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;

        try {
            con = connectionPool.takeConnection();
            ps = con.prepareStatement(GET_ITEMS_BY_CATEGORY);
            ps.setInt(1, categoryId);

            rs = ps.executeQuery();

            if (rs == null) {
                return null;
            }

           List<Item> itemList = new ArrayList<>();

            while (rs.next()) {
                itemList.add(new Item(
                        rs.getInt(TBL_COLUMN_ID),
                        rs.getString(TBL_COLUMN_CATEGORY_NAME),
                        rs.getString(TBL_COLUMN_NAME_SHORT),
                        rs.getString(TBL_COLUMN_NAME_FULL),
                        rs.getString(TBL_COLUMN_DESCRIPTION),
                        rs.getString(TBL_COLUMN_MANUFACTURER),
                        rs.getBigDecimal(TBL_COLUMN_PRICE),
                        rs.getString(TBL_COLUMN_STATE),
                        rs.getDouble(TBL_COLUMN_RATING),
                        rs.getInt(TBL_COLUMN_COUNT)
                ));
            }
            return itemList;

        } catch (SQLException e) {
            throw new DAOException("Error while find Items", e);
        } finally {
            connectionPool.closeConnection(con, ps, rs);
        }
    }

    @Override
    public List<Category> getCategories() throws DAOException {
        Statement st = null;
        Connection con = null;
        ResultSet rs = null;

        try {
            con = connectionPool.takeConnection();
            st = con.createStatement();
            rs = st.executeQuery(GET_ALL_CATEGORIES_SQL);

            if (rs == null) {
                return null;
            }

            List<Category> categoryList = new ArrayList<>();

            while (rs.next()) {
                categoryList.add(new Category(
                        rs.getInt(TBL_COLUMN_ID),
                        rs.getString(TBL_COLUMN_CATEGORY_NAME),
                        rs.getString(TBL_COLUMN_CATEGORY_DESC)
                ));
            }

            return categoryList;

        } catch (SQLException e) {
            throw new DAOException("Error while find Categories", e);
        } finally {
            connectionPool.closeConnection(con, st, rs);
        }
    }

    @Override
    public Item getItem(int itemId) throws DAOException {
        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;

        try {
            con = connectionPool.takeConnection();
            ps = con.prepareStatement(GET_ITEM_BY_ID);
            ps.setInt(1, itemId);

            rs = ps.executeQuery();

            if (rs == null) {
                return null;
            }

            Item item = null;

            if (rs.next()) {
                item = new Item(
                        rs.getInt(TBL_COLUMN_ID),
                        rs.getString(TBL_COLUMN_CATEGORY_NAME),
                        rs.getString(TBL_COLUMN_NAME_SHORT),
                        rs.getString(TBL_COLUMN_NAME_FULL),
                        rs.getString(TBL_COLUMN_DESCRIPTION),
                        rs.getString(TBL_COLUMN_MANUFACTURER),
                        rs.getBigDecimal(TBL_COLUMN_PRICE),
                        rs.getString(TBL_COLUMN_STATE),
                        rs.getDouble(TBL_COLUMN_RATING),
                        rs.getInt(TBL_COLUMN_COUNT)
                );
            }

            return item;

        } catch (SQLException e) {
            throw new DAOException("Error while find Items", e);
        } finally {
            connectionPool.closeConnection(con, ps, rs);
        }
    }

    @Override
    public void addItemReview(int userId, int itemId, byte rate, String comment) throws DAOException {
        PreparedStatement ps = null;
        Connection con = null;

        try {
            con = connectionPool.takeConnection();
            ps = con.prepareStatement(ADD_REVIEW_TO_ITEM_SQL);
            ps.setInt(1, userId);
            ps.setInt(2, itemId);
            ps.setInt(3, rate);
            ps.setString(4, comment);

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error while dding Review", e);
        } finally {
            connectionPool.closeConnection(con, ps);
        }
    }

    @Override
    public List<Review> getItemReviews(int itemId) throws DAOException {
        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;

        try {
            con = connectionPool.takeConnection();
            ps = con.prepareStatement(GET_ITEM_REVIEWS_SQL);
            ps.setInt(1, itemId);

            rs = ps.executeQuery();

            if (rs == null) {
                return null;
            }

            List<Review> reviewList = new ArrayList<>();

            while (rs.next()) {
                reviewList.add(new Review(
                        rs.getTimestamp(TBL_COLUMN_EVENT_DATE),
                        rs.getString(TBL_COLUMN_USER_NAME),
                        rs.getByte(TBL_COLUMN_RATE),
                        rs.getString(TBL_COLUMN_COMMENT)
                ));
            }

            return reviewList;

        } catch (SQLException e) {
            throw new DAOException("Error while find reviews", e);
        } finally {
            connectionPool.closeConnection(con, ps, rs);
        }
    }
}