open MLton.Rlimit
val _ =
   List.app
   (fn r => set (r, get r) handle _ => ())
   [cpuTime, coreFileSize, dataSize, fileSize, lockedInMemorySize, numFiles,
    numProcesses, residentSetSize, stackSize, virtualMemorySize]

val _ = print (concat [Bool.toString (infinity >= 0wxFFFF), "\n"])
