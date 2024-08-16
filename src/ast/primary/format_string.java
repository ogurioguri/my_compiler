package ast.primary;
import java.util.ArrayList;
import ast.expression.basic_expression;

public class format_string extends constant {
    public String first;
    public String third;
    public ArrayList<String> part1;
    public ArrayList<basic_expression> part2;
    public format_string(String begin , String end,ArrayList<String> part1,ArrayList<basic_expression> part2) {
        super();
        this.first = begin;
        this.third = end;
        this.part1 = part1;
        this.part2 = part2;
        this.is_format_string = true;
    }
    public format_string(format_string other) {
        super(other);
        this.part1 = other.part1;
        this.part2 = other.part2;
        this.first = other.first;
        this.third = other.third;

    }
}
