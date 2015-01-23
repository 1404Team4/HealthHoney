package util;


public class currtime {

	public static void main(String[] args) {
		
		long epoch = System.currentTimeMillis()/1000;
		System.out.println(epoch);
		String time = String.valueOf(epoch)+"000000";
		System.out.println(time);
		System.out.println(System.nanoTime());
	}

}
