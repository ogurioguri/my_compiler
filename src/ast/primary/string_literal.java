package ast.primary;



public class string_literal extends constant {
    public String value;
    public string_literal(String value) {
        super();
        this.value = value;
        this.is_string = true;
    }
    public string_literal(string_literal other) {
        super(other);
        this.value = other.value;
    }

}
