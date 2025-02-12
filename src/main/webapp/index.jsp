<%@ page import="com.javarush.zarubov.quest.entity.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javarush.zarubov.quest.service.QuestService" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
    QuestService questService = new QuestService(0, false, false);
    private List<Question> questions = questService.getQuestions();
%>
<%
    questService.choiceChecker(request.getParameter("Questions"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
    if (request.getParameter("Restart") != null && request.getParameter("Restart").equals("R")) {
        questService.setPointer(0);

        questService.setDefeat(false);
        questService.setVictory(false);
        out.println("<h1>" + questions.get(questService.getPointer()).getTitle() + "</h1>");
        out.println("<form name=\"quest\" method=\"post\">");
        out.println("<button type=\"submit\" name=\"Questions\" value=\"A\">"
                + questions.get(questService.getPointer()).getAnswerA() + "</button>");
        out.println("<button type=\"submit\" name=\"Questions\" value=\"B\">"
                + questions.get(questService.getPointer()).getAnswerB() + "</button>");
        out.println("</form>");
    } else if (questService.isVictory()) {
        out.println("<h1>" + "Победа" + "</h1>");
        out.println("<form name=\"quest\" method=\"post\">");
        out.println("<button type=\"submit\" name=\"Restart\" value=\"R\">"
                + "Начать сначала" + "</button>");
        out.println("</form>");
        out.println("<p>" + "Статистика:" + "</p>");
        out.println("<p>" + "ID: " + session.getId() + "</p>");
        out.println("<p>" + "Количество правильных ответов: " + questService.getPointer() + "</p>");
        out.println("<p>" + "Адресс: " + request.getRemoteAddr() + "</p>");
    } else if (questService.isDefeat()) {
        out.println("<h1>" + "Поражение" + "</h1>");
        out.println("<form name=\"quest\" method=\"post\">");
        out.println("<button type=\"submit\" name=\"Restart\" value=\"R\">"
                + "Начать сначала" + "</button>");
        out.println("</form>");
        out.println("<p>" + "Статистика:" + "</p>");
        out.println("<p>" + "ID: " + session.getId() + "</p>");
        out.println("<p>" + "Количество правильных ответов: " + questService.getPointer() + "</p>");
        out.println("<p>" + "Адресс: " + request.getRemoteAddr() + "</p>");
    } else {
        out.println("<h1>" + questions.get(questService.getPointer()).getTitle() + "</h1>");
        out.println("<form name=\"quest\" method=\"post\">");
        out.println("<button type=\"submit\" name=\"Questions\" value=\"A\">"
                + questions.get(questService.getPointer()).getAnswerA() + "</button>");
        out.println("<button type=\"submit\" name=\"Questions\" value=\"B\">"
                + questions.get(questService.getPointer()).getAnswerB() + "</button>");
        out.println("</form>");
    }
%>
</body>
</html>
