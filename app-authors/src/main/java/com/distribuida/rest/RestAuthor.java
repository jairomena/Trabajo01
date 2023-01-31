package com.distribuida.rest;

import javax.ws.rs.*;
import java.util.List;
import javax.inject.Inject;
import com.distribuida.db.Author;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.MediaType;
import javax.transaction.Transactional;
import javax.enterprise.context.ApplicationScoped;
import com.distribuida.servicios.AuthorRepository;

@ApplicationScoped
@Path("/authors")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Transactional
public class RestAuthor {
    @Inject
    AuthorRepository repository;

    @GET
    public List<Author> finAll(){
        return repository.listAll();
    }

    @GET
    @Path("/{id}")
    public Author finById(@PathParam("id") long id){
        return repository.findById(id);
    }

    @POST
    public Response insert(Author author) {
        repository.persist(author);
        return Response.status(Response.Status.CREATED).build();
    }

    @DELETE
    @Path("/{id}")
    public Response delete(@PathParam("id") long id) {
        repository.deleteById(id);
        return Response.status((Response.Status.OK)).build();
    }
    @PUT
    @Path("/{id}")
    public Response update( @PathParam("id") long id,Author author) {
        Author author1 = repository.findById(id);
        author1.setLast_name(author.getLast_name());
        author1.setFirst_name(author.getFirst_name());
        return Response.status((Response.Status.OK)).build();
    }
}
