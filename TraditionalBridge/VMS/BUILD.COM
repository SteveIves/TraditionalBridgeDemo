$ !
$ WRITE SYS$OUTPUT "Compiling traditional bridge code..."
$ !
$ DBL/OPT/WARNINGS=1 /OBJ=OBJ:TraditionalBridgeHost.obj -
!
 [.Dispatchers]AddTwoNumbersDispatcher.dbl+ -
 [.Dispatchers]GetEnvironmentDispatcher.dbl+ -
 [.Dispatchers]GetLogicalNameDispatcher.dbl+ -
!
 [.ExposedRoutines]AddTwoNumbers.dbl+ -
 [.ExposedRoutines]GetEnvironment.dbl+ -
 [.ExposedRoutines]GetLogicalName.dbl+ -
!
 [.LibraryCode]ArgumentDataDefinition.dbl+ -
 [.LibraryCode]Convert.dbl+ -
 [.LibraryCode]DataObjectBase.dbl+ -
 [.LibraryCode]DataObjectMetaDataBase.dbl+ -
 [.LibraryCode]FieldDataDefinition.dbl+ -
 [.LibraryCode]Json.dbl+ -
 [.LibraryCode]Logger.dbl+ -
 [.LibraryCode]RoutineDispatcher.dbl+ -
 [.LibraryCode]Serializer.dbl+ -
 [.LibraryCode]StringDictionary.dbl+ -
!
 RequestDispatcher.dbl+ -
 TraditionalBridgeHost.dbl
$ !
$ WRITE SYS$OUTPUT "Linking traditional bridge code..."
$ !
$ LINK/EXE=EXE:TraditionalBridgeHost.exe OBJ:TraditionalBridgeHost.obj,SYS$SHARE:SYNRTL/OPT
$ !
