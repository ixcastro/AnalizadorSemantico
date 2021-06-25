import java_cup.runtime.DefaultSymbolFactory;
import java_cup.runtime.SymbolFactory;
import jcup.Parser;
import jflex.Lexer;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

class Main {
	private static String filePath = "Switch_Read_Write.c";

	private static Object parse(String expression) throws Exception {
		SymbolFactory symbolFactory = new DefaultSymbolFactory();
		Parser parser = new Parser(new Lexer(expression), symbolFactory);
		return parser.parse().value;
	}

	public static void main(String[] args) throws Exception {
		String fileContent = readFile(filePath);
		//System.out.println(fileContent);
		System.out.println(parse(fileContent));
	}


	public static String readFile(String filePath){
		String content = "";
		try{
			content = new String ( Files.readAllBytes( Paths.get(filePath)));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return content;
	}
}