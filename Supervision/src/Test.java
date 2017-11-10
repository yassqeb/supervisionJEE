import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.InetAddress;
import java.net.UnknownHostException;


public class Test {

	/**
     * @param args
     */
    public static void main(String[] args) {
        printUsage();
		
        getIpAddress();
        
        System.out.println(getComputerFullName());
 
    }
    
    public static void getIpAddress(){
    	String ip = null;
		try {
			ip = InetAddress.getLocalHost().getHostAddress().toString();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("Votre IP est : " + ip);
    }
     
    public static String getComputerFullName() {
        String hostName = null;
        try {
          final InetAddress addr = InetAddress.getLocalHost();
          hostName = new String(addr.getHostName());
        } catch(final Exception e) {
        }
        return hostName;}
    
    private static void printUsage() {
      OperatingSystemMXBean operatingSystemMXBean = ManagementFactory.getOperatingSystemMXBean();
      for (Method method : operatingSystemMXBean.getClass().getDeclaredMethods()) {
        method.setAccessible(true);
        if (method.getName().startsWith("get")
            && Modifier.isPublic(method.getModifiers())) {
                Object value;
            try {
                value = method.invoke(operatingSystemMXBean);
            } catch (Exception e) {
                value = e;
            } // try
            System.out.println(method.getName() + " = " + value);
      
        } // if
    
      } // for
    
    }
 
}
