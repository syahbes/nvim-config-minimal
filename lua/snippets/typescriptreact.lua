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
--- End of React ---
  -- React Native Function Component with StyleSheet
  s("rnfc", fmt([[
import React from 'react';
import {{ View, Text, StyleSheet }} from 'react-native';

interface {}Props {{
  {}
}}

const {}: React.FC<{}Props> = ({}) => {{
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
    f(function(args) return args[1][1] end, {1}),
    i(3, "props"),
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

  -- React Native Screen Component
  s("rnscreen", fmt([[
import React from 'react';
import {{ View, Text, StyleSheet, SafeAreaView }} from 'react-native';

interface {}Props {{
  {}
}}

const {}Screen: React.FC<{}Props> = ({}) => {{
  return (
    <SafeAreaView style={{styles.container}}>
      <View style={{styles.content}}>
        {}
      </View>
    </SafeAreaView>
  );
}};

const styles = StyleSheet.create({{
  container: {{
    flex: 1,
    backgroundColor: '#fff',
  }},
  content: {{
    flex: 1,
    padding: 16,
  }},
}});

export default {}Screen;
]], {
    i(1, "Home"),
    i(2, "// props"),
    f(function(args) return args[1][1] end, {1}),
    f(function(args) return args[1][1] end, {1}),
    i(3, "props"),
    i(4, "<Text>Screen</Text>"),
    f(function(args) return args[1][1] end, {1}),
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

  -- Pressable component
  s("rnpress", fmt([[
<Pressable
  onPress={{{}}}
  style={{styles.{}}}
>
  {}
</Pressable>
]], {
    i(1, "handlePress"),
    i(2, "button"),
    i(3, "<Text>Press me</Text>"),
  })),

  -- FlatList
  s("rnfl", fmt([[
<FlatList
  data={{{}}}
  keyExtractor={{(item) => item.{}}}
  renderItem={{({{ item }}) => (
    {}
  )}}
/>
]], {
    i(1, "data"),
    i(2, "id"),
    i(3, "<Text>{item.name}</Text>"),
  })),

  -- ScrollView
  s("rnsv", fmt([[
<ScrollView style={{styles.{}}}>
  {}
</ScrollView>
]], {
    i(1, "container"),
    i(2, ""),
  })),

  -- TextInput
  s("rnti", fmt([[
<TextInput
  style={{styles.input}}
  value={{{}}}
  onChangeText={{set{}}}
  placeholder="{}"
  {}
/>
]], {
    i(1, "text"),
    f(function(args)
      local state = args[1][1]
      return state:sub(1,1):upper() .. state:sub(2)
    end, {1}),
    i(2, "Enter text"),
    i(3, ""),
  })),

  -- TouchableOpacity
  s("rnto", fmt([[
<TouchableOpacity
  onPress={{{}}}
  style={{styles.{}}}
>
  {}
</TouchableOpacity>
]], {
    i(1, "handlePress"),
    i(2, "button"),
    i(3, "<Text>Press me</Text>"),
  })),

  -- Image
  s("rnimg", fmt([[
<Image
  source={{{}}}
  style={{styles.image}}
  {}
/>
]], {
    i(1, "require('./path/to/image.png')"),
    i(2, ""),
  })),

  -- Modal
  s("rnmodal", fmt([[
<Modal
  visible={{{}}}
  animationType="{}"
  transparent={{{}}}
  onRequestClose={{{}}}
>
  <View style={{styles.modalContainer}}>
    {}
  </View>
</Modal>
]], {
    i(1, "isVisible"),
    i(2, "slide"),
    i(3, "true"),
    i(4, "handleClose"),
    i(5, ""),
  })),

  -- Import React Native components
  s("imrn", fmt([[
import {{ {} }} from 'react-native';
]], {
    i(1, "View, Text, StyleSheet"),
  })),

  -- Dimensions hook
  s("rndim", fmt([[
const {{ width, height }} = Dimensions.get('{}');
]], {
    i(1, "window"),
  })),

  -- Animated value
  s("rnanim", fmt([[
const {} = useRef(new Animated.Value({})).current;
]], {
    i(1, "fadeAnim"),
    i(2, "0"),
  })),

  -- Navigation prop type
  s("rnnav", fmt([[
type {}NavigationProp = StackNavigationProp<RootStackParamList, '{}'>;
]], {
    i(1, "Home"),
    f(function(args) return args[1][1] end, {1}),
  })),

  -- useNavigation hook
  s("rnusenav", fmt([[
const navigation = useNavigation<{}NavigationProp>();
]], {
    i(1, "Home"),
  })),

  -- useRoute hook
  s("rnuseroute", fmt([[
const route = useRoute<RouteProp<RootStackParamList, '{}'>>();
]], {
    i(1, "Home"),
  })),

  -- KeyboardAvoidingView
  s("rnkav", fmt([[
<KeyboardAvoidingView
  behavior={{Platform.OS === 'ios' ? 'padding' : 'height'}}
  style={{styles.container}}
>
  {}
</KeyboardAvoidingView>
]], {
    i(1, ""),
  })),

  -- ActivityIndicator
  s("rnai", fmt([[
<ActivityIndicator size="{}" color="{}" />
]], {
    i(1, "large"),
    i(2, "#0000ff"),
  })),
}
