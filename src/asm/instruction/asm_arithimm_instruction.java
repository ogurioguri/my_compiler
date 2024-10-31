package asm.instruction;

import asm.section.asm_block;
import asm.section.*;
import asm.ingredient.*;


public class asm_arithimm_instruction extends asm_instruction{
    public register rd = null;
    public register rs1 = null;
    String op;
    public imm immediate = null;

    public asm_arithimm_instruction(asm_block parent, register rd, register rs1, String op, imm immediate) {
        super(parent);
        this.rd = rd;
        this.rs1 = rs1;
        this.op = op;
        this.immediate = immediate;
    }

    public String toString() {
        String result = switch (op) {
            case "+" -> "addi";
            case "^" -> "xori";
            case "|" -> "ori";
            case "&" -> "andi";
            case "<<" -> "slli";
            case ">>" -> "srai";
            default -> throw new RuntimeException("ArithImm: invalid op");
        };
        return String.format("%-8s", result) + rd + ", " + rs1 + ", " + immediate.toString();
    }

    public register def() {
        return rd;
    }
    public register use1() {
        return rs1;
    }
    public void setDef(register reg) {
        rd = reg;
    }
    public void setUse1(register reg) {
        rs1 = reg;
    }
}
