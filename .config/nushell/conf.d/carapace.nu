if not ($nu.data-dir | path join "vendor/autoload" | path exists) {
    mkdir ($nu.data-dir | path join "vendor/autoload")
}
if not ($nu.data-dir | path join "vendor/autoload/carapace.nu" | path exists) {
    if (which carapace | is-empty) {
        print "run below command to initialize carapace"
        print "carapace _carapace nushell | save -f ($nu.data-dir | path join 'vendor/autoload/carapace.nu')"
    } else {
        carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")
    }
}
