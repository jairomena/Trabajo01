package com.distribuida.config;

import io.helidon.dbclient.DbClient;
import io.helidon.config.Config;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.context.Initialized;
import jakarta.enterprise.event.Observes;
import jakarta.enterprise.inject.Produces;
import org.flywaydb.core.Flyway;

@ApplicationScoped
public class DbConfig {
    @ApplicationScoped
    @Produces
    public DbClient dbClient(){
        Config config = Config.create();
        DbClient dbClient = DbClient.builder().config(config.get("db")).build();
        return dbClient;
    }
}
