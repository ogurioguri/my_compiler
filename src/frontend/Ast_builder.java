package frontend;
import ast.*;
import ast.primary.*;
import parser.*;
import ast.type.*;
import util.position;
import ast.expression.*;
import ast.statement.*;

import java.util.HashMap;
import java.util.ArrayList;

public class ast_builder extends divideBaseVisitor<ast_node>{
    @Override
    public ast_node visitProgram(divideParser.ProgramContext ctx) {
        program_node program = new program_node(new position(ctx));
        for (divideParser.DeclarationContext declaration : ctx.declaration()) {
            program.children.add(visit(declaration));
        }
        for(divideParser.FunctionDefinitionContext functionDefinition : ctx.functionDefinition()){
            program.children.add(visit(functionDefinition));
        }
        for(divideParser.ClassDefinitionContext classDefination : ctx.classDefinition()){
            program.children.add(visit(classDefination));
        }
        return program;
    }

    @Override
    public ast_node visitDeclaration(divideParser.DeclarationContext ctx) {
        val_type type = new val_type(ctx.variableDeclaration().type().basicType().getText(),ctx.variableDeclaration().type().LeftBracket().size());
        HashMap<String,basic_expression> now_map = new HashMap<>();
        for(divideParser.VariableDeclaratorContext variableDeclarator : ctx.variableDeclaration().variableDeclarator()){
            if(variableDeclarator.expression() == null){
               now_map.put(variableDeclarator.Identifier().getText(),null);
            }
            else{
                now_map.put(variableDeclarator.Identifier().getText(),(basic_expression)visit(variableDeclarator.expression()));
            }
        }
        return new val_declaration_node(new position(ctx),type,now_map);
    }

    @Override
    public ast_node visitFunctionDefinition(divideParser.FunctionDefinitionContext ctx) {
        val_type type = new val_type(ctx.type().basicType().getText(),ctx.type().LeftBracket().size());
        String name = ctx.Identifier().getText();
        parameterlist_node parameter_list_ = (parameterlist_node)visit(ctx.parameterList());
        block_statement block = (block_statement) visit(ctx.block());
        return new function_def(new position(ctx),type,name,parameter_list_,block);
    }

    @Override
    public ast_node visitConstructorDefinition(divideParser.ConstructorDefinitionContext ctx) {
        block_statement block = (block_statement) visit(ctx.block());
        String name = ctx.Identifier().getText();
        return new class_construction(new position(ctx),name,block);
    }

    @Override
    public ast_node visitClassDefinition(divideParser.ClassDefinitionContext ctx) {
        String name = ctx.Identifier().getText();
        ArrayList<val_declaration_node> val_declaration_list = new ArrayList<>();
        ArrayList<function_def> func_defination_list = new ArrayList<>();
        class_construction class_build = null;
        boolean flag = false;
        for(divideParser.ClassMemberContext content : ctx.classMember()){
            if(content.declaration() != null){
                val_declaration_list.add((val_declaration_node) visit(content.declaration()));
            }
            if(content.functionDefinition() != null){
                func_defination_list.add((function_def) visit(content.functionDefinition()));
            }
            if(content.constructorDefinition() != null){
                class_build = (class_construction) visit(content.constructorDefinition());
                flag = true;
            }
        }
        if(flag){
            return new class_defination_node(new position(ctx),name,class_build,val_declaration_list,func_defination_list);
        }
        else{
           throw new RuntimeException("class_defination_node error");
        }
    }

    @Override
    public ast_node visitParameterList(divideParser.ParameterListContext ctx) {
        HashMap<String , val_type> type_name_map_ = new HashMap<>();
        for(divideParser.ParameterContext parameter : ctx.parameter()){
            val_type type = new val_type(parameter.type().basicType().getText(),parameter.type().LeftBracket().size());
            type_name_map_.put(parameter.Identifier().getText(),type);
        }
        return new parameterlist_node(new position(ctx),type_name_map_);
    }

    @Override
    public ast_node visitBlock(divideParser.BlockContext ctx) {
        ArrayList<statement_node> statement_list = new ArrayList<>();
        for(divideParser.StatementContext statement : ctx.statement()){
            statement_list.add((statement_node) visit(statement));
        }
        return new block_statement(new position(ctx),statement_list);
    }

    @Override
    public ast_node visitVariable_declaration_statement(divideParser.Variable_declaration_statementContext ctx) {
        val_declaration_node val_declaration = (val_declaration_node) visit(ctx.declaration());
        return new declaration_statement(new position(ctx),val_declaration);
    }

    @Override
    public ast_node visitExpression_statement(divideParser.Expression_statementContext ctx) {
        basic_expression expression = (basic_expression) visit(ctx.expression());
        return new expression_statement(new position(ctx),expression);
    }

    @Override
    public ast_node visitEmpty_statement(divideParser.Empty_statementContext ctx) {
        return new empty_statement(new position(ctx));
    }

    @Override
    public ast_node visitIf_statement(divideParser.If_statementContext ctx) {
        basic_expression condition = (basic_expression) visit(ctx.expression());
        statement_node then_statement = (statement_node) visit(ctx.then_statement);
        statement_node else_statement = ctx.else_statement == null ? null : (statement_node) visit(ctx.else_statement);
        return new if_statement(new position(ctx),condition,then_statement,else_statement);
    }

    @Override
    public ast_node visitWhile_statement(divideParser.While_statementContext ctx) {
        basic_expression condition = (basic_expression) visit(ctx.expression());
        statement_node statement = (statement_node) visit(ctx.statement());
        return new while_statement(new position(ctx),condition,statement);
    }

    @Override
    public ast_node visitFor_statement(divideParser.For_statementContext ctx) {
        statement_node init = ctx.first_statement == null ? null : (statement_node) visit(ctx.first_statement);
        basic_expression condition = ctx.second == null ? null : (basic_expression) visit(ctx.second);
        basic_expression update = ctx.third == null ? null : (basic_expression) visit(ctx.third);
        statement_node statement = (statement_node) visit(ctx.body);
        return new for_statement(new position(ctx),init,condition,update,statement);
    }

    @Override
    public ast_node visitReturn_statement(divideParser.Return_statementContext ctx) {
        basic_expression expression = ctx.expression() == null ? null : (basic_expression) visit(ctx.expression());
        return new return_statement(new position(ctx),expression);
    }

    @Override
    public ast_node visitBreak_statement(divideParser.Break_statementContext ctx) {
        return new break_statement(new position(ctx));
    }

    @Override
    public ast_node visitContinue_statement(divideParser.Continue_statementContext ctx) {
        return new continue_statement(new position(ctx));
    }

    @Override
    public ast_node visitBlock_statement(divideParser.Block_statementContext ctx) {
        return visit(ctx.block());
    }

    @Override
    public ast_node visitAssignment_expression(divideParser.Assignment_expressionContext ctx) {
        basic_expression left = (basic_expression) visit(ctx.expression(0));
        basic_expression right = (basic_expression) visit(ctx.expression(1));
        return new assign_expression(new position(ctx),left,right);
    }

    @Override
    public ast_node visitAdditive_expression(divideParser.Additive_expressionContext ctx) {
        return new pre_expression(new position(ctx),(basic_expression)visit(ctx.expression(0)),ctx.op.getText());
    }

    @Override
    public ast_node visitMultiplicative_expression(divideParser.Multiplicative_expressionContext ctx) {
        return new pre_expression(new position(ctx),(basic_expression)visit(ctx.expression(0)),ctx.op.getText());
    }

    @Override
    public ast_node visitPrimary_expression(divideParser.Primary_expressionContext ctx) {
        primary now_primary = null;
        if(ctx.primary().Identifier() != null){
            now_primary = new primary();
            now_primary.identified = ctx.primary().Identifier().getText();
            now_primary.is_identified = true;
        }
        else if(ctx.primary().This() != null){
            now_primary = new This();
        }
        else if(ctx.primary().constant().IntegerLiteral() != null){
            now_primary = new Integer_literal(Integer.parseInt(ctx.primary().constant().IntegerLiteral().getText()));
        }
        else if(ctx.primary().constant().Null() != null){
            now_primary = new Null();
        }
        else if(ctx.primary().constant().True() != null){
            now_primary = new Bool(true);
        }
        else if(ctx.primary().constant().False() != null){
            now_primary = new Bool(false);
        }
        else if(ctx.primary().constant().StringLiteral() != null){
            String input = ctx.primary().constant().StringLiteral().getText();
            // remove ""
            input = input.substring(1,input.length()-1);
            now_primary = new string_literal(input);
        }
        else if(ctx.primary().constant().arrayLiteral() != null){
            now_primary = new array_literal(new ArrayList<>());
            for(divideParser.ExpressionContext content: ctx.primary().constant().arrayLiteral().expression()){
                ((array_literal) now_primary).value.add((basic_expression)visit(content));
            }
        }
        else if(ctx.primary().constant().formatString() != null){
            String first = ctx.primary().constant().formatString().FormatStringleft().getText();
            //remove f and "
            first = first.substring(2);
            String third = ctx.primary().constant().formatString().FormatStringright().getText();
            //remove "
            third = third.substring(1,third.length()-1);
            ArrayList<basic_expression> value = new ArrayList<>();
            for(divideParser.ExpressionContext content: ctx.primary().constant().formatString().expression()){
                value.add((basic_expression)visit(content));
            }
            ArrayList<String> mid = new ArrayList<>();
            for(int i =0 ; i<ctx.primary().constant().formatString().FormatStringmid().size();i++){
                String token = ctx.primary().constant().formatString().FormatStringmid(i).getText();
                //remove $
                token = token.substring(1,token.length()-1);
                mid.add(token);
            }
            now_primary = new format_string(first,third,mid,value);
        }
        return new primary_expression(new position(ctx),now_primary);
    }

    @Override
    public ast_node visitFunction_call_expression(divideParser.Function_call_expressionContext ctx) {
        basic_expression function = (basic_expression) visit(ctx.function);
        ArrayList<basic_expression> parameter_list = new ArrayList<>();
        for(divideParser.ExpressionContext parameter : ctx.expression()){
            parameter_list.add((basic_expression) visit(parameter));
        }
        return new call_expression(new position(ctx),function,parameter_list);
    }

    @Override
    public ast_node visitParentheses_expression(divideParser.Parentheses_expressionContext ctx) {
        return visit(ctx.expression());
    }

    @Override
    //error to be changed
    public ast_node visitNew_expression(divideParser.New_expressionContext ctx) {
        if(ctx.Int() != null){
            return new new_expression(new position(ctx),new ArrayList<>(),new val_type("int",0));
        }
        else if(ctx.Bool() != null){
            return new new_expression(new position(ctx),new ArrayList<>(),new val_type("bool",0));
        }
        else if(ctx.String() != null){
            return new new_expression(new position(ctx),new ArrayList<>(),new val_type("string",0));
        }
        else if(ctx.Identifier() != null){
            return new new_expression(new position(ctx),new ArrayList<>(),new val_type(ctx.Identifier().getText(),0));
        }
        throw new RuntimeException("new_expression error");
    }

    @Override
    public ast_node visitNew_array_expression(divideParser.New_array_expressionContext ctx) {
        val_type type = new val_type();
        if(ctx.Int() != null){
            type = new val_type("int",ctx.LeftBracket().size());
        }
        else if(ctx.Bool() != null){
            type = new val_type("bool",ctx.LeftBracket().size());
        }
        else if(ctx.String() != null){
            type = new val_type("string",ctx.LeftBracket().size());
        }
        else if(ctx.Identifier() != null){
            type = new val_type(ctx.Identifier().getText(),ctx.LeftBracket().size());
        }
        ArrayList<basic_expression> expression_list = new ArrayList<>();
        for(divideParser.ExpressionContext expression : ctx.expression()){
            expression_list.add((basic_expression) visit(expression));
        }
        return new new_expression(new position(ctx),expression_list,type);
    }

    @Override
    public ast_node visitRelational_expression(divideParser.Relational_expressionContext ctx) {
        return new binary_expression(new position(ctx),(basic_expression)visit(ctx.expression(0)),(basic_expression)visit(ctx.expression(1)),ctx.op.getText());
    }

    @Override
    public ast_node visitLogical_or_expression(divideParser.Logical_or_expressionContext ctx) {
        return new binary_expression(new position(ctx),(basic_expression)visit(ctx.expression(0)),(basic_expression)visit(ctx.expression(1)),ctx.op.getText());
    }

    @Override
    public ast_node visitLogical_and_expression(divideParser.Logical_and_expressionContext ctx) {
        return new binary_expression(new position(ctx),(basic_expression)visit(ctx.expression(0)),(basic_expression)visit(ctx.expression(1)),ctx.op.getText());
    }
    @Override
    public ast_node visitLogical_not_expression(divideParser.Logical_not_expressionContext ctx) {
        return new pre_expression(new position(ctx),(basic_expression)visit(ctx.expression()),ctx.op.getText());
    }

    @Override
    public ast_node visitPre_postfix_expression(divideParser.Pre_postfix_expressionContext ctx) {
        return new pre_expression(new position(ctx),(basic_expression)visit(ctx.expression()),ctx.op.getText());
    }

    @Override
    public ast_node visitBehind_postfix_expression(divideParser.Behind_postfix_expressionContext ctx) {
        return new behind_expression(new position(ctx),(basic_expression)visit(ctx.expression()),ctx.op.getText());
    }

    @Override
    public ast_node visitShift_expression(divideParser.Shift_expressionContext ctx) {
        return new binary_expression(new position(ctx),(basic_expression)visit(ctx.expression(0)),(basic_expression)visit(ctx.expression(1)),ctx.op.getText());
    }

    @Override
    public ast_node visitBitwise_and_or_xor_expression(divideParser.Bitwise_and_or_xor_expressionContext ctx) {
        return new binary_expression(new position(ctx),(basic_expression)visit(ctx.expression(0)),(basic_expression)visit(ctx.expression(1)),ctx.op.getText());
    }

    @Override
    public ast_node visitBitwise_not_expression(divideParser.Bitwise_not_expressionContext ctx) {
        return new pre_expression(new position(ctx),(basic_expression)visit(ctx.expression()),ctx.op.getText());
    }

    @Override
    public ast_node visitPre_unary_expression(divideParser.Pre_unary_expressionContext ctx) {
        return new pre_expression(new position(ctx),(basic_expression)visit(ctx.expression()),ctx.op.getText());
    }

    @Override
    public ast_node visitMember_access_expression(divideParser.Member_access_expressionContext ctx) {
        return new member_expression(new position(ctx),(basic_expression)visit(ctx.expression()),ctx.Identifier().getText());
    }

    @Override
    public ast_node visitArray_access_expression(divideParser.Array_access_expressionContext ctx) {
        String name = ctx.Identified().getText();
        ArrayList<basic_expression> index = new ArrayList<>();
        for(divideParser.ExpressionContext index_ : ctx.expression()){
            index.add((basic_expression) visit(index_));
        }
        return new array_expression(new position(ctx),name,index);
    }

    @Override
    public ast_node visitConditional_expression(divideParser.Conditional_expressionContext ctx) {
        basic_expression condition = (basic_expression) visit(ctx.expression(0));
        basic_expression true_expression = (basic_expression) visit(ctx.expression(1));
        basic_expression false_expression = (basic_expression) visit(ctx.expression(2));
        return new ternary_expression(new position(ctx),condition,true_expression,false_expression);
    }


}
