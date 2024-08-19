package IR.node;

public class class_node extends basic_node {
    public String name;
    public basic_node type;
    public basic_node value;

    public class_node(String name, basic_node type, basic_node value) {
        this.name = name;
        this.type = type;
        this.value = value;
    }

    @Override
    public String toString() {
        return "class_node{" +
                "name='" + name + '\'' +
                ", type=" + type +
                ", value=" + value +
                '}';
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
