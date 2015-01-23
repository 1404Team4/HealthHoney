package control;

public class CommandFactory {

	private CommandFactory() {
	}

	private static CommandFactory instance = new CommandFactory();

	public static CommandFactory getInstance() {
		return instance;
	}

	public Command createCommand(String cmd) {
		// System.out.println("cmd : "+cmd);

		if ("INDEX".equals(cmd))
			return new IndexCommand();
		else if ("CALENDAR".equals(cmd))
			return new CalendarCommand();
		else if ("CALEVENT".equals(cmd))
			return new EventCommand();
		else if ("ADDCALEVENT".equals(cmd))
			return new AddEventCommand();
		else if ("CLOSER".equals(cmd))
			return new closeCommand();
		else if ("TABLE".equals(cmd))
			return new TableCommand();
		else if ("USER".equals(cmd))
			return new UserCommand();
		else
			return new IndexCommand();
	}
}
