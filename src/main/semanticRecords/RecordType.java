
public class RecordType extends Record {
    public String type;

    public RecordType(String type, int line, int column) {
        super(line, column);
        this.type = type;
    }
}