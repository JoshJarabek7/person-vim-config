return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = opts.sources or {}
    vim.list_extend(opts.sources, {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.nginx_beautifier,
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.terraform_fmt,
      nls.builtins.diagnostics.terraform_validate,
      nls.builtins.diagnostics.tfsec,
      nls.builtins.diagnostics.trivy,
    })
  end,
}
