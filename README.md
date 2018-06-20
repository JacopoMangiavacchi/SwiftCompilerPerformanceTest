# SwiftCompilerPerformanceTest
Some test on Swift/LLVM compiler code optimization

A super simple FOR loop implemented in three different ways in order to force and see how different swift/llvm compiler optimization generate intermediate AST/IL and final IR and assembly code.


# Compile options

## Flags:
    [NO -Oxxx] ?
    -Onone                  Compile without any optimization
    -Osize                  Compile with optimizations and target small code size
    -Ounchecked             Compile with optimizations and remove runtime safety checks

## Build commands:
    xcrun swiftc main.swift -o mainNoO
    xcrun swiftc -Onone main.swift -o mainNone
    xcrun swiftc -Osize main.swift -o mainSize
    xcrun swiftc -Ounchecked main.swift -o mainUnckecked


# Test Results for 100.000.000 interactions

## ./mainNone 100000000
    Time elapsed for loop1: 4.335011 s.
    Time elapsed for loop2: 4.224746 s.
    Time elapsed for loop3: 4.023189 s.

## ./mainNoO 100000000
    Time elapsed for loop1: 4.311961 s.
    Time elapsed for loop2: 4.155364 s.
    Time elapsed for loop3: 4.274352 s.

## ./mainSize 100000000
    Time elapsed for loop1: 0.071148 s.
    Time elapsed for loop2: 0.074197 s.
    Time elapsed for loop3: 0.075792 s.

## ./mainUnckecked 100000000
    Time elapsed for loop1: 0.070285 s.
    Time elapsed for loop2: 0.073247 s.
    Time elapsed for loop3: 0.075532 s.


# Hopper Disassembler intermediate language

Use Hopper to disassembly the compile code for the differnt optimizations above and select "Show Pseudo Code of Procedure" to see pseudo intermediate code.


# Swift Abstract Syntax Tree (AST)

    swiftc –dump-ast main.swift

# Swift Intermediate Language (SIL)

    swiftc –emit-sil main.swift
    
# LLVM Intermediate Representation (LLVM IR)

    swiftc –emit-ir main.swift

# Assembly Language

    swiftc –emit-assembly main.swift


