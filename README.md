# SwiftCompilerPerformanceTest
Some test on Swift/LLVM compiler code optimization

A super simple FOR loop implemented in three different ways in order to see how different swift/llvm compiler optimization generate intermediate AST/IL and final IR and assembly code.


# Compile options

  -Onone                  Compile without any optimization
  -Osize                  Compile with optimizations and target small code size
  -Ounchecked             Compile with optimizations and remove runtime safety checks
  [NO -Oxxx] ?

    xcrun swiftc -Onone main.swift -o mainNone
    xcrun swiftc -Osize main.swift -o mainSize
    xcrun swiftc -Ounchecked main.swift -o mainUnckecked
    xcrun swiftc main.swift -o mainNoO

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


