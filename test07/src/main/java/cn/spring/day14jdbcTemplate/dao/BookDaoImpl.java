package cn.spring.day14jdbcTemplate.dao;

import cn.spring.day14jdbcTemplate.entity.Book;
import cn.spring.day14jdbcTemplate.util.RowMapperUtil;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import java.util.List;

public class BookDaoImpl extends JdbcDaoSupport implements BookDao {
    //查询所有图书
    @Override
    public List<Book> findAllBooks() {
        String sql = "select * from book";
        List<Book> list = null;
        list = this.getJdbcTemplate().query(sql, new RowMapperUtil<Book>(){});
        return list;
    }

    //添加图书
    @Override
    public int addBook(Book book) {
        String sql = "insert into book values (?,?,?)";
        int update = this.getJdbcTemplate().update(sql, book.getBookid(), book.getBookname(), book.getBookprice());
        return update;
    }

    //修改图书
    @Override
    public int updataBook(Book book) {
        String sql = "update book set bookName = ? where bookid = ?";
        int update = this.getJdbcTemplate().update(sql,book.getBookname(),book.getBookid());
        return update;
    }

    //删除图书
    @Override
    public int deleteBook(Integer bookid) {
        String sql = "delete from book where bookid = ?";
        int update = this.getJdbcTemplate().update(sql, bookid);
        return update;
    }

}
