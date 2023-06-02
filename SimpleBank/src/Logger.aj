import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public aspect Logger {

	
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    String transactionType;
    
	//Aspecto de ejempplo
	pointcut success() : call(* com.bank.Bank.createUser()) ;
	after(): success() {
		System.out.println("\n****User created ****\n");
	}
	
	
	//Aspecto de Realizar Transacción
	pointcut transaction() : call(* com.bank.Bank.moneyMakeTransaction()) ;
	after(): transaction() {
		transactionType = "Realizar transacción (Depósito)";
		logFile(transactionType);}
	
	pointcut retiro() : call(* com.bank.Bank.moneyWithdrawal()) ;
	after(): retiro() {
		transactionType = "Retiro de dinero";
		logFile(transactionType);}
	
	// Método para guardar la transacción en el archivo de log.txt
	
	private void logFile(String transactionType) {
		
		try {
			BufferedWriter bf = new BufferedWriter(new FileWriter("log.txt", true));
			String fechayhora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cal.getTime());
			bf.write("Tipo de transacción: " + transactionType + "\n");
			bf.write("Fecha y hora: " + fechayhora + "\n");
            bf.write("------------------------------------\n");
            bf.close();
            if (transactionType == "Realizar transacción (Depósito)") {
            	System.out.println("\n****TRANSACCIÓN REALIZADA :D ****\n");
            } else {
            	
            	System.out.println("\n****RETIRO REALIZADO CON EXITO:D ****\n");
            }
            	
		}catch(IOException e) {
			
			System.out.println("Error al registrar la transaccion");
		}
	
		
	}
}
