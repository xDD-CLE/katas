#r @"packages/FAKE/tools/FakeLib.dll"

open Fake
open System.IO

let output_directory = "build/"
let buildDir = Path.Combine(output_directory, "build")
let projectFile = Include("./Adder/Adder.fsproj")
let testAssemblies = Include(Path.Combine(buildDir,"*.dll"))

let Build = fun(projects:FileIncludes) (directory:string)(config:(string*string) list) -> 
    let target = "Build"
    MSBuild directory target config projects
    |> ignore

Target "Clean" (
    fun _ -> 
        CleanDirs [output_directory;]
    )

Target "Build" (
    fun _ ->
        Build projectFile buildDir [("Configuration", "Debug");]     
)

Target "RunUnitTest" (
    fun _ -> 
        testAssemblies
        |> NUnit(fun p ->
            {p with
                DisableShadowCopy = true;
                OutputFile = output_directory + "/UnitTestsResults.xml" 
            }
        )
)

"Clean"
==> "Build"
==> "RunUnitTest"

RunTargetOrDefault "RunUnitTest"
