
import IR.IRBuilder;
import IR.ir_program;
import frontend.Ast_builder;
import ast.*;
import org.antlr.v4.runtime.CharStream;
import parser.*;
import util.*;
import frontend.*;
import asm.*;
import asm.section.*;
import asm.ingredient.*;
import backend.*;
import middle.IR_optimize;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.*;


public class Main {
    public static void main(String[] args) throws Exception{
//        String name = "src/test.mx";
//        InputStream input = new FileInputStream(name);
//        PrintStream out = new PrintStream(new FileOutputStream("src/test.s"));
//        System.setOut(out);
        CharStream input = CharStreams.fromStream(System.in);
        String k = "\t.text\n" +
                "\t.attribute\t4, 16\n" +
                "\t.attribute\t5, \"rv32i2p0_m2p0_a2p0_c2p0\"\n" +
                "\t.file\t\"builtin.c\"\n" +
                "\t.globl\tprint\n" +
                "\t.p2align\t1\n" +
                "\t.type\tprint,@function\n" +
                "print:\n" +
                "\tmv\ta1, a0\n" +
                "\tlui\ta0, %hi(.L.str)\n" +
                "\taddi\ta0, a0, %lo(.L.str)\n" +
                "\ttail\tprintf\n" +
                ".Lfunc_end0:\n" +
                "\t.size\tprint, .Lfunc_end0-print\n" +
                "\n" +
                "\t.globl\tprintln\n" +
                "\t.p2align\t1\n" +
                "\t.type\tprintln,@function\n" +
                "println:\n" +
                "\tmv\ta1, a0\n" +
                "\tlui\ta0, %hi(.L.str.1)\n" +
                "\taddi\ta0, a0, %lo(.L.str.1)\n" +
                "\ttail\tprintf\n" +
                ".Lfunc_end1:\n" +
                "\t.size\tprintln, .Lfunc_end1-println\n" +
                "\n" +
                "\t.globl\tprintInt\n" +
                "\t.p2align\t1\n" +
                "\t.type\tprintInt,@function\n" +
                "printInt:\n" +
                "\tmv\ta1, a0\n" +
                "\tlui\ta0, %hi(.L.str.2)\n" +
                "\taddi\ta0, a0, %lo(.L.str.2)\n" +
                "\ttail\tprintf\n" +
                ".Lfunc_end2:\n" +
                "\t.size\tprintInt, .Lfunc_end2-printInt\n" +
                "\n" +
                "\t.globl\tprintlnInt\n" +
                "\t.p2align\t1\n" +
                "\t.type\tprintlnInt,@function\n" +
                "printlnInt:\n" +
                "\tmv\ta1, a0\n" +
                "\tlui\ta0, %hi(.L.str.3)\n" +
                "\taddi\ta0, a0, %lo(.L.str.3)\n" +
                "\ttail\tprintf\n" +
                ".Lfunc_end3:\n" +
                "\t.size\tprintlnInt, .Lfunc_end3-printlnInt\n" +
                "\n" +
                "\t.globl\t_malloc_array\n" +
                "\t.p2align\t1\n" +
                "\t.type\t_malloc_array,@function\n" +
                "_malloc_array:\n" +
                "\taddi\tsp, sp, -16\n" +
                "\tsw\tra, 12(sp)\n" +
                "\tsw\ta1, 8(sp)\n" +
                "\tmul\ta0, a1, a0\n" +
                "\taddi\ta0, a0, 4\n" +
                "\tcall\tmalloc\n" +
                "\tlw\ta1, 8(sp)\n" +
                "\tsw\ta1, 0(a0)\n" +
                "\taddi\ta0, a0, 4\n" +
                "\tlw\tra, 12(sp)\n" +
                "\taddi\tsp, sp, 16\n" +
                "\tret\n" +
                ".Lfunc_end4:\n" +
                "\t.size\t_malloc_array, .Lfunc_end4-_malloc_array\n" +
                "\n" +
                "\t.globl\t_malloc\n" +
                "\t.p2align\t1\n" +
                "\t.type\t_malloc,@function\n" +
                "_malloc:\n" +
                "\ttail\tmalloc\n" +
                ".Lfunc_end5:\n" +
                "\t.size\t_malloc, .Lfunc_end5-_malloc\n" +
                "\n" +
                "\t.globl\tgetString\n" +
                "\t.p2align\t1\n" +
                "\t.type\tgetString,@function\n" +
                "getString:\n" +
                "\taddi\tsp, sp, -16\n" +
                "\tsw\tra, 12(sp)\n" +
                "\tli\ta0, 256\n" +
                "\tcall\tmalloc\n" +
                "\tmv\ta1, a0\n" +
                "\tsw\ta1, 8(sp)\n" +
                "\tlui\ta0, %hi(.L.str)\n" +
                "\taddi\ta0, a0, %lo(.L.str)\n" +
                "\tcall\tscanf\n" +
                "\tlw\ta0, 8(sp)\n" +
                "\tlw\tra, 12(sp)\n" +
                "\taddi\tsp, sp, 16\n" +
                "\tret\n" +
                ".Lfunc_end6:\n" +
                "\t.size\tgetString, .Lfunc_end6-getString\n" +
                "\n" +
                "\t.globl\tgetInt\n" +
                "\t.p2align\t1\n" +
                "\t.type\tgetInt,@function\n" +
                "getInt:\n" +
                "\taddi\tsp, sp, -16\n" +
                "\tsw\tra, 12(sp)\n" +
                "\tlui\ta0, %hi(.L.str.2)\n" +
                "\taddi\ta0, a0, %lo(.L.str.2)\n" +
                "\taddi\ta1, sp, 8\n" +
                "\tcall\tscanf\n" +
                "\tlw\ta0, 8(sp)\n" +
                "\tlw\tra, 12(sp)\n" +
                "\taddi\tsp, sp, 16\n" +
                "\tret\n" +
                ".Lfunc_end7:\n" +
                "\t.size\tgetInt, .Lfunc_end7-getInt\n" +
                "\n" +
                "\t.globl\ttoString\n" +
                "\t.p2align\t1\n" +
                "\t.type\ttoString,@function\n" +
                "toString:\n" +
                "\taddi\tsp, sp, -16\n" +
                "\tsw\tra, 12(sp)\n" +
                "\tsw\ta0, 4(sp)\n" +
                "\tli\ta0, 12\n" +
                "\tcall\tmalloc\n" +
                "\tlw\ta2, 4(sp)\n" +
                "\tsw\ta0, 8(sp)\n" +
                "\tlui\ta1, %hi(.L.str.2)\n" +
                "\taddi\ta1, a1, %lo(.L.str.2)\n" +
                "\tcall\tsprintf\n" +
                "\tlw\ta0, 8(sp)\n" +
                "\tlw\tra, 12(sp)\n" +
                "\taddi\tsp, sp, 16\n" +
                "\tret\n" +
                ".Lfunc_end8:\n" +
                "\t.size\ttoString, .Lfunc_end8-toString\n" +
                "\n" +
                "\t.globl\t_string.length\n" +
                "\t.p2align\t1\n" +
                "\t.type\t_string.length,@function\n" +
                "_string.length:\n" +
                "\taddi\tsp, sp, -16\n" +
                "\tsw\ta0, 8(sp)\n" +
                "\tli\ta0, 0\n" +
                "\tsw\ta0, 12(sp)\n" +
                "\tj\t.LBB9_1\n" +
                ".LBB9_1:\n" +
                "\tlw\ta1, 12(sp)\n" +
                "\tlw\ta0, 8(sp)\n" +
                "\tsw\ta1, 4(sp)\n" +
                "\tadd\ta0, a0, a1\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\taddi\ta2, a1, 1\n" +
                "\tli\ta1, 0\n" +
                "\tsw\ta2, 12(sp)\n" +
                "\tbne\ta0, a1, .LBB9_1\n" +
                "\tj\t.LBB9_2\n" +
                ".LBB9_2:\n" +
                "\tlw\ta0, 4(sp)\n" +
                "\taddi\tsp, sp, 16\n" +
                "\tret\n" +
                ".Lfunc_end9:\n" +
                "\t.size\t_string.length, .Lfunc_end9-_string.length\n" +
                "\n" +
                "\t.globl\t_string.substring\n" +
                "\t.p2align\t1\n" +
                "\t.type\t_string.substring,@function\n" +
                "_string.substring:\n" +
                "\taddi\tsp, sp, -32\n" +
                "\tsw\tra, 28(sp)\n" +
                "\tsw\ta1, 8(sp)\n" +
                "\tsw\ta0, 12(sp)\n" +
                "\tsub\ta0, a2, a1\n" +
                "\tsw\ta0, 16(sp)\n" +
                "\taddi\ta0, a0, 1\n" +
                "\tcall\tmalloc\n" +
                "\tlw\ta1, 16(sp)\n" +
                "\tsw\ta0, 20(sp)\n" +
                "\tli\ta0, 0\n" +
                "\tmv\ta2, a0\n" +
                "\tsw\ta2, 24(sp)\n" +
                "\tblt\ta0, a1, .LBB10_2\n" +
                "\tj\t.LBB10_1\n" +
                ".LBB10_1:\n" +
                "\tlw\ta0, 20(sp)\n" +
                "\tlw\ta1, 16(sp)\n" +
                "\tadd\ta2, a0, a1\n" +
                "\tli\ta1, 0\n" +
                "\tsb\ta1, 0(a2)\n" +
                "\tlw\tra, 28(sp)\n" +
                "\taddi\tsp, sp, 32\n" +
                "\tret\n" +
                ".LBB10_2:\n" +
                "\tlw\ta1, 16(sp)\n" +
                "\tlw\ta0, 24(sp)\n" +
                "\tlw\ta3, 20(sp)\n" +
                "\tlw\ta2, 12(sp)\n" +
                "\tlw\ta4, 8(sp)\n" +
                "\tadd\ta4, a4, a0\n" +
                "\tadd\ta2, a2, a4\n" +
                "\tlb\ta2, 0(a2)\n" +
                "\tadd\ta3, a3, a0\n" +
                "\tsb\ta2, 0(a3)\n" +
                "\taddi\ta0, a0, 1\n" +
                "\tmv\ta2, a0\n" +
                "\tsw\ta2, 24(sp)\n" +
                "\tbeq\ta0, a1, .LBB10_1\n" +
                "\tj\t.LBB10_2\n" +
                ".Lfunc_end10:\n" +
                "\t.size\t_string.substring, .Lfunc_end10-_string.substring\n" +
                "\n" +
                "\t.globl\t_string.parseInt\n" +
                "\t.p2align\t1\n" +
                "\t.type\t_string.parseInt,@function\n" +
                "_string.parseInt:\n" +
                "\taddi\tsp, sp, -32\n" +
                "\tsw\ta0, 12(sp)\n" +
                "\tlbu\ta1, 0(a0)\n" +
                "\taddi\ta1, a1, -45\n" +
                "\tseqz\ta3, a1\n" +
                "\tmv\ta1, a3\n" +
                "\tsw\ta1, 16(sp)\n" +
                "\tadd\ta0, a0, a3\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\tli\ta1, 0\n" +
                "\tmv\ta2, a1\n" +
                "\tmv\ta4, a0\n" +
                "\tsw\ta4, 20(sp)\n" +
                "\tsw\ta3, 24(sp)\n" +
                "\tsw\ta2, 28(sp)\n" +
                "\tbeq\ta0, a1, .LBB11_2\n" +
                "\tj\t.LBB11_1\n" +
                ".LBB11_1:\n" +
                "\tlw\ta2, 28(sp)\n" +
                "\tlw\ta1, 24(sp)\n" +
                "\tlw\ta3, 20(sp)\n" +
                "\tlw\ta0, 12(sp)\n" +
                "\tandi\ta3, a3, 255\n" +
                "\tli\ta4, 10\n" +
                "\tmul\ta2, a2, a4\n" +
                "\tadd\ta2, a2, a3\n" +
                "\taddi\ta2, a2, -48\n" +
                "\taddi\ta3, a1, 1\n" +
                "\tadd\ta0, a0, a3\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\tli\ta1, 0\n" +
                "\tmv\ta4, a0\n" +
                "\tsw\ta4, 20(sp)\n" +
                "\tsw\ta3, 24(sp)\n" +
                "\tsw\ta2, 28(sp)\n" +
                "\tbne\ta0, a1, .LBB11_1\n" +
                "\tj\t.LBB11_2\n" +
                ".LBB11_2:\n" +
                "\tlw\ta0, 16(sp)\n" +
                "\tlw\ta2, 28(sp)\n" +
                "\tsw\ta2, 4(sp)\n" +
                "\tli\ta1, 0\n" +
                "\tsub\ta2, a1, a2\n" +
                "\tandi\ta0, a0, 1\n" +
                "\tsw\ta2, 8(sp)\n" +
                "\tbne\ta0, a1, .LBB11_4\n" +
                "\tlw\ta0, 4(sp)\n" +
                "\tsw\ta0, 8(sp)\n" +
                ".LBB11_4:\n" +
                "\tlw\ta0, 8(sp)\n" +
                "\taddi\tsp, sp, 32\n" +
                "\tret\n" +
                ".Lfunc_end11:\n" +
                "\t.size\t_string.parseInt, .Lfunc_end11-_string.parseInt\n" +
                "\n" +
                "\t.globl\t_string.ord\n" +
                "\t.p2align\t1\n" +
                "\t.type\t_string.ord,@function\n" +
                "_string.ord:\n" +
                "\tadd\ta0, a0, a1\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\tret\n" +
                ".Lfunc_end12:\n" +
                "\t.size\t_string.ord, .Lfunc_end12-_string.ord\n" +
                "\n" +
                "\t.globl\t_string.compare\n" +
                "\t.p2align\t1\n" +
                "\t.type\t_string.compare,@function\n" +
                "_string.compare:\n" +
                "\taddi\tsp, sp, -48\n" +
                "\tsw\ta1, 24(sp)\n" +
                "\tsw\ta0, 28(sp)\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\tli\ta1, 0\n" +
                "\tmv\ta2, a1\n" +
                "\tmv\ta3, a1\n" +
                "\tmv\ta4, a0\n" +
                "\tsw\ta4, 32(sp)\n" +
                "\tmv\ta4, a3\n" +
                "\tsw\ta4, 36(sp)\n" +
                "\tsw\ta3, 40(sp)\n" +
                "\tsw\ta2, 44(sp)\n" +
                "\tbeq\ta0, a1, .LBB13_4\n" +
                "\tj\t.LBB13_1\n" +
                ".LBB13_1:\n" +
                "\tlw\ta0, 24(sp)\n" +
                "\tlw\ta2, 32(sp)\n" +
                "\tlw\ta3, 36(sp)\n" +
                "\tsw\ta3, 12(sp)\n" +
                "\tsw\ta2, 16(sp)\n" +
                "\tadd\ta0, a0, a3\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\tsw\ta0, 20(sp)\n" +
                "\tli\ta1, 0\n" +
                "\tsw\ta3, 40(sp)\n" +
                "\tsw\ta2, 44(sp)\n" +
                "\tbeq\ta0, a1, .LBB13_4\n" +
                "\tj\t.LBB13_2\n" +
                ".LBB13_2:\n" +
                "\tlw\ta2, 20(sp)\n" +
                "\tlw\ta3, 16(sp)\n" +
                "\tandi\ta1, a2, 255\n" +
                "\tandi\ta0, a3, 255\n" +
                "\tsw\ta3, 4(sp)\n" +
                "\tsw\ta2, 8(sp)\n" +
                "\tbne\ta0, a1, .LBB13_5\n" +
                "\tj\t.LBB13_3\n" +
                ".LBB13_3:\n" +
                "\tlw\ta0, 28(sp)\n" +
                "\tlw\ta1, 12(sp)\n" +
                "\taddi\ta3, a1, 1\n" +
                "\tadd\ta0, a0, a3\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\tli\ta1, 0\n" +
                "\tmv\ta2, a1\n" +
                "\tmv\ta4, a0\n" +
                "\tsw\ta4, 32(sp)\n" +
                "\tmv\ta4, a3\n" +
                "\tsw\ta4, 36(sp)\n" +
                "\tsw\ta3, 40(sp)\n" +
                "\tsw\ta2, 44(sp)\n" +
                "\tbne\ta0, a1, .LBB13_1\n" +
                "\tj\t.LBB13_4\n" +
                ".LBB13_4:\n" +
                "\tlw\ta0, 24(sp)\n" +
                "\tlw\ta2, 40(sp)\n" +
                "\tlw\ta1, 44(sp)\n" +
                "\tadd\ta0, a0, a2\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\tsw\ta1, 4(sp)\n" +
                "\tsw\ta0, 8(sp)\n" +
                "\tj\t.LBB13_5\n" +
                ".LBB13_5:\n" +
                "\tlw\ta0, 4(sp)\n" +
                "\tlw\ta1, 8(sp)\n" +
                "\tandi\ta0, a0, 255\n" +
                "\tandi\ta1, a1, 255\n" +
                "\tsub\ta0, a0, a1\n" +
                "\taddi\tsp, sp, 48\n" +
                "\tret\n" +
                ".Lfunc_end13:\n" +
                "\t.size\t_string.compare, .Lfunc_end13-_string.compare\n" +
                "\n" +
                "\t.globl\t_string.concat\n" +
                "\t.p2align\t1\n" +
                "\t.type\t_string.concat,@function\n" +
                "_string.concat:\n" +
                "\taddi\tsp, sp, -48\n" +
                "\tsw\tra, 44(sp)\n" +
                "\tsw\ta1, 32(sp)\n" +
                "\tsw\ta0, 36(sp)\n" +
                "\tli\ta0, 0\n" +
                "\tsw\ta0, 40(sp)\n" +
                "\tj\t.LBB14_1\n" +
                ".LBB14_1:\n" +
                "\tlw\ta1, 40(sp)\n" +
                "\tlw\ta0, 36(sp)\n" +
                "\tsw\ta1, 24(sp)\n" +
                "\tadd\ta0, a0, a1\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\taddi\ta3, a1, 1\n" +
                "\tli\ta1, 0\n" +
                "\tmv\ta2, a1\n" +
                "\tsw\ta3, 40(sp)\n" +
                "\tsw\ta2, 28(sp)\n" +
                "\tbne\ta0, a1, .LBB14_1\n" +
                "\tj\t.LBB14_2\n" +
                ".LBB14_2:\n" +
                "\tlw\ta1, 28(sp)\n" +
                "\tlw\ta0, 32(sp)\n" +
                "\tsw\ta1, 20(sp)\n" +
                "\tadd\ta0, a0, a1\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\taddi\ta2, a1, 1\n" +
                "\tli\ta1, 0\n" +
                "\tsw\ta2, 28(sp)\n" +
                "\tbne\ta0, a1, .LBB14_2\n" +
                "\tj\t.LBB14_3\n" +
                ".LBB14_3:\n" +
                "\tlw\ta1, 24(sp)\n" +
                "\tlw\ta0, 20(sp)\n" +
                "\tadd\ta0, a0, a1\n" +
                "\tsw\ta0, 8(sp)\n" +
                "\taddi\ta0, a0, 1\n" +
                "\tcall\tmalloc\n" +
                "\tmv\ta1, a0\n" +
                "\tlw\ta0, 24(sp)\n" +
                "\tsw\ta1, 12(sp)\n" +
                "\tli\ta1, 0\n" +
                "\tmv\ta2, a1\n" +
                "\tsw\ta2, 16(sp)\n" +
                "\tbne\ta0, a1, .LBB14_5\n" +
                "\tj\t.LBB14_4\n" +
                ".LBB14_4:\n" +
                "\tlw\ta0, 20(sp)\n" +
                "\tli\ta1, 0\n" +
                "\tmv\ta2, a1\n" +
                "\tsw\ta2, 4(sp)\n" +
                "\tbeq\ta0, a1, .LBB14_6\n" +
                "\tj\t.LBB14_7\n" +
                ".LBB14_5:\n" +
                "\tlw\ta1, 24(sp)\n" +
                "\tlw\ta0, 16(sp)\n" +
                "\tlw\ta3, 12(sp)\n" +
                "\tlw\ta2, 36(sp)\n" +
                "\tadd\ta2, a2, a0\n" +
                "\tlb\ta2, 0(a2)\n" +
                "\tadd\ta3, a3, a0\n" +
                "\tsb\ta2, 0(a3)\n" +
                "\taddi\ta0, a0, 1\n" +
                "\tmv\ta2, a0\n" +
                "\tsw\ta2, 16(sp)\n" +
                "\tbeq\ta0, a1, .LBB14_4\n" +
                "\tj\t.LBB14_5\n" +
                ".LBB14_6:\n" +
                "\tlw\ta0, 12(sp)\n" +
                "\tlw\ta1, 8(sp)\n" +
                "\tadd\ta2, a0, a1\n" +
                "\tli\ta1, 0\n" +
                "\tsb\ta1, 0(a2)\n" +
                "\tlw\tra, 44(sp)\n" +
                "\taddi\tsp, sp, 48\n" +
                "\tret\n" +
                ".LBB14_7:\n" +
                "\tlw\ta1, 20(sp)\n" +
                "\tlw\ta0, 4(sp)\n" +
                "\tlw\ta3, 12(sp)\n" +
                "\tlw\ta4, 24(sp)\n" +
                "\tlw\ta2, 32(sp)\n" +
                "\tadd\ta2, a2, a0\n" +
                "\tlb\ta2, 0(a2)\n" +
                "\tadd\ta4, a4, a0\n" +
                "\tadd\ta3, a3, a4\n" +
                "\tsb\ta2, 0(a3)\n" +
                "\taddi\ta0, a0, 1\n" +
                "\tmv\ta2, a0\n" +
                "\tsw\ta2, 4(sp)\n" +
                "\tbeq\ta0, a1, .LBB14_6\n" +
                "\tj\t.LBB14_7\n" +
                ".Lfunc_end14:\n" +
                "\t.size\t_string.concat, .Lfunc_end14-_string.concat\n" +
                "\n" +
                "\t.globl\t_string.copy\n" +
                "\t.p2align\t1\n" +
                "\t.type\t_string.copy,@function\n" +
                "_string.copy:\n" +
                "\taddi\tsp, sp, -32\n" +
                "\tsw\tra, 28(sp)\n" +
                "\tsw\ta0, 20(sp)\n" +
                "\tli\ta0, 0\n" +
                "\tsw\ta0, 24(sp)\n" +
                "\tj\t.LBB15_1\n" +
                ".LBB15_1:\n" +
                "\tlw\ta1, 24(sp)\n" +
                "\tlw\ta0, 20(sp)\n" +
                "\tsw\ta1, 12(sp)\n" +
                "\tadd\ta0, a0, a1\n" +
                "\tlbu\ta0, 0(a0)\n" +
                "\taddi\ta2, a1, 1\n" +
                "\tsw\ta2, 16(sp)\n" +
                "\tli\ta1, 0\n" +
                "\tsw\ta2, 24(sp)\n" +
                "\tbne\ta0, a1, .LBB15_1\n" +
                "\tj\t.LBB15_2\n" +
                ".LBB15_2:\n" +
                "\tlw\ta0, 16(sp)\n" +
                "\tcall\tmalloc\n" +
                "\tmv\ta1, a0\n" +
                "\tlw\ta0, 12(sp)\n" +
                "\tsw\ta1, 4(sp)\n" +
                "\tli\ta1, 0\n" +
                "\tmv\ta2, a1\n" +
                "\tsw\ta2, 8(sp)\n" +
                "\tbne\ta0, a1, .LBB15_4\n" +
                "\tj\t.LBB15_3\n" +
                ".LBB15_3:\n" +
                "\tlw\ta0, 4(sp)\n" +
                "\tlw\ta1, 12(sp)\n" +
                "\tadd\ta2, a0, a1\n" +
                "\tli\ta1, 0\n" +
                "\tsb\ta1, 0(a2)\n" +
                "\tlw\tra, 28(sp)\n" +
                "\taddi\tsp, sp, 32\n" +
                "\tret\n" +
                ".LBB15_4:\n" +
                "\tlw\ta1, 12(sp)\n" +
                "\tlw\ta0, 8(sp)\n" +
                "\tlw\ta3, 4(sp)\n" +
                "\tlw\ta2, 20(sp)\n" +
                "\tadd\ta2, a2, a0\n" +
                "\tlb\ta2, 0(a2)\n" +
                "\tadd\ta3, a3, a0\n" +
                "\tsb\ta2, 0(a3)\n" +
                "\taddi\ta0, a0, 1\n" +
                "\tmv\ta2, a0\n" +
                "\tsw\ta2, 8(sp)\n" +
                "\tbeq\ta0, a1, .LBB15_3\n" +
                "\tj\t.LBB15_4\n" +
                ".Lfunc_end15:\n" +
                "\t.size\t_string.copy, .Lfunc_end15-_string.copy\n" +
                "\n" +
                "\t.type\t.L.str,@object\n" +
                "\t.section\t.rodata.str1.1,\"aMS\",@progbits,1\n" +
                ".L.str:\n" +
                "\t.asciz\t\"%s\"\n" +
                "\t.size\t.L.str, 3\n" +
                "\n" +
                "\t.type\t.L.str.1,@object\n" +
                ".L.str.1:\n" +
                "\t.asciz\t\"%s\\n\"\n" +
                "\t.size\t.L.str.1, 4\n" +
                "\n" +
                "\t.type\t.L.str.2,@object\n" +
                ".L.str.2:\n" +
                "\t.asciz\t\"%d\"\n" +
                "\t.size\t.L.str.2, 3\n" +
                "\n" +
                "\t.type\t.L.str.3,@object\n" +
                ".L.str.3:\n" +
                "\t.asciz\t\"%d\\n\"\n" +
                "\t.size\t.L.str.3, 4\n" +
                "\n" +
                "\t.ident\t\"Ubuntu clang version 15.0.7\"\n" +
                "\t.section\t\".note.GNU-stack\",\"\",@progbits\n" +
                "\t.addrsig\n";
        try {
            ast.program_node ASTRoot;
            scope gScope = new scope(null);
//            divideLexer lexer = new divideLexer(CharStreams.fromStream(input));
            divideLexer lexer = new divideLexer(input);
            lexer.removeErrorListeners();
            lexer.addErrorListener(new mx_error());
            divideParser parser = new divideParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new mx_error());
            ParseTree parseTreeRoot = parser.program();
            Ast_builder astBuilder = new Ast_builder();
            ASTRoot = (program_node)astBuilder.visit(parseTreeRoot);
            gScope.init_globe();
            new symbol_collector(gScope).visit(ASTRoot);
            new symentic_checker(gScope).visit(ASTRoot);
            System.out.print(k);
            ir_program f = new ir_program();
            new IRBuilder(gScope,f).visit(ASTRoot);
            new IR_optimize(f).work();
//            System.out.println(f.toString());

            asm_program asmProgram = new asm_program();
            new asm_builder(asmProgram).visit(f);
            new register_allocation(asmProgram).work();
            System.out.write(asmProgram.toString().getBytes());
/* AsmFn asmF = new AsmFn();
           new InstSelector(asmF).visitFn(f);
           new RegAlloc(asmF).work();
           new AsmPrinter(asmF, System.out).print(); */
        } catch (error er) {
            System.out.println(er.toString());
            throw new RuntimeException();
        }

    }
}
