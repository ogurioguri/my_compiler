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
define i32 @main() {
entry:
    %_a.0 = alloca ptr
    %__tmp.0 = call ptr @_malloc_array(i32 4, i32 100)
    %__tmp.1 = alloca i32
    store i32 0, ptr %__tmp.1
    br label %for.cond0
for.cond0:
    %_1i.0 = load i32, ptr %__tmp.1
    %_cond.0 = icmp slt i32 %_1i.0, 100
    br i1 %_cond.0, label %for.body0, label %for.merge0
for.body0:
    %__tmp.2 = getelementptr ptr, ptr %__tmp.0, i32 %_1i.0
    %__tmp.3 = call ptr @_malloc_array(i32 4, i32 200)
    %__tmp.4 = alloca i32
    store i32 0, ptr %__tmp.4
    br label %for.cond1
for.cond1:
    %_1i.1 = load i32, ptr %__tmp.4
    %_cond.1 = icmp slt i32 %_1i.1, 200
    br i1 %_cond.1, label %for.body1, label %for.merge1
for.body1:
    %__tmp.5 = getelementptr ptr, ptr %__tmp.3, i32 %_1i.1
    %__tmp.6 = call ptr @_malloc_array(i32 4, i32 300)
    %__tmp.7 = alloca i32
    store i32 0, ptr %__tmp.7
    br label %for.cond2
for.cond2:
    %_1i.2 = load i32, ptr %__tmp.7
    %_cond.2 = icmp slt i32 %_1i.2, 300
    br i1 %_cond.2, label %for.body2, label %for.merge2
for.body2:
    %__tmp.8 = getelementptr ptr, ptr %__tmp.6, i32 %_1i.2
    %__tmp.9 = call ptr @_malloc_array(i32 4, i32 500)
    store ptr %__tmp.9, ptr %__tmp.8
    br label %for.step2
for.step2:
    %__tmp.10 = add i32 %_1i.2, 1
    store i32 %__tmp.10, ptr %__tmp.7
    br label %for.cond2
for.merge2:
    store ptr %__tmp.6, ptr %__tmp.5
    br label %for.step1
for.step1:
    %__tmp.11 = add i32 %_1i.1, 1
    store i32 %__tmp.11, ptr %__tmp.4
    br label %for.cond1
for.merge1:
    store ptr %__tmp.3, ptr %__tmp.2
    br label %for.step0
for.step0:
    %__tmp.12 = add i32 %_1i.0, 1
    store i32 %__tmp.12, ptr %__tmp.1
    br label %for.cond0
for.merge0:
    store ptr %__tmp.0, ptr %_a.0
    %_b.0 = alloca i32
    %_c.0 = alloca ptr
    %__tmp.13 = load ptr, ptr %_a.0
    %__tmp.14 = getelementptr ptr, ptr %__tmp.13, i32 3
    %__tmp.15 = load ptr, ptr %__tmp.14
    store ptr %__tmp.15, ptr %_c.0
    %_d.0 = alloca ptr
    %__tmp.16 = load ptr, ptr %_c.0
    %__tmp.17 = getelementptr ptr, ptr %__tmp.16, i32 7
    %__tmp.18 = load ptr, ptr %__tmp.17
    store ptr %__tmp.18, ptr %_d.0
    %_e.0 = alloca i32
    %__tmp.19 = load ptr, ptr %_c.0
    %__tmp.20 = getelementptr ptr, ptr %__tmp.19, i32 7
    %__tmp.21 = load ptr, ptr %__tmp.20
    %__tmp.22 = getelementptr ptr, ptr %__tmp.21, i32 8
    %__tmp.23 = load ptr, ptr %__tmp.22
    %__tmp.24 = getelementptr i32, ptr %__tmp.23, i32 9
    %__tmp.25 = load i32, ptr %__tmp.24
    store i32 %__tmp.25, ptr %_e.0
    %__tmp.26 = load ptr, ptr %_d.0
    %__tmp.27 = getelementptr ptr, ptr %__tmp.26, i32 2
    %__tmp.28 = load ptr, ptr %__tmp.27
    %__tmp.29 = getelementptr i32, ptr %__tmp.28, i32 1
    %__tmp.30 = load i32, ptr %__tmp.29
    %__tmp.31 = load ptr, ptr %_c.0
    %__tmp.32 = getelementptr ptr, ptr %__tmp.31, i32 1
    %__tmp.33 = load ptr, ptr %__tmp.32
    %__tmp.34 = getelementptr ptr, ptr %__tmp.33, i32 2
    %__tmp.35 = load ptr, ptr %__tmp.34
    %__tmp.36 = getelementptr i32, ptr %__tmp.35, i32 3
    %__tmp.37 = load i32, ptr %__tmp.36
    %__tmp.38 = icmp eq i32 %__tmp.30, %__tmp.37
    br i1 %__tmp.38, label %if.then.0, label %if.else.0
if.then.0:
    %__tmp.39 = load ptr, ptr %_d.0
    %__tmp.40 = getelementptr ptr, ptr %__tmp.39, i32 2
    %__tmp.41 = load ptr, ptr %__tmp.40
    %__tmp.42 = getelementptr i32, ptr %__tmp.41, i32 2
    %__tmp.43 = load i32, ptr %__tmp.42
    %__tmp.44 = load ptr, ptr %_a.0
    %__tmp.45 = getelementptr ptr, ptr %__tmp.44, i32 1
    %__tmp.46 = load ptr, ptr %__tmp.45
    %__tmp.47 = getelementptr ptr, ptr %__tmp.46, i32 2
    %__tmp.48 = load ptr, ptr %__tmp.47
    %__tmp.49 = getelementptr ptr, ptr %__tmp.48, i32 3
    %__tmp.50 = load ptr, ptr %__tmp.49
    %__tmp.51 = getelementptr i32, ptr %__tmp.50, i32 4
    %__tmp.52 = load i32, ptr %__tmp.51
    %__tmp.53 = icmp eq i32 %__tmp.43, %__tmp.52
    br label %if.end.0
if.else.0:
    br label %if.end.0
if.end.0:
    %__tmp.54 = phi i1 [ %__tmp.53, %if.then.0 ], [ %__tmp.38, %if.else.0 ]
    br i1 %__tmp.54, label %if.then.1, label %if.else.1
if.then.1:
    %__tmp.55 = load ptr, ptr %_d.0
    %__tmp.56 = getelementptr ptr, ptr %__tmp.55, i32 2
    %__tmp.57 = load ptr, ptr %__tmp.56
    %__tmp.58 = getelementptr i32, ptr %__tmp.57, i32 3
    %__tmp.59 = load i32, ptr %__tmp.58
    %__tmp.60 = load i32, ptr %_b.0
    %__tmp.61 = icmp eq i32 %__tmp.59, %__tmp.60
    br label %if.end.1
if.else.1:
    br label %if.end.1
if.end.1:
    %__tmp.62 = phi i1 [ %__tmp.61, %if.then.1 ], [ %__tmp.54, %if.else.1 ]
    br i1 %__tmp.62, label %if.then2, label %if.merge2
if.then2:
    %__tmp.63 = load ptr, ptr %_c.0
    %__tmp.64 = getelementptr ptr, ptr %__tmp.63, i32 1
    %__tmp.65 = load ptr, ptr %__tmp.64
    %__tmp.66 = getelementptr ptr, ptr %__tmp.65, i32 2
    %__tmp.67 = load ptr, ptr %__tmp.66
    %__tmp.68 = getelementptr i32, ptr %__tmp.67, i32 3
    %__tmp.69 = load i32, ptr %__tmp.68
    %__tmp.70 = add i32 %__tmp.69, 1
    store i32 %__tmp.70, ptr %__tmp.68
    br label %if.merge2
if.merge2:
    ret i32 0
}

