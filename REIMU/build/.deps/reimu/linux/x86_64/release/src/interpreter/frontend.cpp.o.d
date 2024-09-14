{
    depfiles_gcc = "frontend.o: src/interpreter/frontend.cpp include/assembly/assembly.h  include/assembly/forward.h include/riscv/register.h  include/declarations.h include/assembly/layout.h include/config/config.h  include/utility/deleter.h include/interpreter/interpreter.h  include/utility/any.h\
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
        "src/interpreter/frontend.cpp"
    }
}