package school.sptech;

import org.springframework.jdbc.core.JdbcTemplate;

public class LivrariaDao {

    private JdbcTemplate executor;
    DatabaseConfiguration conenxao = new DatabaseConfiguration();
    LivrariaEntity entidade = new LivrariaEntity();

    public String cadastrarLivro (String nome, Double preco) {
        String sqlInsert = "INSERT INTO livraria (nome,preco) VALUES (?,?)";
        executor.update (sqlInsert, nome, preco);
    }

    public String exibirLivros () {
        String sqlSelect = "SELECT * FROM livraria";
        List<Livro> livros = executor.query(sqlSelect, new BeanPropertyRowMapper<>(Livro.class));
        for (Livro livro : livros) {
            System.out.println();
        }
    }

    public String atualizarLivro (Integer id, String nome, Double preco ) {
        String sqlUpdate = "UPDATE livraria SET nome = ? , preco = ? WHERE id = ?"
        executor.update (sqlUpdate, nome, preco, id)
    }

    public String deletarLivro (Integer id) {
        String sqlDelete = "DELETE FROM livraria WHERE id = ?"
        executor.update (sqlDelete, id)
    }

    public String exibirPeloNome (String nome) {
        String sqlSelect = "SELECT * FROM livraria WHERE nome = ?";
        
    }

}
