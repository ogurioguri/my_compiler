package asm.instruction;

import java.util.ArrayList;
import asm.section.asm_block;
import asm.ingredient.*;

public class asm_br_instruction extends asm_instruction {
    public register rs1 = null,rs2 = null;
    String label = null;
    String op = null;

    public asm_br_instruction(asm_block parent, register rs1, register rs2, String label, String op) {
        super(parent);
        this.rs1 = rs1;
        this.rs2 = rs2;
        this.label = label;
        this.op = op;
    }

    public String toString() {
        String result = switch (op) {
            case "==" -> "beq";
            case "!=" -> "bne";
            case "<" -> "blt";
            case ">=" -> "bge";
            case ">" -> "bgt";
            case "<=" -> "ble";
            default -> throw new RuntimeException("Br: invalid op");
        };
        return String.format("%-8s", (rs2 == null) ? result + "z" : result) + " " + rs1 + ", " + ((rs2 == null) ? "" : (rs2 + ", ")) + label;
    }

    public register use1() {
        return rs1;
    }

    public register use2() {
        return rs2;
    }

    public void setUse1(register reg) {
        rs1 = reg;
    }

    public void setUse2(register reg) {
        rs2 = reg;
    }

    public register def() {
        return null;
    }

    public void setDef(register reg) {
        throw new RuntimeException("Br has no def");
    }
}
