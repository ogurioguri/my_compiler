{
    depfiles_gcc = "executable.o: src/interpreter/executable.cpp  include/interpreter/executable.h include/interpreter/forward.h  include/declarations.h include/interpreter/hint.h  include/riscv/register.h include/interpreter/device.h  include/config/counter.h include/utility/tagged.h  include/utility/deleter.h include/interpreter/exception.h  include/libc/forward.h include/riscv/abi.h include/interpreter/memory.h  include/interpreter/register.h include/riscv/command.h  include/simulation/executable.h include/general.h  include/utility/error.h include/fmtlib.h\
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
        "src/interpreter/executable.cpp"
    }
}