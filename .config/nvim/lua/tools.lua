local api = vim.api
local buf = vim.opt.bo
local M = {}
function M.makeScratch()
 api.nvim_command('enew')
 buf.buftype=nofile
 buf.bufhidden=hide
 buf.swapfile=false
end

return M