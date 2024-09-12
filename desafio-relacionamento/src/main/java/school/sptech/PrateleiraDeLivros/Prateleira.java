package school.sptech.PrateleiraDeLivros;

import java.util.ArrayList;
import java.util.List;

public class Prateleira {

    private List<Livro> livros;
    private Integer limite;
    private Double peso;

    public Prateleira(Integer limite, Double peso) {
        this.livros = new ArrayList<>();
        this.limite = limite;
        this.peso = peso;
    }

    public void adicionarLivro (Livro livro) {
        if (livros.size() < limite) {
            livros.add(livro);
        } else {
            System.out.println("Sem espaço");
        }
    }

    public void removerLivro (String codigo) {

        for (int i = 0; i < this.livros.size(); i++) {
            Livro livroDaVez = this.livros.get(i);

            if (livroDaVez.getCodigo().equals(codigo)) {
                this.livros.remove(livroDaVez);
            }
        }
    }

    public Integer quantidadeLivros() {
        return livros.size();
    }

    public Double getPesoTotal () {
        Double pesoTotal = 0.0;
        for (int i = 0; i < livros.size(); i++) {
            pesoTotal += livros.get(i).calcularPeso();

        }
        return pesoTotal + peso;
    }

    public Livro getLivroPorNome (String nome) {
        for (Livro livro : livros) {
            if (livro.getNome().equalsIgnoreCase(nome)) {
                return livro;
            }
        }
        return null;
    }


}
