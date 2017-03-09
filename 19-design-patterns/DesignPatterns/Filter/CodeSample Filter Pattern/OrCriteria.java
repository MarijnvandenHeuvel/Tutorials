/**
 * Created by marijnvdh on 20/01/2017.
 */
import java.util.List;

public class OrCriteria implements Criteria {

    private Criteria criteria;
    private Criteria otherCriteria;

    public OrCriteria(Criteria criteria, Criteria otherCriteria) {
        this.criteria = criteria;
        this.otherCriteria = otherCriteria;
    }

    @Override
    public List<Person> meetCriteria(List<Person> persons) {
        List<Person> firstCriteriaItems = criteria.meetCriteria(persons); // create list of singles
        List<Person> otherCriteriaItems = otherCriteria.meetCriteria(persons); // create list of females

        for (Person person : otherCriteriaItems) { // for all persons in list of females
            if(!firstCriteriaItems.contains(person)){ // if list of singles does not contain female
                firstCriteriaItems.add(person); // add female to list of singles
            }
        }
        return firstCriteriaItems;
    }
}

