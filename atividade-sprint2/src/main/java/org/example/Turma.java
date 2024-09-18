package org.example;

import java.util.ArrayList;
import java.util.List;

public class Turma {

    private List<Aluno> listaAlunos;

    public Turma() {
        this.listaAlunos = new ArrayList<>();
    }

    public void adicionarAluno(Aluno aluno) {
        listaAlunos.add(aluno);
    }

    public Aluno getAlunoPorRa(Integer ra) {
        for (Aluno aluno: listaAlunos) {
            if (aluno.getRa().equals(ra)) {
                return aluno;
            }
        }
        return null;
    }

    public List<Aluno> getAlunoPorNome(String nome) {

        List<Aluno> listaAlunosEncontrados = new ArrayList<>();

        for (Aluno aluno : listaAlunos) {
            if (aluno.getNome().toLowerCase().contains(nome.toLowerCase())) {
                listaAlunosEncontrados.add(aluno);
            }
        }
        return listaAlunosEncontrados;
    }

    public Aluno getAlunoComMaiorMedia() {

        if (listaAlunos.isEmpty()) {
            return null;
        }
        Aluno maiorMedia = listaAlunos.get(0);
        for (Aluno aluno : listaAlunos) {
            if (aluno.calcularMedia() > maiorMedia.calcularMedia()) {
                maiorMedia = aluno;
            }
        }
        return maiorMedia;
    }

    public Aluno getAlunoComMenorMedia() {

        if (listaAlunos.isEmpty()) {
            return null;
        }
        Aluno menorMedia = listaAlunos.get(0);
        for (Aluno aluno : listaAlunos) {
            if (aluno.calcularMedia() < menorMedia.calcularMedia()) {
                menorMedia = aluno;
            }
        }
        return menorMedia;
    }

    public Double calcularMediaDaTurma() {

        if (listaAlunos.isEmpty()) {
            return 0.0;
        }

        Double somaMedia = 0.0;
        Integer qtdAlunos = listaAlunos.size();

        for (Aluno aluno : listaAlunos) {
            somaMedia += aluno.calcularMedia();
        }
        return somaMedia / qtdAlunos;
    }

    public Double getMediaPorRa(Integer ra) {

        Aluno aluno = getAlunoPorRa(ra);

        if (aluno != null) {
            return aluno.calcularMedia();
        } else {
            return 0.0;
        }
    }

    public Double getMediana() {

        if (listaAlunos.isEmpty()) {
            return 0.0;
        }

        List<Double> listaMedias = new ArrayList<>();
        for (Aluno aluno : listaAlunos) {
            listaMedias.add(aluno.calcularMedia());
        }

        listaMedias.sort(Double::compareTo);

        Integer qtdMedias = listaMedias.size();

        // Caso a qtd de medias por par, para calcular a mediana é preciso somar os dois números do
        // meio e dividir por dois, caso a qtd for impar basta pegar o número do meio
        if (qtdMedias % 2 == 0) {
            return (listaMedias.get(qtdMedias / 2 - 1) + listaMedias.get(qtdMedias / 2)) / 2.0;
        } else {
            return listaMedias.get(qtdMedias / 2);
        }
    }

    
}
