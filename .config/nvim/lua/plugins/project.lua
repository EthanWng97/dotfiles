require("project_nvim").setup {
    exclude_dirs = { "~/Downloads" },
    detection_methods = { "lsp", "pattern" },
    silent_chdir = false
}
