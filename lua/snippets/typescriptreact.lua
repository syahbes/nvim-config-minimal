local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- React Function Component
  s("rfc", fmt([[
import React from 'react';

interface {}Props {{
  {}
}}

const {}: React.FC<{}Props> = ({}) => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]], {
    i(1, "Component"),
    i(2, "// props"),
    f(function(args) return args[1][1] end, {1}),
    f(function(args) return args[1][1] end, {1}),
    i(3, "props"),
    i(4, ""),
    f(function(args) return args[1][1] end, {1}),
  })),

  -- React Function Component (simple)
  s("rfcs", fmt([[
const {} = ({}) => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]], {
    i(1, "Component"),
    i(2, ""),
    i(3, ""),
    f(function(args) return args[1][1] end, {1}),
  })),

  -- useState hook
  s("us", fmt([[
const [{}, set{}] = useState{}({});
]], {
    i(1, "state"),
    f(function(args)
      local state = args[1][1]
      return state:sub(1,1):upper() .. state:sub(2)
    end, {1}),
    i(2, "<string>"),
    i(3, "''"),
  })),

  -- useEffect hook
  s("ue", fmt([[
useEffect(() => {{
  {}
}}, [{}]);
]], {
    i(1, "// effect"),
    i(2, ""),
  })),

  -- useRef hook
  s("ur", fmt([[
const {} = useRef{}({});
]], {
    i(1, "ref"),
    i(2, "<HTMLDivElement>"),
    i(3, "null"),
  })),

  -- useContext hook
  s("uc", fmt([[
const {} = useContext({});
]], {
    i(1, "value"),
    i(2, "Context"),
  })),

  -- useCallback hook
  s("ucb", fmt([[
const {} = useCallback(() => {{
  {}
}}, [{}]);
]], {
    i(1, "callback"),
    i(2, "// callback logic"),
    i(3, ""),
  })),

  -- useMemo hook
  s("um", fmt([[
const {} = useMemo(() => {}, [{}]);
]], {
    i(1, "memoized"),
    i(2, "value"),
    i(3, ""),
  })),

  -- Interface
  s("int", fmt([[
interface {} {{
  {}
}}
]], {
    i(1, "Interface"),
    i(2, ""),
  })),

  -- Type
  s("typ", fmt([[
type {} = {};
]], {
    i(1, "Type"),
    i(2, "{}"),
  })),

  -- Import React
  s("imr", t("import React from 'react';")),

  -- Import useState
  s("imus", t("import { useState } from 'react';")),

  -- Import useEffect
  s("imue", t("import { useEffect } from 'react';")),

  -- Console log
  s("cl", fmt([[
console.log({});
]], {
    i(1, ""),
  })),

  -- Arrow function
  s("af", fmt([[
const {} = ({}) => {{
  {}
}};
]], {
    i(1, "func"),
    i(2, ""),
    i(3, ""),
  })),

  -- Map function
  s("map", fmt([[
{}.map(({}) => (
  {}
))
]], {
    i(1, "array"),
    i(2, "item"),
    i(3, "<div key={item.id}>{item}</div>"),
  })),

  -- Try-catch
  s("tc", fmt([[
try {{
  {}
}} catch (error) {{
  console.error({});
}}
]], {
    i(1, ""),
    i(2, "error"),
  })),
}
