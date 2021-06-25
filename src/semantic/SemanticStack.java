
public class SemanticStack {
    public ArrayList<Record> stack = new ArrayList<>();

    public Record pop(){
        return !stack.isEmpty ? stack.remove(stack.size() - 1) : null;
    }

    public void push(Record record) {
        stack.add(record);
    }

    public String toString() {
        String msg ="";
        for (Record record : stack) {
            msg += record.line;
        }
        return msg;
    }
}