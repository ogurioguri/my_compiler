{
    depfiles_gcc = "backend.o: src/interpreter/backend.cpp include/config/config.h  include/declarations.h include/utility/deleter.h  include/interpreter/device.h include/config/counter.h  include/utility/tagged.h include/interpreter/exception.h  include/interpreter/forward.h include/libc/forward.h include/riscv/abi.h  include/interpreter/executable.h include/interpreter/hint.h  include/riscv/register.h include/interpreter/interpreter.h  include/utility/any.h include/interpreter/memory.h  include/interpreter/register.h include/libc/libc.h  include/utility/magic.h include/linker/layout.h  include/simulation/debug.h include/assembly/storage/immediate.h  include/assembly/forward.h include/utility/ustring.h  include/simulation/icache.h include/simulation/implement/icache_impl.h  include/interpreter/interval.h  include/simulation/implement/icache_decl.h include/utility/error.h  include/fmtlib.h\
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
        "src/interpreter/backend.cpp"
    }
}