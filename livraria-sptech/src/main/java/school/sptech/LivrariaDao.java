package school.sptech;

import org.springframework.jdbc.core.JdbcTemplate;

public class LivrariaDao {

    private JdbcTemplate executor;

    public LivrariaDao() {
        DatabaseConfiguration conenxao = new DatabaseConfiguration();

    }
}
