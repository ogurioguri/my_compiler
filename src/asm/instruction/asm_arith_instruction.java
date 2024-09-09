package asm.instruction;

import java.util.ArrayList;

import asm.section.asm_block;
import asm.ingredient.*;

public class asm_arith_instruction extends asm_instruction {
    public register rd = null;
    public register rs1 = null;
    public register rs2 = null;
    String op = null;

    public asm_arith_instruction(asm_block parent, register rd, register rs1, register rs2, String op) {
        super(parent);
        this.rd = rd;
        this.rs1 = rs1;
        this.rs2 = rs2;
        this.op = op;
    }

    @Override
    public String toString() {
        String result = switch (op) {
            case "+" -> "add";
            case "-" -> "sub";
            case "*" -> "mul";
            case "/" -> "div";
            case "%" -> "rem";
            case "^" -> "xor";
            case "|" -> "or";
            case "&" -> "and";
            case "<<" -> "sll";
            case ">>" -> "sra";
            default -> throw new RuntimeException("Arith: invalid op");
        };
        return String.format("%-8s", result) + rd + ", " + rs1 + ", " + rs2;
    }

    public register def() {
        return rd;
    }

    public register use1() {
        return rs1;
    }

    public register use2() {
        return rs2;
    }

    public void setDef(register reg) {
        rd = reg;
    }

    public void setUse1(register reg) {
        rs1 = reg;
    }

    public void setUse2(register reg) {
        rs2 = reg;
    }

}
