if not ($nu.data-dir | path join "vendor/autoload" | path exists) {
    mkdir ($nu.data-dir | path join "vendor/autoload")
}
if not ($nu.data-dir | path join "vendor/autoload/starship.nu" | path exists) {
    if (which starship | is-empty) {
        print "run below command to initialize starship"
        print "starship init nu | save -f ($nu.data-dir | path join 'vendor/autoload/starship.nu')"
    } else {
        starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    }
}

