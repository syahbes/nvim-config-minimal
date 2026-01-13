local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- Import statement
	s(
		"imp",
		fmt(
			[[
import {{ {} }} from '{}';
]],
			{
				i(2, ""),
				i(1, ""),
			}
		)
	),

	-- Console log
	s(
		"log",
		fmt(
			[[
console.log({})
]],
			{
				i(1, ""),
			}
		)
	),

	-- Try-catch
	s(
		"tc",
		fmt(
			[[
try {{
  {}
}} catch (error) {{
  console.error({});
}}
]],
			{
				i(1, ""),
				i(2, "error"),
			}
		)
	),
}
