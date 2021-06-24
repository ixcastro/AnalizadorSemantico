
public class RecordOP extends Record {
    public String operator;

    public RecordOP (String operator, int line, int column) {
        super(line, column);
        this.operator = operator;
    }
}