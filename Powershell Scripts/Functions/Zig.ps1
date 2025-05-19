function Add-ZigStandard {
    [CmdletBinding()]
    param (
        [string] $name,
        [string] $path = "."
    )

    Set-Location $path

    if (!(Test-Path "$path\$name" -PathType Container)) {
        mkdir $name
    }

    Set-Location $name

    "const std = @import(`"std`");`n`npub fn build(b: *std.Build) void {`n    const exe = b.addExecutable(.{`n        .name = `"$name`",`n        .root_source_file = b.path(`"src/main.zig`"),`n        .target = b.standardTargetOptions(.{}),`n        .optimize = b.standardOptimizeOption(.{}),`n    });`n    b.installArtifact(exe);`n`n    const run_exe = b.addRunArtifact(exe);`n`n    const run_step = b.step(`"run`", `"Run the application`");`n`n    run_step.dependOn(&run_exe.step);`n`n    exe.linkSystemLibrary(`"c`");`n}" > "build.zig"

    mkdir "src"

    "const std = @import(`"std`");`n`npub fn main() !void {`n`n}" > "src\main.zig"

    "zig build -Dtarget=x86_64-windows -Doptimize=ReleaseSmall" > "windows-small.ps1"

    "zig build -Dtarget=x86_64-windows -Doptimize=ReleaseFast" > "windows-fast.ps1"
}

function Add-ZigNoC {
    [CmdletBinding()]
    param (
        [string] $name,
        [string] $path = "."
    )

    Set-Location $path

    if (!(Test-Path "$path\$name" -PathType Container)) {
        mkdir $name
    }

    Set-Location $name

    "const std = @import(`"std`");`n`npub fn build(b: *std.Build) void {`n    const exe = b.addExecutable(.{`n        .name = `"$name`",`n        .root_source_file = b.path(`"src/main.zig`"),`n        .target = b.standardTargetOptions(.{}),`n        .optimize = b.standardOptimizeOption(.{}),`n    });`n    b.installArtifact(exe);`n`n    const run_exe = b.addRunArtifact(exe);`n`n    const run_step = b.step(`"run`", `"Run the application`");`n`n    run_step.dependOn(&run_exe.step);`n}" > "build.zig"

    mkdir "src"

    "const std = @import(`"std`");`n`npub fn main() !void {`n`n}" > "src\main.zig"

    "zig build -Dtarget=x86_64-windows -Doptimize=ReleaseSmall" > "windows-small.ps1"

    "zig build -Dtarget=x86_64-windows -Doptimize=ReleaseFast" > "windows-fast.ps1"
}