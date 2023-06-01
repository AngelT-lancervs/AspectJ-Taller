import java.io.File;
import java.util.Calendar;

public aspect Logger {

	
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    
    
	//Aspecto de ejempplo
	pointcut success() : call(* com.bank.Bank.createUser()) ;
	after(): success() {
		System.out.println("\n****User created ****\n");
	}
	
	
	
}
