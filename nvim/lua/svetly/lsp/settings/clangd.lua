local opts = {
    cmd = {
        "clangd",
        "--background-index",
        "--enable-config",
        "--clang-tidy",
        "--completion-style=detailed",
        "--function-arg-placeholders",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    single_file_support = true
}

return opts
