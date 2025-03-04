local function init()
  require 'astasko.vim'.init()
  require 'astasko.remap'.init()
  require 'astasko.lazy'.init()
end

return {
  init = init,
}
