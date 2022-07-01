local feline_status_ok, feline = pcall(require, "feline")
if not feline_status_ok then
  return
end

local opts = {
    active = {},
    inactive = {}
}

feline.setup(opts)
