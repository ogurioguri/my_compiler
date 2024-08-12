// Generated from /home/oguricap/my_compiler/compiler/Compiler-Design-Implementation-master/src/parser/divide.g4 by ANTLR 4.13.1

    package parser;

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link divideParser}.
 */
public interface divideListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link divideParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(divideParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(divideParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#declaration}.
	 * @param ctx the parse tree
	 */
	void enterDeclaration(divideParser.DeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#declaration}.
	 * @param ctx the parse tree
	 */
	void exitDeclaration(divideParser.DeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#variableDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclaration(divideParser.VariableDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#variableDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclaration(divideParser.VariableDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#variableDeclarator}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarator(divideParser.VariableDeclaratorContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#variableDeclarator}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarator(divideParser.VariableDeclaratorContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(divideParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(divideParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#basicType}.
	 * @param ctx the parse tree
	 */
	void enterBasicType(divideParser.BasicTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#basicType}.
	 * @param ctx the parse tree
	 */
	void exitBasicType(divideParser.BasicTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDefinition(divideParser.FunctionDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDefinition(divideParser.FunctionDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void enterParameterList(divideParser.ParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void exitParameterList(divideParser.ParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(divideParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(divideParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void enterClassDefinition(divideParser.ClassDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void exitClassDefinition(divideParser.ClassDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#classMember}.
	 * @param ctx the parse tree
	 */
	void enterClassMember(divideParser.ClassMemberContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#classMember}.
	 * @param ctx the parse tree
	 */
	void exitClassMember(divideParser.ClassMemberContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#constructorDefinition}.
	 * @param ctx the parse tree
	 */
	void enterConstructorDefinition(divideParser.ConstructorDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#constructorDefinition}.
	 * @param ctx the parse tree
	 */
	void exitConstructorDefinition(divideParser.ConstructorDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(divideParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(divideParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by the {@code block_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBlock_statement(divideParser.Block_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code block_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBlock_statement(divideParser.Block_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code variable_declaration_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterVariable_declaration_statement(divideParser.Variable_declaration_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code variable_declaration_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitVariable_declaration_statement(divideParser.Variable_declaration_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code if_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterIf_statement(divideParser.If_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code if_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitIf_statement(divideParser.If_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code while_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterWhile_statement(divideParser.While_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code while_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitWhile_statement(divideParser.While_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code for_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterFor_statement(divideParser.For_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code for_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitFor_statement(divideParser.For_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code return_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterReturn_statement(divideParser.Return_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code return_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitReturn_statement(divideParser.Return_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code break_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBreak_statement(divideParser.Break_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code break_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBreak_statement(divideParser.Break_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code continue_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterContinue_statement(divideParser.Continue_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code continue_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitContinue_statement(divideParser.Continue_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expression_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterExpression_statement(divideParser.Expression_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expression_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitExpression_statement(divideParser.Expression_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code empty_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterEmpty_statement(divideParser.Empty_statementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code empty_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitEmpty_statement(divideParser.Empty_statementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code pre_postfix_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterPre_postfix_expression(divideParser.Pre_postfix_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code pre_postfix_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitPre_postfix_expression(divideParser.Pre_postfix_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code function_call_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterFunction_call_expression(divideParser.Function_call_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code function_call_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitFunction_call_expression(divideParser.Function_call_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code parentheses_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterParentheses_expression(divideParser.Parentheses_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code parentheses_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitParentheses_expression(divideParser.Parentheses_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code behind_postfix_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterBehind_postfix_expression(divideParser.Behind_postfix_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code behind_postfix_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitBehind_postfix_expression(divideParser.Behind_postfix_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code assignment_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterAssignment_expression(divideParser.Assignment_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code assignment_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitAssignment_expression(divideParser.Assignment_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code new_array_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNew_array_expression(divideParser.New_array_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code new_array_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNew_array_expression(divideParser.New_array_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code pre_unary_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterPre_unary_expression(divideParser.Pre_unary_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code pre_unary_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitPre_unary_expression(divideParser.Pre_unary_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code logical_or_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterLogical_or_expression(divideParser.Logical_or_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code logical_or_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitLogical_or_expression(divideParser.Logical_or_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code conditional_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterConditional_expression(divideParser.Conditional_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code conditional_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitConditional_expression(divideParser.Conditional_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code logical_not_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterLogical_not_expression(divideParser.Logical_not_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code logical_not_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitLogical_not_expression(divideParser.Logical_not_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code member_access_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMember_access_expression(divideParser.Member_access_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code member_access_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMember_access_expression(divideParser.Member_access_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code additive_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterAdditive_expression(divideParser.Additive_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code additive_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitAdditive_expression(divideParser.Additive_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code logical_and_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterLogical_and_expression(divideParser.Logical_and_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code logical_and_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitLogical_and_expression(divideParser.Logical_and_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code bitwise_and_or_xor_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterBitwise_and_or_xor_expression(divideParser.Bitwise_and_or_xor_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code bitwise_and_or_xor_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitBitwise_and_or_xor_expression(divideParser.Bitwise_and_or_xor_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code bitwise_not_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterBitwise_not_expression(divideParser.Bitwise_not_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code bitwise_not_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitBitwise_not_expression(divideParser.Bitwise_not_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code shift_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterShift_expression(divideParser.Shift_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code shift_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitShift_expression(divideParser.Shift_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code array_access_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterArray_access_expression(divideParser.Array_access_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code array_access_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitArray_access_expression(divideParser.Array_access_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code new_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNew_expression(divideParser.New_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code new_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNew_expression(divideParser.New_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code relational_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterRelational_expression(divideParser.Relational_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code relational_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitRelational_expression(divideParser.Relational_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code multiplicative_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMultiplicative_expression(divideParser.Multiplicative_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code multiplicative_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMultiplicative_expression(divideParser.Multiplicative_expressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code primary_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterPrimary_expression(divideParser.Primary_expressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code primary_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitPrimary_expression(divideParser.Primary_expressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#primary}.
	 * @param ctx the parse tree
	 */
	void enterPrimary(divideParser.PrimaryContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#primary}.
	 * @param ctx the parse tree
	 */
	void exitPrimary(divideParser.PrimaryContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#formatString}.
	 * @param ctx the parse tree
	 */
	void enterFormatString(divideParser.FormatStringContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#formatString}.
	 * @param ctx the parse tree
	 */
	void exitFormatString(divideParser.FormatStringContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#arrayLiteral}.
	 * @param ctx the parse tree
	 */
	void enterArrayLiteral(divideParser.ArrayLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#arrayLiteral}.
	 * @param ctx the parse tree
	 */
	void exitArrayLiteral(divideParser.ArrayLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link divideParser#constant}.
	 * @param ctx the parse tree
	 */
	void enterConstant(divideParser.ConstantContext ctx);
	/**
	 * Exit a parse tree produced by {@link divideParser#constant}.
	 * @param ctx the parse tree
	 */
	void exitConstant(divideParser.ConstantContext ctx);
}