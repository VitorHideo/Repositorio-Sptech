package school.sptech;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class DatabaseConfiguration {

    // Executor de querys
    private JdbcTemplate executor;

    // Construtor (metodo especial)
    public DatabaseConfiguration() {

        BasicDataSource dataSource= new BasicDataSource();
        dataSource.setDriverClassName("org.h2.Driver");
        dataSource.setUrl("jdbc:h2:file:./banco_teste");
        dataSource.setUsername("sa");
        dataSource.setPassword("");

        this.executor = new JdbcTemplate(dataSource);

        String sqlCreate = """
                create table if not exists livraria (
                id int primary key auto_increment,
                nome varchar(45),
                preco double
                )
                """;
        executor.execute(sqlCreate);
    }


    public JdbcTemplate getTemplate() {
        return executor;
    }
}
