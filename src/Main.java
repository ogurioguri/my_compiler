
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

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintStream;


public class Main {
    public static void main(String[] args) throws Exception{
        String name = "src/test.mx";
        InputStream input = new FileInputStream(name);
        PrintStream out = new PrintStream(new FileOutputStream("src/test.s"));
        System.setOut(out);
//        CharStream input = CharStreams.fromStream(System.in);
        try {
            ast.program_node ASTRoot;
            scope gScope = new scope(null);
            divideLexer lexer = new divideLexer(CharStreams.fromStream(input));
//            divideLexer lexer = new divideLexer(input);
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


            ir_program f = new ir_program();
            new IRBuilder(gScope,f).visit(ASTRoot);
//            System.out.println(f.toString());
            asm_program asmProgram = new asm_program();
            new asm_builder(asmProgram).visit(f);
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