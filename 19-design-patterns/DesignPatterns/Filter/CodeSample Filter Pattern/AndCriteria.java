/**
 * Created by marijnvdh on 20/01/2017.
 */
import java.util.List;

public class AndCriteria implements Criteria {

    private Criteria criteria;
    private Criteria otherCriteria;

    public AndCriteria(Criteria criteria, Criteria otherCriteria) {
        this.criteria = criteria;
        this.otherCriteria = otherCriteria;
    }

    @Override
    public List<Person> meetCriteria(List<Person> persons) {
        List<Person> firstCriteriaPersons = criteria.meetCriteria(persons); // create list of singles from list of persons
        return otherCriteria.meetCriteria(firstCriteriaPersons); // create & return list of females from list of singles
    }
}

