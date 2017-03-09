import java.util.ArrayList;
import java.util.List;

/**
 * Created by marijnvdh on 1/02/2017.
 */
public class CriteriaMarried implements Criteria {

    @Override
    public List<Person> meetCriteria(List<Person> persons) {
        List<Person> marriedPersons = new ArrayList<>();
        for (Person person : persons) {
            if(person.getMaritalStatus().equalsIgnoreCase("MARRIED")){
                 marriedPersons.add(person);
            }
        }
        return  marriedPersons;
    }
}
