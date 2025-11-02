if not ($nu.data-dir | path join "vendor/autoload" | path exists) {
    mkdir ($nu.data-dir | path join "vendor/autoload")
}
if not ($nu.data-dir | path join "vendor/autoload/mise.nu" | path exists) {
    ^mise activate nu | save -f ($nu.data-dir | path join "vendor/autoload/mise.nu")
}

