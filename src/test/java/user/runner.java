package user;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class runner {
//Desde esta clase ejecutamos todos los features que tenemos
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:user").tags("~@ignore").parallel(5);
    }

}
