package ast.primary;

public class This extends primary {
    public String class_name;
    public This() {
        is_this = true;
        class_name = "";
    }
    public This(String class_name_) {
        is_this = true;
        class_name = class_name_;
    }
    public This(This other) {
        super(other);
        class_name = (other).class_name;
    }
}
