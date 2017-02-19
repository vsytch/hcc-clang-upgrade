// RUN: %clang -cl-std=CL2.0 -emit-llvm -g -O0 -S -target amdgcn-amd-amdhsa -mcpu=fiji -o - %s | FileCheck %s

// CHECK-DAG: ![[ADDRSPACE1:[0-9]+]] = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !{{[0-9]+}}, size: {{[0-9]+}}, addressSpace: 1)
// CHECK-DAG: ![[ADDRSPACE2:[0-9]+]] = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !{{[0-9]+}}, size: {{[0-9]+}}, addressSpace: 2)
// CHECK-DAG: ![[ADDRSPACE3:[0-9]+]] = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !{{[0-9]+}}, size: {{[0-9]+}}, addressSpace: 3)
// CHECK-DAG: ![[ADDRSPACE4:[0-9]+]] = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !{{[0-9]+}}, size: {{[0-9]+}}, addressSpace: 4)

// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar0", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE1]], isLocal: false, isDefinition: true)
global int *FileVar0;
// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar1", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE2]], isLocal: false, isDefinition: true)
constant int *FileVar1;
// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar2", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE3]], isLocal: false, isDefinition: true)
local int *FileVar2;
// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar3", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE4]], isLocal: false, isDefinition: true)
int *FileVar3;

// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar4", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE1]], isLocal: false, isDefinition: true)
global int *global FileVar4;
// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar5", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE2]], isLocal: false, isDefinition: true)
constant int *global FileVar5;
// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar6", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE3]], isLocal: false, isDefinition: true)
local int *global FileVar6;
// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar7", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE4]], isLocal: false, isDefinition: true)
int *global FileVar7;

// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar8", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE1]], isLocal: false, isDefinition: true)
global int *constant FileVar8 = 0;
// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar9", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE2]], isLocal: false, isDefinition: true)
constant int *constant FileVar9 = 0;
// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar10", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE3]], isLocal: false, isDefinition: true)
local int *constant FileVar10 = 0;
// CHECK-DAG: distinct !DIGlobalVariable(name: "FileVar11", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE4]], isLocal: false, isDefinition: true)
int *constant FileVar11 = 0;

// CHECK-DAG: !DILocalVariable(name: "KernelArg0", arg: 1, scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE1]])
// CHECK-DAG: !DILocalVariable(name: "KernelArg1", arg: 2, scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE2]])
// CHECK-DAG: !DILocalVariable(name: "KernelArg2", arg: 3, scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE3]])
kernel void kernel1(global int *KernelArg0,
                    constant int *KernelArg1,
                    local int *KernelArg2) {
  int *Tmp;

  // CHECK-DAG: !DILocalVariable(name: "FuncVar0", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE1]])
  global int *FuncVar0 = KernelArg0;
  // CHECK-DAG: !DILocalVariable(name: "FuncVar1", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE2]])
  constant int *FuncVar1 = KernelArg1;
  // CHECK-DAG: !DILocalVariable(name: "FuncVar2", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE3]])
  local int *FuncVar2 = KernelArg2;
  // CHECK-DAG: !DILocalVariable(name: "FuncVar3", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE4]])
  int *FuncVar3 = Tmp;

  // CHECK-DAG: !DILocalVariable(name: "FuncVar4", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE1]])
  global int *constant FuncVar4 = KernelArg0;
  // CHECK-DAG: !DILocalVariable(name: "FuncVar5", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE2]])
  constant int *constant FuncVar5 = KernelArg1;
  // CHECK-DAG: !DILocalVariable(name: "FuncVar6", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE3]])
  local int *constant FuncVar6 = KernelArg2;
  // CHECK-DAG: !DILocalVariable(name: "FuncVar7", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE4]])
  int *constant FuncVar7 = Tmp;

  // CHECK-DAG: distinct !DIGlobalVariable(name: "FuncVar8", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE1]], isLocal: true, isDefinition: true)
  global int *local FuncVar8; FuncVar8 = KernelArg0;
  // CHECK-DAG: distinct !DIGlobalVariable(name: "FuncVar9", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE2]], isLocal: true, isDefinition: true)
  constant int *local FuncVar9; FuncVar9 = KernelArg1;
  // CHECK-DAG: distinct !DIGlobalVariable(name: "FuncVar10", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE3]], isLocal: true, isDefinition: true)
  local int *local FuncVar10; FuncVar10 = KernelArg2;
   // CHECK-DAG: distinct !DIGlobalVariable(name: "FuncVar11", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE4]], isLocal: true, isDefinition: true)
  int *local FuncVar11; FuncVar11 = Tmp;

  // CHECK-DAG: !DILocalVariable(name: "FuncVar12", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE1]])
  global int *private FuncVar12 = KernelArg0;
  // CHECK-DAG: !DILocalVariable(name: "FuncVar13", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE2]])
  constant int *private FuncVar13 = KernelArg1;
  // CHECK-DAG: !DILocalVariable(name: "FuncVar14", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE3]])
  local int *private FuncVar14 = KernelArg2;
  // CHECK-DAG: !DILocalVariable(name: "FuncVar15", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, type: ![[ADDRSPACE4]])
  int *private FuncVar15 = Tmp;
}

struct FileStruct0 {
  // CHECK-DAG: !DIDerivedType(tag: DW_TAG_member, name: "StructMem0", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, baseType: ![[ADDRSPACE1]], size: {{[0-9]+}})
  global int *StructMem0;
  // CHECK-DAG: !DIDerivedType(tag: DW_TAG_member, name: "StructMem1", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, baseType: ![[ADDRSPACE2]], size: {{[0-9]+}}, offset: {{[0-9]+}})
  constant int *StructMem1;
  // CHECK-DAG: !DIDerivedType(tag: DW_TAG_member, name: "StructMem2", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, baseType: ![[ADDRSPACE3]], size: {{[0-9]+}}, offset: {{[0-9]+}})
  local int *StructMem2;
  // CHECK-DAG: !DIDerivedType(tag: DW_TAG_member, name: "StructMem3", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, baseType: ![[ADDRSPACE4]], size: {{[0-9]+}}, offset: {{[0-9]+}})
  int *StructMem3;
};

struct FileStruct1 {
  union {
    // CHECK-DAG: !DIDerivedType(tag: DW_TAG_member, name: "UnionMem0", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, baseType: ![[ADDRSPACE1]], size: {{[0-9]+}})
    global int *UnionMem0;
    // CHECK-DAG: !DIDerivedType(tag: DW_TAG_member, name: "UnionMem1", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, baseType: ![[ADDRSPACE2]], size: {{[0-9]+}})
    constant int *UnionMem1;
    // CHECK-DAG: !DIDerivedType(tag: DW_TAG_member, name: "UnionMem2", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, baseType: ![[ADDRSPACE3]], size: {{[0-9]+}})
    local int *UnionMem2;
    // CHECK-DAG: !DIDerivedType(tag: DW_TAG_member, name: "UnionMem3", scope: !{{[0-9]+}}, file: !{{[0-9]+}}, line: {{[0-9]+}}, baseType: ![[ADDRSPACE4]], size: {{[0-9]+}})
    int *UnionMem3;
  };
  long StructMem0;
};

kernel void kernel2(global struct FileStruct0 *Kernel2Arg0,
                    global struct FileStruct1 *Kernel2Arg1) {}
