
public class RecordID extends Record {
    public String name;

    public RecordID (String name, int line, int column) {
        super(line, column);
        this.name = name;
    }
}