{
    depfiles_gcc = "core.o: src/debugger/core.cpp include/declarations.h include/fmtlib.h  include/interpreter/exception.h include/interpreter/forward.h  include/libc/forward.h include/riscv/abi.h include/interpreter/memory.h  include/utility/deleter.h include/interpreter/register.h  include/riscv/register.h include/libc/libc.h include/utility/magic.h  include/linker/layout.h include/riscv/command.h  include/simulation/debug.h include/assembly/storage/immediate.h  include/assembly/forward.h include/utility/ustring.h  include/utility/error.h\
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
        "src/debugger/core.cpp"
    }
}