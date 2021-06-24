
public class SemanticStack {
    public ArrayList<Record> stack = new ArrayList<>();

    public Record pop(){
        return !stack.isEmpty ? stack.remove(stack.size() - 1) : null;
    }

    public void push(Record record) {
        stack.add(record);
    }
}