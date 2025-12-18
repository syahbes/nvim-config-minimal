local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Import statement
  s("imp", fmt([[
import {{ {} }} from '{}';
]], {
    i(2, ""),
    i(1, ""),
  })),

  -- React Function Component (TypeScript style without React.FC)
  s("rfc", fmt([[
type {}Props = {{
  {}
}}

const {} = ({{ {} }}: {}Props) => {{
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
    i(3, "props"),
    f(function(args) return args[1][1] end, {1}),
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

  -- Console log
  s("log", fmt([[
console.log({});
]], {
    i(1, ""),
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

  --- End of React ---
  
  -- React Native Function Component with StyleSheet
  s("rnfc", fmt([[
import React from 'react';
import {{ View, Text, StyleSheet }} from 'react-native';

type {}Props = {{
  {}
}}

const {} = ({{ {} }}: {}Props) => {{
  return (
    <View style={{styles.container}}>
      {}
    </View>
  );
}};

const styles = StyleSheet.create({{
  container: {{
    flex: 1,
    {}
  }},
}});

export default {};
]], {
    i(1, "Component"),
    i(2, "// props"),
    f(function(args) return args[1][1] end, {1}),
    i(3, "props"),
    f(function(args) return args[1][1] end, {1}),
    i(4, "<Text>Component</Text>"),
    i(5, "justifyContent: 'center',\n    alignItems: 'center',"),
    f(function(args) return args[1][1] end, {1}),
  })),

  -- React Native Function Component (simple with StyleSheet)
  s("rnfcs", fmt([[
import {{ View, Text, StyleSheet }} from 'react-native';

const {} = ({}) => {{
  return (
    <View style={{styles.container}}>
      {}
    </View>
  );
}};

const styles = StyleSheet.create({{
  container: {{
    flex: 1,
    {}
  }},
}});

export default {};
]], {
    i(1, "Component"),
    i(2, ""),
    i(3, "<Text>Component</Text>"),
    i(4, ""),
    f(function(args) return args[1][1] end, {1}),
  })),

-- React Native Default Function (from filename)
  s("rndf", fmt([[
import {{ View, Text, StyleSheet }} from 'react-native';

export default function {}() {{
  return (
    <View style={{styles.container}}>
      {}
    </View>
  );
}}

const styles = StyleSheet.create({{
  container: {{
    flex: 1,
    {}
  }},
}});
]], {
    f(function()
      local filename = vim.fn.expand('%:t:r')
      if filename == '' then
        return 'Component'
      end
      
      -- Convert kebab-case or snake_case to PascalCase
      local result = filename:gsub("[-_](%w)", function(c)
        return c:upper()
      end)
      
      -- Capitalize first letter
      result = result:sub(1, 1):upper() .. result:sub(2)
      
      return result
    end),
    i(1, "<Text>Component</Text>"),
    i(2, "justifyContent: 'center',\n    alignItems: 'center',"),
  })),
  -- StyleSheet.create
  s("rnss", fmt([[
const styles = StyleSheet.create({{
  {}: {{
    {}
  }},
}});
]], {
    i(1, "container"),
    i(2, "flex: 1,"),
  })),
}
