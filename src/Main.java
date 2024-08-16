
import frontend.Ast_builder;
import ast.*;
import org.antlr.v4.runtime.CharStream;
import parser.*;
import util.*;
import frontend.*;

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.InputStream;


public class Main {
    public static void main(String[] args) throws Exception{
        String name = "src/test.mx";
        InputStream input = new FileInputStream(name);
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

            /* YxLexer lexer = new YxLexer(CharStreams.fromStream(input));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new YxErrorListener());
            YxParser parser = new YxParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new YxErrorListener());
            ParseTree parseTreeRoot = parser.program();
            ASTBuilder astBuilder = new ASTBuilder(gScope);
            ASTRoot = (RootNode)astBuilder.visit(parseTreeRoot);
            new SymbolCollector(gScope).visit(ASTRoot);
            new SemanticChecker(gScope).visit(ASTRoot);

            mainFn f = new mainFn();
            new IRBuilder(f, gScope).visit(ASTRoot);
            // new IRPrinter(System.out).visitFn(f);

            AsmFn asmF = new AsmFn();
            new InstSelector(asmF).visitFn(f);
            new RegAlloc(asmF).work();
            new AsmPrinter(asmF, System.out).print(); */
        } catch (error er) {
            System.out.println(er.toString());
            throw new RuntimeException();
        }

    }
}