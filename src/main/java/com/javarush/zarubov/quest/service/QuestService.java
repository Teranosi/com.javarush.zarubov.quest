package com.javarush.zarubov.quest.service;

import com.javarush.zarubov.quest.entity.Question;

import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

public class QuestService {
    private List<Question> questions = new ArrayList<>();
    private int pointer;
    private boolean isVictory;
    private boolean isDefeat;

    public QuestService(int pointer, boolean isVictory, boolean isDefeat) {
        this.pointer = pointer;
        this.isVictory = isVictory;
        this.isDefeat = isDefeat;
        questions.add(new Question(1, "Ты потерял память. Принять вызов НЛО?", "Принять вызов", "Отклонить вызов"));
        questions.add(new Question(2, "Ты принял вызов. Поднимаешься на мостик к капитану?", "Подняться на мостик", "Откозаться подниматься на мостик"));
        questions.add(new Question(3, "Ты поднялся на мостик. Ты кто?", "Рассказать правду о себе", "Солгать о себе"));
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public int getPointer() {
        return pointer;
    }

    public void setPointer(int pointer) {
        this.pointer = pointer;
    }

    public boolean isDefeat() {
        return isDefeat;
    }

    public void setDefeat(boolean defeat) {
        isDefeat = defeat;
    }

    public boolean isVictory() {
        return isVictory;
    }

    public void setVictory(boolean victory) {
        isVictory = victory;
    }



    public void choiceChecker(String choice) {
        if (choice != null) {
            if (pointer >= questions.size() - 1) {
                pointer++;
                isVictory = true;
            } else if (choice.equals("A")) {
                pointer++;
            } else if (choice.equals("B")) {
                isDefeat = true;
                pointer++;
            }
        }
    }
}
