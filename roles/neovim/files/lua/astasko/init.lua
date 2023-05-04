local function init()
  require 'astasko.vim'.init()
  require 'astasko.packer'.init()
end

return {
  init = init,
}
