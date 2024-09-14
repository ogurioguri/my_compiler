{
    depfiles_gcc = "device.o: src/interpreter/device.cpp include/interpreter/device.h  include/config/counter.h include/utility/tagged.h include/declarations.h  include/utility/deleter.h include/config/config.h  include/simulation/dcache.h include/utility/error.h include/fmtlib.h  include/simulation/predictor.h  include/simulation/implement/predictor_impl.h  include/simulation/implement/predictor_decl.h include/utility/misc.h\
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
        "src/interpreter/device.cpp"
    }
}