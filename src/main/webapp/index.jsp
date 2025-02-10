<%@ page import="com.javarush.zarubov.quest.entity.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    int pointer = 0;
    String choice;
    boolean isVictory;
    boolean isDefeat;
%>
<%
    List<Question> questions = new ArrayList<>();
    questions.add(new Question(1, "Ты потерял память. Принять вызов НЛО?", "Принять вызов", "Отклонить вызов"));
    questions.add(new Question(2, "Ты принял вызов. Поднимаешься на мостик к капитану?", "Подняться на мостик", "Откозаться подниматься на мостик"));
    questions.add(new Question(3, "Ты поднялся на мостик. Ты кто?", "Рассказать правду о себе", "Солгать о себе"));
    if (request.getParameter("Questions") != null) {
        choice = request.getParameter("Questions");
        if (pointer >= questions.size() - 1) {
            pointer++;
            isVictory = true;
        } else if (choice.equals("A")) {
            choice = "A";
            pointer++;
        } else if (choice.equals("B")) {
            choice = "B";
            isDefeat = true;
            pointer++;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
    System.out.println(request.getParameter("Restart"));
    if (request.getParameter("Restart") != null && request.getParameter("Restart").equals("R")) {
        pointer = 0;
        choice = null;
        isVictory = false;
        isDefeat = false;
        out.println("<h1>" + questions.get(pointer).getTitle() + "</h1>");
        out.println("<form name=\"quest\" method=\"post\">");
        out.println("<button type=\"submit\" name=\"Questions\" value=\"A\">"
                + questions.get(pointer).getAnswerA() + "</button>");
        out.println("<button type=\"submit\" name=\"Questions\" value=\"B\">"
                + questions.get(pointer).getAnswerB() + "</button>");
        out.println("</form>");
    } else if (isVictory) {
        out.println("<h1>" + "Победа" + "</h1>");
        out.println("<form name=\"quest\" method=\"post\">");
        out.println("<button type=\"submit\" name=\"Restart\" value=\"R\">"
                + "Начать сначала" + "</button>");
        out.println("</form>");
        out.println("<p>" + "Статистика:" + "</p>");
        out.println("<p>" + "ID: " + session.getId() + "</p>");
        out.println("<p>" + "Количество правильных ответов: " + pointer + "</p>");
        out.println("<p>" + "Адресс: " + request.getRemoteAddr() + "</p>");
    } else if (isDefeat) {
        out.println("<h1>" + "Поражение" + "</h1>");
        out.println("<form name=\"quest\" method=\"post\">");
        out.println("<button type=\"submit\" name=\"Restart\" value=\"R\">"
                + "Начать сначала" + "</button>");
        out.println("</form>");
        out.println("<p>" + "Статистика:" + "</p>");
        out.println("<p>" + "ID: " + session.getId() + "</p>");
        out.println("<p>" + "Количество правильных ответов: " + pointer + "</p>");
        out.println("<p>" + "Адресс: " + request.getRemoteAddr() + "</p>");
    } else {
        out.println("<h1>" + questions.get(pointer).getTitle() + "</h1>");
        out.println("<form name=\"quest\" method=\"post\">");
        out.println("<button type=\"submit\" name=\"Questions\" value=\"A\">"
                + questions.get(pointer).getAnswerA() + "</button>");
        out.println("<button type=\"submit\" name=\"Questions\" value=\"B\">"
                + questions.get(pointer).getAnswerB() + "</button>");
        out.println("</form>");
    }
%>
</body>
</html>
