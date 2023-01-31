package com.distribuida.servicios;

import com.distribuida.db.Book;
import io.helidon.dbclient.DbClient;
import io.helidon.dbclient.DbRow;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
@ApplicationScoped
public class ServicioBookImpl implements ServicioBook {
    @Inject
    private DbClient dbClient;

    @Override
    public List<Book> findAll() throws ExecutionException, InterruptedException {
        List<DbRow> rows = new ArrayList<DbRow>();
        List<Book> books = new ArrayList<Book>();
        rows = dbClient.execute(exec -> exec
                .createQuery("SELECT * FROM books ")
                .execute()
        ).collectList().get();
        for (DbRow row : rows) {
            Book book = new Book();
            book.setAuthor_id(row.column("author_id").as(Integer.class));
            book.setIsbn(row.column("isbn").as(String.class));
            book.setTitle(row.column("title").as(String.class));
            book.setPrice(row.column("price").as(BigDecimal.class));
            book.setId(row.column("id").as(Integer.class));
            books.add(book);
        }
        return books;
    }

    @Override
    public Book findById(int id) throws ExecutionException, InterruptedException {
        Book book = null;
        book = dbClient.execute(exec -> exec
                        .createQuery("SELECT * FROM books WHERE id =?")
                        .params(id)
                        .execute()).first()
                .map(rs -> Book
                        .builder()
                        .author_id(rs.column("author_id").as(Integer.class))
                        .isbn(rs.column("isbn").as(String.class))
                        .title(rs.column("title").as(String.class))
                        .price(rs.column("price").as(BigDecimal.class))
                        .id(rs.column("id").as(Integer.class))
                        .build())
                .get();

        return book;
    }

    @Override
    public void insert(Book book) throws ExecutionException, InterruptedException {
        dbClient.execute(exec -> exec
                        .insert("INSERT INTO books (isbn,title,price,author_id) VALUES ( ? , ?, ? , ? )",
                                book.getIsbn(), book.getTitle(), book.getPrice() , book.getAuthor_id()))
                .get();
    }
    @Override
    public void delete(int id) throws ExecutionException, InterruptedException {
        dbClient.execute(exec -> exec
                        .delete("DELETE FROM books WHERE id = ?",
                                id))
                .get();
    }

    @Override
    public void update(int id, Book book) throws ExecutionException, InterruptedException {
        dbClient.execute(exec -> exec
                        .update("UPDATE books\n" +
                                        "SET  isbn = ?, author_id = ? , title = ? , price = ?\n" +
                                        "WHERE id = ?",
                                book.getIsbn(),book.getAuthor_id() , book.getTitle(), book.getPrice(), book.getId()))
                .get();
    }
}
