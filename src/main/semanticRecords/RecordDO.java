
public class RecordDO extends Record {
    public String type;
    public String value;

    public RecordDO (String type, String value, int line, int column) {
        super(line, column);
        this.type = type;
        this.value = value;
    }
}