package features.animal;


import com.intuit.karate.junit5.Karate;

public class petRunner {

    @Karate.Test
    Karate test() {
        return Karate.run("petSwagger").tags("@pet").relativeTo(getClass());
    }


}
