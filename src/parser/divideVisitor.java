// Generated from //wsl.localhost/Ubuntu/home/oguricap/Compiler-Design-Implementation-master/src/parser/divide.g4 by ANTLR 4.13.1
package parser;

import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link divideParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface divideVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link divideParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(divideParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#program_member}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram_member(divideParser.Program_memberContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#declaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeclaration(divideParser.DeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#variableDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDeclaration(divideParser.VariableDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#variableDeclarator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDeclarator(divideParser.VariableDeclaratorContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitType(divideParser.TypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#basicType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBasicType(divideParser.BasicTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#functionDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionDefinition(divideParser.FunctionDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#parameterList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameterList(divideParser.ParameterListContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#parameter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameter(divideParser.ParameterContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#classDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassDefinition(divideParser.ClassDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#classMember}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassMember(divideParser.ClassMemberContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#constructorDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstructorDefinition(divideParser.ConstructorDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#block}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(divideParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by the {@code block_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock_statement(divideParser.Block_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code variable_declaration_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariable_declaration_statement(divideParser.Variable_declaration_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code if_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIf_statement(divideParser.If_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code while_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhile_statement(divideParser.While_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code for_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFor_statement(divideParser.For_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code return_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturn_statement(divideParser.Return_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code break_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBreak_statement(divideParser.Break_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code continue_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContinue_statement(divideParser.Continue_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expression_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression_statement(divideParser.Expression_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code empty_statement}
	 * labeled alternative in {@link divideParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEmpty_statement(divideParser.Empty_statementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code pre_postfix_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPre_postfix_expression(divideParser.Pre_postfix_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code function_call_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunction_call_expression(divideParser.Function_call_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code parentheses_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParentheses_expression(divideParser.Parentheses_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code behind_postfix_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBehind_postfix_expression(divideParser.Behind_postfix_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code assignment_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssignment_expression(divideParser.Assignment_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code new_array_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNew_array_expression(divideParser.New_array_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code pre_unary_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPre_unary_expression(divideParser.Pre_unary_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code logical_or_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_or_expression(divideParser.Logical_or_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code conditional_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConditional_expression(divideParser.Conditional_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code logical_not_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_not_expression(divideParser.Logical_not_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code member_access_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMember_access_expression(divideParser.Member_access_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code additive_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdditive_expression(divideParser.Additive_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code logical_and_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_and_expression(divideParser.Logical_and_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code bitwise_and_or_xor_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBitwise_and_or_xor_expression(divideParser.Bitwise_and_or_xor_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code bitwise_not_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBitwise_not_expression(divideParser.Bitwise_not_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code shift_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitShift_expression(divideParser.Shift_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code array_access_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArray_access_expression(divideParser.Array_access_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code relational_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRelational_expression(divideParser.Relational_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code multiplicative_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMultiplicative_expression(divideParser.Multiplicative_expressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code primary_expression}
	 * labeled alternative in {@link divideParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrimary_expression(divideParser.Primary_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#primary}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrimary(divideParser.PrimaryContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#formatString}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFormatString(divideParser.FormatStringContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#arrayLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArrayLiteral(divideParser.ArrayLiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link divideParser#constant}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstant(divideParser.ConstantContext ctx);
}