local T = MiniTest.new_set()

local Opts = require("find_exe.opts")

T['can parse an empty opts table'] = function()
  -- Arrange
  local t = {}
  local expected = { dir = ".", execute = false }

  -- Act
  local parsed = Opts.parse_opts(t)

  -- Assert
  MiniTest.expect.equality(parsed, expected)
end

T['should respect user set directory'] = function()
  -- Arrange
  local t = { dir = "/usr/local/bin/ffmpeg" }
  local expected = { dir = "/usr/local/bin/ffmpeg", execute = false }

  -- Act
  local parsed = Opts.parse_opts(t)

  -- Assert
  MiniTest.expect.equality(parsed, expected)
end

T['should respect user set executable flag'] = function()
  -- Arrange
  local t = { execute = true }
  local expected = { dir = ".", execute = true }

  -- Act
  local parsed = Opts.parse_opts(t)

  -- Assert
  MiniTest.expect.equality(parsed, expected)
end

T['should reject unexpected fields'] = function()
  -- Arrange
  local t = { color = "red" }

  -- Act & Assert
  MiniTest.expect.error(function()
    Opts.parse_opts(t)
  end, "Unexpected field 'color' in options table")
end

return T
