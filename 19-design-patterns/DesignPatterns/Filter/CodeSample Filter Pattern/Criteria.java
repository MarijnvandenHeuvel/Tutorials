/**
 * Created by marijnvdh on 20/01/2017.
 */
import java.util.List;

@FunctionalInterface
public interface Criteria {
    public List<Person> meetCriteria(List<Person> persons);
}

