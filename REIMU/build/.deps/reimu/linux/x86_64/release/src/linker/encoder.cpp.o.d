{
    depfiles_gcc = "encoder.o: src/linker/encoder.cpp include/assembly/forward.h  include/riscv/register.h include/assembly/storage/command.h  include/assembly/storage/immediate.h include/declarations.h  include/assembly/storage/visitor.h include/general.h  include/assembly/storage/static.h include/fmtlib.h include/libc/libc.h  include/interpreter/forward.h include/libc/forward.h include/riscv/abi.h  include/utility/magic.h include/linker/estimate.h  include/assembly/storage.h include/linker/linker.h include/utility/any.h  include/linker/evaluate.h include/assembly/immediate.h  include/utility/ustring.h include/utility/cast.h include/utility/error.h  include/linker/layout.h include/riscv/command.h\
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
        "src/linker/encoder.cpp"
    }
}