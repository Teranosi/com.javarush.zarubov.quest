package com.javarush.zarubov.quest.entity;

public class Question {
    private long id;
    private String title;
    private String answerA;
    private String answerB;
    private int choice;

    public Question(long id, String title, String answerA, String answerB) {
        this.id = id;
        this.title = title;
        this.answerA = answerA;
        this.answerB = answerB;
    }
    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getAnswerA() {
        return answerA;
    }

    public String getAnswerB() {
        return answerB;
    }

    public void setChoice(int choice) {
        this.choice = choice;
    }
}
