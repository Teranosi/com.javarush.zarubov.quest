import com.javarush.zarubov.quest.entity.Question;
import com.javarush.zarubov.quest.service.QuestService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class QuestTest {
    private QuestService questService;
    private List<Question> questions;

    @BeforeEach
    void setUp() {
        questService = new QuestService(0, false, false);
        questions = questService.getQuestions();
    }

    @Test
    void testInitialState() {
        assertEquals(0, questService.getPointer());
        assertFalse(questService.isVictory());
        assertFalse(questService.isDefeat());
        assertEquals(3, questions.size());
    }

    @Test
    void testChoiceA() {
        questService.choiceChecker("A");
        assertEquals(1, questService.getPointer());
        assertFalse(questService.isVictory());
        assertFalse(questService.isDefeat());
    }

    @Test
    void testChoiceB() {
        questService.choiceChecker("B");
        assertEquals(1, questService.getPointer());
        assertFalse(questService.isVictory());
        assertTrue(questService.isDefeat());
    }

    @Test
    void testVictoryCondition() {
        questService.choiceChecker("A");
        questService.choiceChecker("A");
        questService.choiceChecker("A");
        assertTrue(questService.isVictory());
        assertFalse(questService.isDefeat());
    }

    @Test
    void testInvalidChoice() {
        questService.choiceChecker("C");
        assertEquals(0, questService.getPointer());
        assertFalse(questService.isVictory());
        assertFalse(questService.isDefeat());
    }

    @Test
    void testNullChoice() {
        questService.choiceChecker(null);
        assertEquals(0, questService.getPointer());
        assertFalse(questService.isVictory());
        assertFalse(questService.isDefeat());
    }
}
