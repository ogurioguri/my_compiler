package asm.ingredient;

public class real_register extends register{
    public String name;
    static real_register[] registers = null;
    public real_register(String name){
        this.name = name;
    }

    public static int get_index(String name){
        switch(name){
            case "zero": return 0;
            case "ra": return 1;
            case "sp": return 2;
            case "gp": return 3;
            case "tp": return 4;
            case "t0": return 5;
            case "t1": return 6;
            case "t2": return 7;
            case "s0": return 8;
            case "s1": return 9;
            case "a0": return 10;
            case "a1": return 11;
            case "a2": return 12;
            case "a3": return 13;
            case "a4": return 14;
            case "a5": return 15;
            case "a6": return 16;
            case "a7": return 17;
            case "s2": return 18;
            case "s3": return 19;
            case "s4": return 20;
            case "s5": return 21;
            case "s6": return 22;
            case "s7": return 23;
            case "s8": return 24;
            case "s9": return 25;
            case "s10": return 26;
            case "s11": return 27;
            case "t3": return 28;
            case "t4": return 29;
            case "t5": return 30;
            case "t6": return 31;
        }
        throw new RuntimeException("PhysicalRegister.getColor: unknown register name");
    }


    public static real_register get_reg(int index){
        if(registers == null){
            registers = new real_register[32];
            registers[0] = new real_register("zero");
            registers[1] = new real_register("ra");
            registers[2] = new real_register("sp");
            registers[3] = new real_register("gp");
            registers[4] = new real_register("tp");
            registers[5] = new real_register("t0");
            registers[6] = new real_register("t1");
            registers[7] = new real_register("t2");
            registers[8] = new real_register("s0");
            registers[9] = new real_register("s1");
            for (int i = 0; i < 8; ++i)
                registers[i + 10] = new real_register("a" + i);
            for (int i = 2; i < 12; ++i)
                registers[i + 16] = new real_register("s" + i);
            for (int i = 3; i < 7; ++i)
                registers[i + 25] = new real_register("t" + i);
        }
        return registers[index];
    }

    public static real_register get_reg(String name){
        if(registers == null){
            registers = new real_register[32];
            registers[0] = new real_register("zero");
            registers[1] = new real_register("ra");
            registers[2] = new real_register("sp");
            registers[3] = new real_register("gp");
            registers[4] = new real_register("tp");
            registers[5] = new real_register("t0");
            registers[6] = new real_register("t1");
            registers[7] = new real_register("t2");
            registers[8] = new real_register("s0");
            registers[9] = new real_register("s1");
            for (int i = 0; i < 8; ++i)
                registers[i + 10] = new real_register("a" + i);
            for (int i = 2; i < 12; ++i)
                registers[i + 16] = new real_register("s" + i);
            for (int i = 3; i < 7; ++i)
                registers[i + 25] = new real_register("t" + i);
        }
        return registers[get_index(name)];
    }

    public String toString(){
        return name;
    }

    public int get_this_index(){
        if(name.equals("ra")) throw new RuntimeException("real_register.get_this_index : ra is not a color");
        if(name.equals("sp")) throw new RuntimeException("real_register.get_this_index : sp is not a color");
        if(name.startsWith("a")) return Integer.parseInt(name.substring(1)) + 10;
        if(name.equals("t0")) return 5;
        if(name.equals("t1")) return 6;
        if(name.equals("t2")) return 7;
        if(name.equals("s0")) return 8;
        if(name.equals("s1")) return 9;
        if(name.startsWith("s")) return Integer.parseInt(name.substring(1)) + 16;
        if(name.startsWith("t")) return Integer.parseInt(name.substring(1)) + 25;
        throw new RuntimeException("real_register.get_this_index : unknown register name");
    }



}
