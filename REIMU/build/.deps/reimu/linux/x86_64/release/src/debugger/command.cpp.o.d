{
    depfiles_gcc = "command.o: src/debugger/command.cpp include/riscv/command.h  include/declarations.h include/fmtlib.h include/riscv/register.h  include/simulation/debug.h include/assembly/storage/immediate.h  include/assembly/forward.h include/interpreter/memory.h  include/interpreter/forward.h include/utility/deleter.h  include/interpreter/register.h include/libc/libc.h  include/libc/forward.h include/riscv/abi.h include/utility/magic.h  include/linker/layout.h include/utility/ustring.h\
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
        "src/debugger/command.cpp"
    }
}