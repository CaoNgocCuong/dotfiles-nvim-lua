local status, sr = pcall(require, 'nvim-surround')

if not status then
  return
end

sr.setup({
  -- Your configuration here
})
