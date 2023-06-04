import org.junit.Test;

import static org.junit.Assert.*;

public class JunitTest01 {

    @Test
    public void test01(){

        assertEquals(1,1);  //assertEquals() method'unda parantez icindeki parametreler birbirine esitse test gecer degilse kalir.
        assertTrue("Merhaba".contains("a"));  //assertTrue() method'unda parantez icindeki kosul true ise test gecer, degilse kalir.
        assertFalse(1==2);  //negative test. Parantez ici durum false donerse test gecer.False verir ve test gecer

        // Test method'lari public ve void olmak zorundadir.

    }

}
