local function load(pattern)
  for _, path in ipairs(vim.fn.glob("/nix/store/*" .. pattern .. "*", 1, 1)) do
    vim.opt.runtimepath:append(path)
    -- print("Added: " .. path)
  end
end

_G.load = load
