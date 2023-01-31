package com.distribuida.servicios;

import com.distribuida.db.Author;
import javax.enterprise.context.ApplicationScoped;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

@ApplicationScoped
public class AuthorRepository implements PanacheRepository<Author> {
}
