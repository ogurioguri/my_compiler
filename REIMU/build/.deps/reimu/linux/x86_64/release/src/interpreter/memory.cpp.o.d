{
    depfiles_gcc = "memory.o: src/interpreter/memory.cpp include/interpreter/memory.h  include/declarations.h include/interpreter/forward.h  include/utility/deleter.h include/interpreter/exception.h  include/libc/forward.h include/riscv/abi.h include/simulation/area.h  include/config/config.h include/interpreter/interval.h  include/libc/libc.h include/utility/magic.h include/linker/layout.h  include/utility/error.h include/fmtlib.h include/utility/misc.h\
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
        "src/interpreter/memory.cpp"
    }
}