if not ($nu.data-dir | path join "vendor/autoload" | path exists) {
    mkdir ($nu.data-dir | path join "vendor/autoload")
}
if not ($nu.data-dir | path join "vendor/autoload/zoxide.nu" | path exists) {
    if (which zoxide | is-empty) {
        print "run the below command to initialize zoxide"
        print "zoxide init nushell | save -f ($nu.data-dir | path join 'vendor/autoload/zoxide.nu')"
    } else {
        zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
    }
}
