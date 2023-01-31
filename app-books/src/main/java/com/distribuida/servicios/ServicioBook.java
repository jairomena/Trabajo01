package com.distribuida.servicios;

import com.distribuida.db.Book;
import io.helidon.dbclient.DbClient;
import io.helidon.dbclient.DbRow;
import jakarta.inject.Inject;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

public interface ServicioBook {

    List<Book> findAll() throws ExecutionException, InterruptedException;
    Book findById(int id) throws ExecutionException, InterruptedException;
    void insert(Book book) throws ExecutionException, InterruptedException;
    void delete(int id) throws ExecutionException, InterruptedException;
    void update(int id, Book book) throws ExecutionException, InterruptedException;
}
