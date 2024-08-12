package ast.primary;
import java.util.ArrayList;
import ast.expression.*;
public class array_literal extends constant{
    public ArrayList<basic_expression> value;
    public array_literal(ArrayList<basic_expression> value) {
        super();
        this.value = value;
        this.is_array_literal = true;
    }
    public array_literal() {
        super();
        this.value = new ArrayList<basic_expression>();
        this.is_array_literal = true;
    }
    public array_literal(array_literal other) {
        super(other);
        this.value = other.value;
    }
}
