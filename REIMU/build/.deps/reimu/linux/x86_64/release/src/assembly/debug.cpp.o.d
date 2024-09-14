{
    depfiles_gcc = "debug.o: src/assembly/debug.cpp include/assembly/immediate.h  include/assembly/forward.h include/riscv/register.h  include/assembly/storage/immediate.h include/declarations.h  include/utility/ustring.h include/assembly/storage/command.h  include/assembly/storage/visitor.h include/general.h  include/assembly/storage/static.h include/fmtlib.h  include/utility/error.h\
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
        "src/assembly/debug.cpp"
    }
}