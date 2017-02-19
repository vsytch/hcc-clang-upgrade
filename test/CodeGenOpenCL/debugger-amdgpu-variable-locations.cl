// RUN: %clang -cl-std=CL2.0 -emit-llvm -g -O0 -S -target amdgcn-amd-amdhsa -mcpu=fiji -o - %s | FileCheck %s

// CHECK-DAG: ![[ADDRSPACE0:[0-9]+]] = !DIExpression(DW_OP_constu, 0, DW_OP_swap, DW_OP_xderef)
// CHECK-DAG: ![[ADDRSPACE1:[0-9]+]] = !DIExpression(DW_OP_constu, 1, DW_OP_swap, DW_OP_xderef)
// CHECK-DAG: ![[ADDRSPACE2:[0-9]+]] = !DIExpression(DW_OP_constu, 2, DW_OP_swap, DW_OP_xderef)
// CHECK-DAG: ![[ADDRSPACE3:[0-9]+]] = !DIExpression(DW_OP_constu, 3, DW_OP_swap, DW_OP_xderef)

// CHECK-DAG: ![[FILEVAR0:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar0", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR0]], expr: ![[ADDRSPACE1]])
global int *FileVar0;
// CHECK-DAG: ![[FILEVAR1:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar1", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR1]], expr: ![[ADDRSPACE1]])
constant int *FileVar1;
// CHECK-DAG: ![[FILEVAR2:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar2", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR2]], expr: ![[ADDRSPACE1]])
local int *FileVar2;
// CHECK-DAG: ![[FILEVAR3:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar3", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR3]], expr: ![[ADDRSPACE1]])
int *FileVar3;

// CHECK-DAG: ![[FILEVAR4:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar4", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR4]], expr: ![[ADDRSPACE1]])
global int *global FileVar4;
// CHECK-DAG: ![[FILEVAR5:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar5", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR5]], expr: ![[ADDRSPACE1]])
constant int *global FileVar5;
// CHECK-DAG: ![[FILEVAR6:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar6", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR6]], expr: ![[ADDRSPACE1]])
local int *global FileVar6;
// CHECK-DAG: ![[FILEVAR7:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar7", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR7]], expr: ![[ADDRSPACE1]])
int *global FileVar7;

// CHECK-DAG: ![[FILEVAR8:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar8", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR8]], expr: ![[ADDRSPACE2]])
global int *constant FileVar8 = 0;
// CHECK-DAG: ![[FILEVAR9:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar9", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR9]], expr: ![[ADDRSPACE2]])
constant int *constant FileVar9 = 0;
// CHECK-DAG: ![[FILEVAR10:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar10", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR10]], expr: ![[ADDRSPACE2]])
local int *constant FileVar10 = 0;
// CHECK-DAG: ![[FILEVAR11:[0-9]+]] = distinct !DIGlobalVariable(name: "FileVar11", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: false, isDefinition: true)
// CHECK-DAG: !DIGlobalVariableExpression(var: ![[FILEVAR11]], expr: ![[ADDRSPACE2]])
int *constant FileVar11 = 0;

// CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(1)** %KernelArg0.addr, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
// CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(2)** %KernelArg1.addr, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
// CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(3)** %KernelArg2.addr, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
kernel void kernel1(global int *KernelArg0,
                    constant int *KernelArg1,
                    local int *KernelArg2) {
  int *Tmp;

  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(1)** %FuncVar0, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
  global int *FuncVar0 = KernelArg0;
  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(2)** %FuncVar1, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
  constant int *FuncVar1 = KernelArg1;
  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(3)** %FuncVar2, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
  local int *FuncVar2 = KernelArg2;
  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(4)** %FuncVar3, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
  int *FuncVar3 = Tmp;

  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(1)** %FuncVar4, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE2]])
  global int *constant FuncVar4 = KernelArg0;
  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(2)** %FuncVar5, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE2]])
  constant int *constant FuncVar5 = KernelArg1;
  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(3)** %FuncVar6, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE2]])
  local int *constant FuncVar6 = KernelArg2;
  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(4)** %FuncVar7, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE2]])
  int *constant FuncVar7 = Tmp;

  // CHECK-DAG: ![[FUNCVAR8:[0-9]+]] = distinct !DIGlobalVariable(name: "FuncVar8", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: true, isDefinition: true)
  // CHECK-DAG: !DIGlobalVariableExpression(var: ![[FUNCVAR8]], expr: ![[ADDRSPACE3]])
  global int *local FuncVar8; FuncVar8 = KernelArg0;
  // CHECK-DAG: ![[FUNCVAR9:[0-9]+]] = distinct !DIGlobalVariable(name: "FuncVar9", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: true, isDefinition: true)
  // CHECK-DAG: !DIGlobalVariableExpression(var: ![[FUNCVAR9]], expr: ![[ADDRSPACE3]])
  constant int *local FuncVar9; FuncVar9 = KernelArg1;
  // CHECK-DAG: ![[FUNCVAR10:[0-9]+]] = distinct !DIGlobalVariable(name: "FuncVar10", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: true, isDefinition: true)
  // CHECK-DAG: !DIGlobalVariableExpression(var: ![[FUNCVAR10]], expr: ![[ADDRSPACE3]])
  local int *local FuncVar10; FuncVar10 = KernelArg2;
  // CHECK-DAG: ![[FUNCVAR11:[0-9]+]] = distinct !DIGlobalVariable(name: "FuncVar11", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: !{{[0-9]+}}, isLocal: true, isDefinition: true)
  // CHECK-DAG: !DIGlobalVariableExpression(var: ![[FUNCVAR11]], expr: ![[ADDRSPACE3]])
  int *local FuncVar11; FuncVar11 = Tmp;

  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(1)** %FuncVar12, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
  global int *private FuncVar12 = KernelArg0;
  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(2)** %FuncVar13, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
  constant int *private FuncVar13 = KernelArg1;
  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(3)** %FuncVar14, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
  local int *private FuncVar14 = KernelArg2;
  // CHECK-DAG: call void @llvm.dbg.declare(metadata i32 addrspace(4)** %FuncVar15, metadata !{{[0-9]+}}, metadata ![[ADDRSPACE0]])
  int *private FuncVar15 = Tmp;
}
