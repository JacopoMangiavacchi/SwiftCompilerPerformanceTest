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
    Time elapsed for loop1: 4.159429 s.
    Time elapsed for loop2: 4.090920 s.
    Time elapsed for loop3: 4.036773 s.
    Time elapsed for loop4: 1.951043 s.
    Time elapsed for loop5: 1.833384 s.

## ./mainNoO 100000000
    Time elapsed for loop1: 4.114079 s.
    Time elapsed for loop2: 3.987778 s.
    Time elapsed for loop3: 4.002102 s.
    Time elapsed for loop4: 1.904206 s.
    Time elapsed for loop5: 1.796194 s.

## ./mainSize 100000000
    Time elapsed for loop1: 0.063103 s.
    Time elapsed for loop2: 0.075908 s.
    Time elapsed for loop3: 0.090376 s.
    Time elapsed for loop4: 0.088139 s.
    Time elapsed for loop5: 0.082575 s.

## ./mainUnckecked 100000000
    Time elapsed for loop1: 0.064939 s.
    Time elapsed for loop2: 0.068565 s.
    Time elapsed for loop3: 0.094197 s.
    Time elapsed for loop4: 0.086634 s.
    Time elapsed for loop5: 0.091103 s.


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


