{
    depfiles_gcc = "inout.o: src/libc/inout.cpp include/declarations.h  include/interpreter/device.h include/config/counter.h  include/utility/tagged.h include/utility/deleter.h  include/interpreter/exception.h include/interpreter/forward.h  include/libc/forward.h include/riscv/abi.h include/interpreter/memory.h  include/interpreter/register.h include/riscv/register.h  include/libc/libc.h include/utility/magic.h include/libc/utility.h  include/fmtlib.h include/interpreter/hint.h\
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
        "src/libc/inout.cpp"
    }
}