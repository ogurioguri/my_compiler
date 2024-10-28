declare void @print(ptr)
declare ptr @_string.concat(ptr, ptr)
declare ptr @_string.copy(ptr)
declare i32 @_string.compare(ptr, ptr)
declare ptr @_malloc_array(i32, i32)
declare ptr @_malloc(i32)
declare void @println(ptr)
declare void @printInt(i32)
declare void @printlnInt(i32)
declare ptr @getString()
declare i32 @getInt()
declare ptr @toString(i32)
declare i32 @_string.length(ptr)
declare ptr @_string.substring(ptr, i32, i32)
declare i32 @_string.parseInt(ptr)
declare i32 @_string.ord(ptr, i32)
@n.0 = global i32 0
@a.0 = global ptr null
@i.1 = global i32 0
define void @__init() {
entry:
    %__tmp.0 = call ptr @_malloc_array(i32 4, i32 20)
    store ptr %__tmp.0, ptr @a.0
    ret void
}
define i32 @jud(i32 %_x) {
entry:
    br label %for.cond0
for.cond0:
    %_flag.0.0 = phi i1 [ 0, %entry ], [ %_flag.0.1, %for.step0 ]
    %_i.0.0 = phi i32 [ 0, %entry ], [ %__tmp.36, %for.step0 ]
    %_j.0.0 = phi i32 [ 0, %entry ], [ %_j.0.1, %for.step0 ]
    %__tmp.3 = load i32, ptr @n.0
    %__tmp.5 = sdiv i32 %__tmp.3, %_x
    %__tmp.6 = icmp slt i32 %_i.0.0, %__tmp.5
    br i1 %__tmp.6, label %for.body0, label %for.merge0
for.body0:
    br label %for.cond1
for.cond1:
    %_flag.0.1 = phi i1 [ %_flag.0.2, %for.step1 ], [ 0, %for.body0 ]
    %_j.0.1 = phi i32 [ %__tmp.32, %for.step1 ], [ 0, %for.body0 ]
    %__tmp.10 = sub i32 %_x, 1
    %__tmp.11 = icmp slt i32 %_j.0.1, %__tmp.10
    br i1 %__tmp.11, label %for.body1, label %for.merge1
for.body1:
    %__tmp.12 = load ptr, ptr @a.0
    %__tmp.15 = mul i32 %_i.0.0, %_x
    %__tmp.17 = add i32 %__tmp.15, %_j.0.1
    %__tmp.18 = getelementptr i32, ptr %__tmp.12, i32 %__tmp.17
    %__tmp.19 = load i32, ptr %__tmp.18
    %__tmp.20 = load ptr, ptr @a.0
    %__tmp.23 = mul i32 %_i.0.0, %_x
    %__tmp.25 = add i32 %__tmp.23, %_j.0.1
    %__tmp.26 = add i32 %__tmp.25, 1
    %__tmp.27 = getelementptr i32, ptr %__tmp.20, i32 %__tmp.26
    %__tmp.28 = load i32, ptr %__tmp.27
    %__tmp.29 = icmp sgt i32 %__tmp.19, %__tmp.28
    br i1 %__tmp.29, label %if.then0, label %split0
split0:
    br label %if.merge0
if.then0:
    br label %if.merge0
if.merge0:
    %_flag.0.2 = phi i1 [ 1, %if.then0 ], [ %_flag.0.1, %split0 ]
    br label %for.step1
for.step1:
    %__tmp.32 = add i32 %_j.0.1, 1
    br label %for.cond1
for.merge1:
    %__tmp.34 = xor i1 %_flag.0.1, 1
    br i1 %__tmp.34, label %if.then1, label %if.merge1
if.then1:
    ret i32 1
if.merge1:
    br label %for.step0
for.step0:
    %__tmp.36 = add i32 %_i.0.0, 1
    br label %for.cond0
for.merge0:
    ret i32 0
}
define i32 @main() {
entry:
    call void @__init()
    %__tmp.37 = load i32, ptr @n.0
    %__tmp.38 = call i32 @getInt()
    store i32 %__tmp.38, ptr @n.0
    %__tmp.39 = load i32, ptr @i.1
    store i32 0, ptr @i.1
    br label %for.cond2
for.cond2:
    %__tmp.40 = load i32, ptr @i.1
    %__tmp.41 = load i32, ptr @n.0
    %__tmp.42 = icmp slt i32 %__tmp.40, %__tmp.41
    br i1 %__tmp.42, label %for.body2, label %for.merge2
for.body2:
    %__tmp.43 = load ptr, ptr @a.0
    %__tmp.44 = load i32, ptr @i.1
    %__tmp.45 = getelementptr i32, ptr %__tmp.43, i32 %__tmp.44
    %__tmp.46 = load i32, ptr %__tmp.45
    %__tmp.47 = call i32 @getInt()
    store i32 %__tmp.47, ptr %__tmp.45
    br label %for.step2
for.step2:
    %__tmp.48 = load i32, ptr @i.1
    %__tmp.49 = add i32 %__tmp.48, 1
    store i32 %__tmp.49, ptr @i.1
    br label %for.cond2
for.merge2:
    %__tmp.50 = load i32, ptr @i.1
    %__tmp.51 = load i32, ptr @n.0
    store i32 %__tmp.51, ptr @i.1
    br label %for.cond3
for.cond3:
    %__tmp.52 = load i32, ptr @i.1
    %__tmp.53 = icmp sgt i32 %__tmp.52, 0
    br i1 %__tmp.53, label %for.body3, label %for.merge3
for.body3:
    %__tmp.55 = load i32, ptr @i.1
    %__tmp.54 = call i32 @jud(i32 %__tmp.55)
    %__tmp.56 = icmp sgt i32 %__tmp.54, 0
    br i1 %__tmp.56, label %if.then2, label %if.merge2
if.then2:
    %__tmp.58 = load i32, ptr @i.1
    %__tmp.57 = call ptr @toString(i32 %__tmp.58)
    call void @print(ptr %__tmp.57)
    ret i32 0
if.merge2:
    br label %for.step3
for.step3:
    %__tmp.59 = load i32, ptr @i.1
    %__tmp.60 = load i32, ptr @i.1
    %__tmp.61 = sdiv i32 %__tmp.60, 2
    store i32 %__tmp.61, ptr @i.1
    br label %for.cond3
for.merge3:
    ret i32 0
}

