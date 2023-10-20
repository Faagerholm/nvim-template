local status, rest = pcall(require, 'rest-nvim')
if not status then
  return
end

rest-nvim.setup({
  result_split_horizontal = true,
})
