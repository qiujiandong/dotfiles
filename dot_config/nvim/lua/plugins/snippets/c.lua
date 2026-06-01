local ls = require 'luasnip'
local s = ls.snippet
local f = ls.function_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

-- Cache the current date to avoid multiple os.date() calls
local current_date = os.date '%Y-%m-%d'
local current_year = os.date '%Y'

-- Helper to safely get git config values
local function get_git_config(key)
  local handle = io.popen('git config ' .. key)
  if handle then
    local result = handle:read '*a'
    handle:close()
    return result:gsub('\n', ''):gsub('^%s+', ''):gsub('%s+$', '')
  end
  return 'Unknown'
end

ls.add_snippets('c', {
  -- C file header snippet
  s(
    'header_apache',
    fmt(
      [[
/**
 * @file {}
 * @brief {}
 * @author {} <{}>
 * @date {}
 *
 * Copyright (c) {} Jiandong Qiu
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

]],
      {
        f(function() return vim.fn.expand '%:t' end),
        i(1, 'Short description'),
        f(function() return get_git_config 'user.name' end),
        f(function() return get_git_config 'user.email' end),
        f(function() return current_date end),
        f(function() return current_year end),
      }
    )
  ),
})
