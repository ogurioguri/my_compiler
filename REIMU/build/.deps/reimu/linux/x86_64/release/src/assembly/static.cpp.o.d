{
    depfiles_gcc = "static.o: src/assembly/static.cpp include/assembly/storage/static.h  include/assembly/forward.h include/riscv/register.h  include/assembly/storage/visitor.h include/assembly/storage/immediate.h  include/declarations.h include/assembly/exception.h include/fmtlib.h\
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
        "src/assembly/static.cpp"
    }
}