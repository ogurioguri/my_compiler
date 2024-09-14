{
    files = {
        "src/utility/config.cpp"
    },
    depfiles_gcc = "config.o: src/utility/config.cpp include/config/config.h  include/declarations.h include/utility/deleter.h  include/config/argument.h include/fmtlib.h include/config/counter.h  include/utility/tagged.h include/config/default.h include/utility/cast.h  include/utility/error.h\
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
    }
}