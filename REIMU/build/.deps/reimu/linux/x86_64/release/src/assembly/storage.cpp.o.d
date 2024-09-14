{
    depfiles_gcc = "storage.o: src/assembly/storage.cpp include/assembly/storage.h  include/assembly/storage/command.h include/assembly/forward.h  include/riscv/register.h include/assembly/storage/immediate.h  include/declarations.h include/assembly/storage/visitor.h  include/general.h include/assembly/storage/static.h  include/assembly/assembly.h include/assembly/exception.h  include/fmtlib.h include/assembly/frontend/match.h  include/assembly/frontend/token.h include/assembly/frontend/parser.h  include/utility/cast.h include/utility/error.h include/utility/hash.h\
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
        "src/assembly/storage.cpp"
    }
}