package ast;
import ast.statement.block_statement;
import ast.statement.if_statement;
import ast.statement.while_statement;
import ast.type.val_type;
import util.position;
import java.util.ArrayList;
import ast.statement.*;
import ast.type.*;
import ast.expression.*;
import ast.statement.*;
import ast.primary.*;


abstract public interface ast_visitor {
    void visit(program_node programNode);
    void visit(class_defination_node classDefinationNode);
    void visit(function_def functionDef);
    void visit(parameterlist_node parameterlistNode);
    void visit(val_declaration_node valDeclarationNode);
    void visit(block_statement blockStatement);
    void visit(if_statement ifStatement);
    void visit(while_statement whileStatement);
    void visit(break_statement breakStatement);
    void visit(continue_statement continueStatement);
    void visit(return_statement returnStatement);
    void visit(expression_statement expressionStatement);
    void visit(val_type valType);
    void visit(call_expression callExpression);
    void visit(binary_expression binaryExpression);
    void visit(primary_expression primaryExpression);
    void visit(declaration_statement declarationStatement);
    void visit(for_statement forStatement);
    void visit(assign_expression assignExpression);
    void visit(behind_expression behindExpression);
    void visit(member_expression memberExpression);
    void visit(new_expression newExpression);
    void visit(pre_expression preExpression);
    void visit(ternary_expression ternaryExpression);
    void visit(empty_statement emptyStatement);
    void visit(array_expression arrayExpression);
    void visit(class_construction classConstruction);



}

