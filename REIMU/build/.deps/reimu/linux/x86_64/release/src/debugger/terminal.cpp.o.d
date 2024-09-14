{
    depfiles_gcc = "terminal.o: src/debugger/terminal.cpp include/assembly/exception.h  include/fmtlib.h include/assembly/frontend/lexer.h  include/assembly/frontend/token.h include/assembly/frontend/match.h  include/assembly/frontend/parser.h include/assembly/storage/immediate.h  include/assembly/forward.h include/riscv/register.h  include/declarations.h include/assembly/immediate.h  include/utility/ustring.h include/interpreter/exception.h  include/interpreter/forward.h include/libc/forward.h include/riscv/abi.h  include/simulation/debug.h include/interpreter/memory.h  include/utility/deleter.h include/interpreter/register.h  include/libc/libc.h include/utility/magic.h include/linker/layout.h  include/utility/cast.h include/utility/error.h include/utility/hash.h\
",
    values = {
        "/usr/bin/gcc",
        {
            "-m64",
            "-fvisibility=hidden",
            "-fvisibility-inlines-hidden",
            "-Wall",
            "-Wextra",
            "-Werror",
            "-Wpedantic",
            "-O3",
            "-std=c++23",
            "-Iinclude",
            "-isystem",
            "/home/oguricap/.xmake/packages/f/fmt/11.0.2/8f2759149dd24c4c95ee980930242ead/include",
            "-Wswitch-default",
            "-DNDEBUG"
        }
    },
    files = {
        "src/debugger/terminal.cpp"
    }
}