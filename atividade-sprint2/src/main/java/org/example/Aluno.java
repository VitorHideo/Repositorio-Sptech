package org.example;

import java.util.ArrayList;
import java.util.List;

public class Aluno {

    private List<Double> listaNotas;
    private Integer ra;
    private String nome;

    public Aluno(String nome, Integer ra) {
        this.nome =  nome;
        this.ra = ra;
        this.listaNotas = new ArrayList<>();
    }

    public void adicionarNota (Double valor) {
        listaNotas.add(valor);
    }

    public Double calcularMedia () {

        Double totalNotas = 0.0;
        Integer qtdNotas = listaNotas.size();

        if (qtdNotas == 0) {
            return 0.0;
        }
        for (Double nota: listaNotas) {
            totalNotas += nota;
        }
        return totalNotas / qtdNotas;
    }

    public List<Double> getNotas() {
        return listaNotas;
    }

    public Integer getRa() {
        return ra;
    }

    public String getNome() {
        return nome;
    }
}
