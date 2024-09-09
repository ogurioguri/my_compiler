package IR.node;
import IR.IR_visitor;
import IR.entity.ir_global_variable;

public class ir_stringliteral_node extends basic_node {
    public String value;
    public String orgValue;
    public ir_global_variable ptr;

    public ir_stringliteral_node(ir_global_variable ptr, String value, String orgValue) {
        this.ptr = ptr;
        this.value = value;
        this.orgValue = orgValue;
    }

    public String printStr() {
        StringBuilder ret = new StringBuilder();
        for (int i = 0; i < value.length(); ++i) {
            char c = value.charAt(i);
            switch (c) {
                case '\n' -> ret.append("\\0A");
                case '\"' -> ret.append("\\22");
                case '\\' -> ret.append("\\\\");
                default -> ret.append(c);
            }
        }
        return ret.append("\\00").toString();
    }

    @Override
    public String toString() {
        return ptr.toString() +  " = constant [" + (value.length() + 1) + " x i8] c\"" + printStr() + "\"\n";
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);

    }
}
