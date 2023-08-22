package user;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;
///import org.junit.jupiter.api.Test;

public class runner {
//Desde esta clase ejecutamos todos los features que tenemos

    ///se le pone de runner path la carpet donde estan alojados las clases
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:user").tags("~@ignore").parallel(5);
    }

}
