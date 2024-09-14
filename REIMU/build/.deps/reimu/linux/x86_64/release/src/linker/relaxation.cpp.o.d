{
    depfiles_gcc = "relaxation.o: src/linker/relaxation.cpp  include/assembly/storage/command.h include/assembly/forward.h  include/riscv/register.h include/assembly/storage/immediate.h  include/declarations.h include/assembly/storage/visitor.h  include/general.h include/assembly/storage/static.h  include/linker/evaluate.h include/assembly/immediate.h  include/utility/ustring.h include/linker/linker.h include/utility/any.h  include/utility/cast.h include/utility/error.h include/fmtlib.h  include/utility/misc.h\
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
        "src/linker/relaxation.cpp"
    }
}