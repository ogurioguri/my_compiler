{
    depfiles_gcc = "midend.o: src/interpreter/midend.cpp include/assembly/layout.h  include/assembly/forward.h include/riscv/register.h  include/declarations.h include/config/config.h include/utility/deleter.h  include/interpreter/interpreter.h include/utility/any.h  include/linker/layout.h include/linker/linker.h include/utility/error.h  include/fmtlib.h\
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
        "src/interpreter/midend.cpp"
    }
}